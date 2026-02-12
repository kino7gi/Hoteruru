package com.example.moattravel.repository;
//CRUD処理を行う。House.javaと対応
import org.springframework.data.jpa.repository.JpaRepository;//CRUDに必要なメソッドが利用可能になる

import com.example.moattravel.entity.House;

//House→エンティティのクラス型、Integer→主キーのデータ型(整数)
public interface HouseRepository extends JpaRepository<House, Integer> {

}
