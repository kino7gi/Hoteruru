package com.example.moattravel.repository;

//CRUD処理を行う。House.javaと対応
//ページネーションを作成しないからList
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;//CRUDに必要なメソッドが利用可能になる

import com.example.moattravel.entity.House;

//houseをエンティティにする
//CRUDを処理
//Houseテーブルを主キーIntegerで操作します
public interface HouseRepository extends JpaRepository<House, Integer> {
	
	//Likeで部分一致検索
	public Page<House> findByNameLike(String keyword, Pageable pageable);

	public Page<House> findByNameLikeOrAddressLikeOrderByCreatedAtDesc(
			String nameKeyword,
			String addressKeyword,
			Pageable pageable);

	public Page<House> findByNameLikeOrAddressLikeOrderByPriceAsc(
			String nameKeyword,
			String addressKeyword,
			Pageable pageable);

	public Page<House> findByAddressLikeOrderByCreatedAtDesc(
			String area,
			Pageable pageable);

	public Page<House> findByAddressLikeOrderByPriceAsc(
			String area,
			Pageable pageable);

	public Page<House> findByPriceLessThanEqualOrderByCreatedAtDesc(
			Integer price,
			Pageable pageable);

	public Page<House> findByPriceLessThanEqualOrderByPriceAsc(
			Integer price,
			Pageable pageable);

	public Page<House> findAllByOrderByCreatedAtDesc(Pageable pageable);

	public Page<House> findAllByOrderByPriceAsc(Pageable pageable);

	public List<House> findTop10ByOrderByCreatedAtDesc();
}
