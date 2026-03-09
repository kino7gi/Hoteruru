package com.example.perfume.entity;
//ボトルの種類を管理するクラス

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "bottle")
@Data
public class Bottle {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String name; // ボトルの名前（Square,Roundなど）
	private String capacity; //内容量
	private Integer stock;//在庫数
	private String imageUrl; //写真
}