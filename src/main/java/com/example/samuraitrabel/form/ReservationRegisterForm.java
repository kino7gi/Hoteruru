package com.example.samuraitrabel.form;

//データを格納するためだけの役割のもの
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor

public class ReservationRegisterForm {
	public ReservationRegisterForm() {
	}
	private Integer houseId;
	private Integer userId;
	private String checkinDate;
	private String checkoutDate;
	private Integer numberOfPeople;
	private Integer amount;
	
}
