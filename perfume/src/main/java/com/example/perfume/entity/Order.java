package com.example.perfume.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "orders") // データベース上のテーブル名
@Data
public class Order {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id; // 自動採番される注文ID

	// ユーザー情報
	private String userName;
	private String postCode;
	private String address;
	private String phoneNumber;

	// 注文内容（あとでマスタが変わってもいいように名前で保存）
	private String scentName;
	private String bottleName;

	// 注文日時
	private LocalDateTime orderDate;

	// 保存する瞬間に現在時刻を自動セットする設定
	@PrePersist
	protected void onCreate() {
		this.orderDate = LocalDateTime.now();
	}

	/* * 手動でGetter/Setterを作る場合（Lombokが効かない時用）
	 */
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
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

	public LocalDateTime getOrderDate() {
		return orderDate;
	}
}