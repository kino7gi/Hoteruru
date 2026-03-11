package com.example.perfume.model.dto;

import java.io.Serializable;
import java.util.List;

public class OrderForm implements Serializable {

	// 1. 香りのIDを複数受け取れるように List<Long> に変更
	private List<Long> scentIds;
	private Long bottleId;

	// 2. 表示用の名前リスト（変数名を Getter/Setter と一致させる）
	private List<String> scentNames;
	private String bottleName;

	private String postCode;
	private String address;
	private String userName;
	private String phoneNumber;

	// --- Getter / Setter ---

	// 香りのIDリスト用
	public List<Long> getScentIds() {
		return scentIds;
	}

	public void setScentIds(List<Long> scentIds) {
		this.scentIds = scentIds;
	}

	public Long getBottleId() {
		return bottleId;
	}

	public void setBottleId(Long bottleId) {
		this.bottleId = bottleId;
	}

	// 香りの名前リスト用（変数名 scentNames に合わせました）
	public List<String> getScentNames() {
		return scentNames;
	}

	public void setScentNames(List<String> scentNames) {
		this.scentNames = scentNames;
	}

	public String getBottleName() {
		return bottleName;
	}

	public void setBottleName(String bottleName) {
		this.bottleName = bottleName;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
}