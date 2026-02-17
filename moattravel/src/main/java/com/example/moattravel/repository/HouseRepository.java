package com.example.moattravel.repository;
//CRUD処理を行う。House.javaと対応
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;//CRUDに必要なメソッドが利用可能になる

import com.example.moattravel.entity.House;

//House→エンティティのクラス型、Integer→主キーのデータ型(整数)
public interface HouseRepository extends JpaRepository<House, Integer> {
	//Houseからキーワードを含む情報をページ付きで表示するメソッド
	//find→データを取得　ByName→エンティティのnameフィールドを条件　Like→SQLのLIKE条件(部分一致検索)
	public Page<House> findByNameLike(String keyword, Pageable pageable);
	public Page<House> findByNameLikeOrAddressLike(String nameKeyword, String addressKeyword, Pageable pageable);
	public Page<House> findByAddressLike(String area, Pageable pageable);
	public Page<House> findByPriceLessThanEqual(Integer price, Pageable pageable);
}
