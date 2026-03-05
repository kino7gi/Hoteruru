// src/main/java/com/example/perfume/service/PerfumeService.java
package com.example.perfume.service;

import com.example.perfume.entity.Order;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class PerfumeService {

	public Order createOrder(List<String> scents, String bottleType) {
		Order order = new Order();
		order.setScents(scents);
		order.setBottleType(bottleType);

		int scentCount = (scents != null) ? scents.size() : 0;

		// 1. 金額計算
		order.setTotalPrice(calculatePrice(scentCount));

		// 2. メッセージ判定
		determineBlendDetails(order, scents, scentCount);

		return order;
	}

	private int calculatePrice(int count) {
		if (count == 1)
			return 8000;
		if (count >= 2)
			return 12000;
		return 0;
	}

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