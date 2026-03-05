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
	private String userName;
	private String userAddress;
	private int totalPrice;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
}