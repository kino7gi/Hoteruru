// src/main/java/com/example/perfume/dto/OrderForm.java
package com.example.perfume.dto;

import java.util.List;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

public class OrderForm {
	private List<String> scents;
	private String bottleType;
	private String userName;
	private String userAddress;

	// --- Getter (取得用) ---
	public List<String> getScents() {
		return scents;
	}

	public String getBottleType() {
		return bottleType;
	}

	public String getUserName() {
		return userName;
	}

	public String getUserAddress() {
		return userAddress;
	}

	// --- Setter (代入用) ---
	public void setScents(List<String> scents) {
		this.scents = scents;
	}

	public void setBottleType(String bottleType) {
		this.bottleType = bottleType;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
}