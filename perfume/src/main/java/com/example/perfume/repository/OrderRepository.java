package com.example.perfume.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.perfume.entity.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
	// これだけで save(), findAll(), deleteById() などがすべて自動で使えるようになります！
	List<Order> findAllByOrderByOrderDateDesc();

	List<Order> findAllByOrderByIdDesc();
}