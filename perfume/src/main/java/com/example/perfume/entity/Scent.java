package com.example.perfume.entity;

//香りレパートリー管理クラス
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "scents")
@Data
public class Scent {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String name; // 香りの名前（Rose, Woodyなど）
	private String description;//香りの説明
	private Integer stock; // 在庫数
	private String imageUrl; // 写真
}