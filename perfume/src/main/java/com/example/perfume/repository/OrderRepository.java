// src/main/java/com/example/perfume/repository/OrderRepository.java
package com.example.perfume.repository;

import org.springframework.stereotype.Repository;

import com.example.perfume.entity.Order;

@Repository
public class OrderRepository {
	// 実際にはここでDB保存（JdbcTemplateやJPA）を行いますが、
	// 今回はメモリ保持やロギングのみの想定です
	public void save(Order order) {
		System.out.println("Order saved: " + order.getTitle());
	}
}