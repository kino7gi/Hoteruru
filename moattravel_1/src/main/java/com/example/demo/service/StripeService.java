package com.example.demo.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.example.demo.form.ReservationRegisterForm;
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.Event;
import com.stripe.model.checkout.Session;
import com.stripe.param.checkout.SessionCreateParams;
import com.stripe.param.checkout.SessionRetrieveParams;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j; // ログ出力用（推奨）

@Service
@Slf4j
public class StripeService {

	@Value("${stripe.api-key}")
	private String stripeApiKey;

	private final ReservationService reservationService;

	public StripeService(ReservationService reservationService) {
		this.reservationService = reservationService;
	}

	/**
	 * Stripe Checkoutセッションを作成し、セッションIDを返す
	 */
	public String createStripeSession(String houseName,
			ReservationRegisterForm reservationRegisterForm,
			HttpServletRequest httpServletRequest) {

		Stripe.apiKey = stripeApiKey;
		String requestUrl = httpServletRequest.getRequestURL().toString();

		// メタデータの作成（共通利用）
		Map<String, String> metadata = Map.of(
				"houseId", reservationRegisterForm.getHouseId().toString(),
				"userId", reservationRegisterForm.getUserId().toString(),
				"checkinDate", reservationRegisterForm.getCheckinDate(),
				"checkoutDate", reservationRegisterForm.getCheckoutDate(),
				"numberOfPeople", reservationRegisterForm.getNumberOfPeople().toString(),
				"amount", reservationRegisterForm.getAmount().toString());

		SessionCreateParams params = SessionCreateParams.builder()
				.addPaymentMethodType(SessionCreateParams.PaymentMethodType.CARD)
				.addLineItem(
						SessionCreateParams.LineItem.builder()
								.setPriceData(
										SessionCreateParams.LineItem.PriceData.builder()
												.setProductData(
														SessionCreateParams.LineItem.PriceData.ProductData.builder()
																.setName(houseName)
																.build())
												.setUnitAmount((long) reservationRegisterForm.getAmount())
												.setCurrency("jpy")
												.build())
								.setQuantity(1L)
								.build())
				.setMode(SessionCreateParams.Mode.PAYMENT)
				.setSuccessUrl(
						requestUrl.replaceAll("/houses/[0-9]+/reservations/confirm", "") + "/reservations?reserved")
				.setCancelUrl(requestUrl.replace("/reservations/confirm", ""))
				// Session自体にメタデータを保持（Webhookで直接取得しやすくなる）
				.putAllMetadata(metadata)
				// 支払い完了後のPaymentIntentにもメタデータを引き継ぐ
				.setPaymentIntentData(
						SessionCreateParams.PaymentIntentData.builder()
								.putAllMetadata(metadata)
								.build())
				.build();

		try {
			Session session = Session.create(params);
			return session.getId();
		} catch (StripeException e) {
			log.error("Stripeセッション作成中にエラーが発生しました: {}", e.getMessage());
			return "";
		}
	}

	/**
	 * Webhookイベントを受け取り、予約データをDBに保存する
	 * JSONをライブラリに任せてまるごとJavaオブジェクトに変換する←正規ルート
	 * JSONを単なる「文字列」として読み込み、正規表現を使ってIDだけを強引に引き出した。
	 * ライブラリの自動変換に頼らず、
	 */
	public void processSessionCompleted(Event event) {
		log.info("★★ Stripe Webhook 処理開始 (Event ID: {}) ★★", event.getId());

		String sessionId = null;

		// 1. Raw JSON から直接 ID を抽出する（型の不一致エラーを回避）
		try {
			// ここを Optional ではなく直接 String で受け取ります
			String rawJson = event.getDataObjectDeserializer().getRawJson();

			if (rawJson != null && !rawJson.isEmpty()) {
				// 正規表現で "id": "cs_test_..." の部分を抽出
				java.util.regex.Pattern pattern = java.util.regex.Pattern.compile("\"id\":\\s*\"([^\"]+)\"");
				java.util.regex.Matcher matcher = pattern.matcher(rawJson);
				if (matcher.find()) {
					sessionId = matcher.group(1);
				}
			}
		} catch (Exception e) {
			log.error("❌ Raw JSON からの ID 抽出に失敗しました: {}", e.getMessage());
		}

		if (sessionId == null) {
			log.error("❌ Session ID が取得できないため、処理を中断します。");
			return;
		}

		try {
			Stripe.apiKey = stripeApiKey;
			log.info("取得した Session ID: {} を使ってStripeからデータを引き直します...", sessionId);

			// 2. ID を使ってデータを再取得
			SessionRetrieveParams params = SessionRetrieveParams.builder()
					.addExpand("payment_intent")
					.build();

			Session session = Session.retrieve(sessionId, params, null);

			// 3. メタデータの抽出
			Map<String, String> metadata = session.getMetadata();

			if ((metadata == null || metadata.isEmpty()) && session.getPaymentIntentObject() != null) {
				log.info("Sessionのメタデータが空のため、PaymentIntentのメタデータを使用します。");
				metadata = session.getPaymentIntentObject().getMetadata();
			}

			if (metadata != null && !metadata.isEmpty()) {
				reservationService.create(metadata);
				log.info("★★ DB保存処理が正常に完了しました (House ID: {}, User ID: {}) ★★",
						metadata.get("houseId"), metadata.get("userId"));
			} else {
				log.error("❌ メタデータが取得できませんでした。");
			}

		} catch (StripeException e) {
			log.error("❌ Stripe API通信エラー: {}", e.getMessage());
		} catch (Exception e) {
			log.error("❌ 予期せぬエラー: ", e);
		}
	}

}