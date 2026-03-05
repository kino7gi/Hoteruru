// src/main/java/com/example/perfume/entity/Order.java
package com.example.perfume.entity;

import java.util.List;

import lombok.Data; // Lombokを使っている場合。なければGetter/Setterを手動作成

@Data
public class Order {
	private List<String> scents;
	private String bottleType;
	private String title;
	private String message;
	private int totalPrice;
}