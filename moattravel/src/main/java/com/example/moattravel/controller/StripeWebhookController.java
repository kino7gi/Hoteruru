package com.example.moattravel.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;

import com.example.moattravel.service.StripeService;
import com.stripe.Stripe;
import com.stripe.exception.SignatureVerificationException;
import com.stripe.model.Event;
import com.stripe.net.Webhook;

@Controller
public class StripeWebhookController {

	private final StripeService stripeService;

	@Value("${stripe.api-key}")
	private String stripeApiKey;

	@Value("${stripe.webhook-secret}")
	private String webhookSecret;

	public StripeWebhookController(StripeService stripeService) {
		this.stripeService = stripeService;
	}

	@PostMapping("/stripe/webhook")
	public ResponseEntity<String> webhook(@RequestBody String payload,
			@RequestHeader("Stripe-Signature") String sigHeader) {

		Stripe.apiKey = stripeApiKey;
		Event event;

		try {
			event = Webhook.constructEvent(payload, sigHeader, webhookSecret);
		} catch (SignatureVerificationException e) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		}

		//確認のために入れた
		System.out.println("Webhook受信！");
		System.out.println("Event type: " + event.getType());

		//checkout.session.completedと＝だったときにStripeServiceのprocessSessionCompleted()メソッドを呼び出す
		if ("checkout.session.completed".equals(event.getType())) {
			System.out.println("🔥 checkout.session.completed に入りました");
		    stripeService.processSessionCompleted(event);
		    System.out.println("🔥 stripeService 呼び出し完了");
		}

		return new ResponseEntity<>("Success", HttpStatus.OK);
	}
}
