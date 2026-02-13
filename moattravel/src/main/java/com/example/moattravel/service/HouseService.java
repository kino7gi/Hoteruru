package com.example.moattravel.service;
//民宿の登録、更新を担当するクラス
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;//インターフェース。ファイルの道を表す
import java.nio.file.Paths;//クラス。Pathを作る為の道具
import java.util.UUID;//ほぼ重複しないIDのこと。例）学籍番号

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.moattravel.entity.House;
import com.example.moattravel.form.HouseEditForm;
import com.example.moattravel.form.HouseRegisterForm;
import com.example.moattravel.repository.HouseRepository;

@Service
public class HouseService {
	
//DB操作担当リポジトリ
	private final HouseRepository houseRepository;

	public HouseService(HouseRepository houseRepository) {
		this.houseRepository = houseRepository;
	}

	//データの登録処理メソッド
	@Transactional //データベースの操作をひとまとまりにするもの
	public void create(HouseRegisterForm houseRegisterForm) {
		
		//エンティティを作る準備
		House house = new House();
		//画像ファイル取得
		MultipartFile imageFile = houseRegisterForm.getImageFile();

		if (!imageFile.isEmpty()) {
			String imageName = imageFile.getOriginalFilename();
			//ファイル名の変更処理メソッド
			String hashedImageName = generateNewFileName(imageName);//UUIDに変換
			Path filePath = Paths.get("src/main/resources/static/storage/" + hashedImageName);

			//別名に変更した後のファイル名をつかってコピーを作成するメソッド
			copyImageFile(imageFile, filePath);
			house.setImageName(hashedImageName);
		}
		
		//エンティティへ値をコピー
		house.setName(houseRegisterForm.getName());
		house.setDescription(houseRegisterForm.getDescription());
		house.setPrice(houseRegisterForm.getPrice());
		house.setCapacity(houseRegisterForm.getCapacity());
		house.setPostalCode(houseRegisterForm.getPostalCode());
		house.setAddress(houseRegisterForm.getAddress());
		house.setPhoneNumber(houseRegisterForm.getPhoneNumber());
		
		//これで登録完了
		houseRepository.save(house);
	}

	@Transactional
	public void update(HouseEditForm houseEditForm) {

		House house = houseRepository.getReferenceById(houseEditForm.getId());
		MultipartFile imageFile = houseEditForm.getImageFile();

		if (!imageFile.isEmpty()) {
			String imageName = imageFile.getOriginalFilename();
			String hashedImageName = generateNewFileName(imageName);
			Path filePath = Paths.get("src/main/resources/static/storage/" + hashedImageName);

			copyImageFile(imageFile, filePath);
			house.setImageName(hashedImageName);
		}

		house.setName(houseEditForm.getName());
		house.setDescription(houseEditForm.getDescription());
		house.setPrice(houseEditForm.getPrice());
		house.setCapacity(houseEditForm.getCapacity());
		house.setPostalCode(houseEditForm.getPostalCode());
		house.setAddress(houseEditForm.getAddress());
		house.setPhoneNumber(houseEditForm.getPhoneNumber());

		houseRepository.save(house);
	}

	// UUIDを使って生成したファイル名を返す
	public String generateNewFileName(String fileName) {
		String[] fileNames = fileName.split("\\.");

		for (int i = 0; i < fileNames.length - 1; i++) {
			fileNames[i] = UUID.randomUUID().toString();
		}
		String hashedFileName = String.join(".", fileNames);
		return hashedFileName;

	}

	// 画像ファイルを指定したファイルにコピーする
	//実際にサーバーに保存
	public void copyImageFile(MultipartFile imageFile, Path filePath) {
		try {
			Files.copy(imageFile.getInputStream(), filePath);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
