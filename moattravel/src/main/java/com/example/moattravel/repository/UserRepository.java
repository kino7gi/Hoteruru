package com.example.moattravel.repository;
//メールアドレスでユーザーを検索する
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.moattravel.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	
	public User findByEmail(String email);

}
