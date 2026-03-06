package com.example.perfume.model.dto;

// Getter, Setterを自動生成（Lombok使用時）
public class OrderForm {

	private String scentId; // 香りのID
	private String scentName;//表示用の名前
	private String bottleId; // ボトルのID
	private String bottleName;//ボトルの名前
	private String postCode;
	private String address; // 住所
	private String userName; // 氏名
	private String phoneNumber;

	public String getScentId() {
		return scentId;
	}

	public void setScentId(String scentId) {
		this.scentId = scentId;
	}

	public String getBottleId() {
		return bottleId;
	}

	public void setBottleId(String bottleId) {
		this.bottleId = bottleId;
	}

	public String getBottleName() {
		return bottleName;
	}

	public void setBottleName(String bottleName) {
		this.bottleName = bottleName;
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

	public String getScentName() {
		return scentName;
	}

	public void setScentName(String scentName) {
		this.scentName = scentName;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
}