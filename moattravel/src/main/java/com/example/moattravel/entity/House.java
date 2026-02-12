package com.example.moattravel.entity;
//javaとDBを繋ぐクラス
import java.sql.Timestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity //エンティティとして機能するようになる
@Table(name = "houses") //DBのhousesが対応する
@Data //ゲッター、セッターを自動生成する
public class House {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) //勝手にIDを作ってくれる
	@Column(name = "id")
	private Integer id;

	@Column(name = "name")
	private String name;

	@Column(name = "image_name") //カラムによって、DBとjavaの名前が違くても対応する
	private String imageName;

	@Column(name = "description")
	private String description;

	@Column(name = "price")
	private Integer price;

	@Column(name = "capacity")
	private Integer capacity;

	@Column(name = "postal_code")
	private String postalCode;

	@Column(name = "address")
	private String address;

	@Column(name = "phone_number")
	private String phoneNumber;

	//tureにするとサイトを更新するたびに日時を入れなくてはならなくなる
	@Column(name = "created_at", insertable = false, updatable = false)
	private Timestamp createdAt;

	@Column(name = "updated_at", insertable = false, updatable = false)
	private Timestamp updatedAt;
}
