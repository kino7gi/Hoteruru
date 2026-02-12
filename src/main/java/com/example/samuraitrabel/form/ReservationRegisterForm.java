package com.example.samuraitrabel.form;

//データを格納するためだけの役割のもの
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor

public class ReservationRegisterForm {
	public ReservationRegisterForm() {
		// TODO 自動生成されたコンストラクター・スタブ
	}
	private Integer houseId;
	private Integer userId;
	private String checkinDate;
	private String CkeckoutDate;
	private Integer numberOfPeople;
	private Integer amount;
	
}
