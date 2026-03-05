package com.example.perfume.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.example.perfume.entity.Order;
import com.example.perfume.dto.OrderForm; // フォームデータ（DTO）をインポート

@Service
public class PerfumeService {

	/**
	 * OrderForm(DTO)を受け取り、バリデーション済みの情報をOrder(Entity)に変換・構築します
	 */
	public Order createOrder(OrderForm form) {
		Order order = new Order();

		// 1. 基本情報の詰め替え（DTO -> Entity）
		List<String> scents = form.getScents();
		order.setScents(scents);
		order.setBottleType(form.getBottleType());

		// 2. お届け先情報の詰め替え（ここを新規追加）
		order.setUserName(form.getUserName());
		order.setUserAddress(form.getUserAddress());

		int scentCount = (scents != null) ? scents.size() : 0;

		// 3. 金額計算
		order.setTotalPrice(calculatePrice(scentCount));

		// 4. タイトルとメッセージの判定
		determineBlendDetails(order, scents, scentCount);

		return order;
	}

	// 金額計算ロジック
	private int calculatePrice(int count) {
		if (count == 1)
			return 8000;
		if (count >= 2)
			return 12000;
		return 0;
	}

	// 調合の詳細（タイトル・メッセージ）決定ロジック
	private void determineBlendDetails(Order order, List<String> scents, int count) {
		String title = "Custom Blend";
		String message = "あなたのために、特別な香りを調合いたします。";

		if (count >= 2) {
			if (scents.contains("Rose") && scents.contains("Citrus")) {
				title = "朝露の庭園";
				message = "華やかなローズに爽やかなシトラスが重なる、目覚めの香りです。";
			} else if (scents.contains("Rose") && scents.contains("Lavender")) {
				title = "優雅な休息";
				message = "高貴なローズと安らぎのラベンダーが包み込む、贅沢なひととき。";
			} else if (scents.contains("Citrus") && scents.contains("Woody")) {
				title = "深呼吸の森";
				message = "清涼感のあるシトラスと、落ち着いたウッディが調和する知的な香り。";
			} else if (scents.contains("Lavender") && scents.contains("Woody")) {
				title = "月夜の瞑想";
				message = "静かな森に漂うラベンダーのような、深く穏やかな香りです。";
			}
		} else if (count == 1) {
			title = scents.get(0) + " Solo";
			message = scents.get(0) + "の個性を活かした、シンプルな調合でお届けします。";
		} else {
			title = "Pure Base";
			message = "香料を選択せずに、ベースオイルのみで承ります。";
		}

		order.setTitle(title);
		order.setMessage(message);
	}
}