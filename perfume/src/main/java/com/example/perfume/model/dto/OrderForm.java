package com.example.perfume.model.dto;

import java.io.Serializable;

public class OrderForm implements Serializable {

	// IDはリポジトリの型に合わせて Long に変更
	private Long scentId;
	private Long bottleId;

	private String scentName; // 表示用の名前
	private String bottleName; // ボトルの名前
	private String postCode;
	private String address; // 住所
	private String userName; // 氏名
	private String phoneNumber;

	// --- Getter / Setter ---

	public Long getScentId() {
		return scentId;
	}

	public void setScentId(Long scentId) {
		this.scentId = scentId;
	}

	public Long getBottleId() {
		return bottleId;
	}

	public void setBottleId(Long bottleId) {
		this.bottleId = bottleId;
	}

	public String getScentName() {
		return scentName;
	}

	public void setScentName(String scentName) {
		this.scentName = scentName;
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