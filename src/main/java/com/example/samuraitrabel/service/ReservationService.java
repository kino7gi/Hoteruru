package com.example.samuraitrabel.service;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.samuraitrabel.entity.House;
import com.example.samuraitrabel.entity.Reservation;
import com.example.samuraitrabel.entity.User;
import com.example.samuraitrabel.form.ReservationRegisterForm;
import com.example.samuraitrabel.repository.HouseRepository;
import com.example.samuraitrabel.repository.ReservationRepository;
import com.example.samuraitrabel.repository.UserRepository;

@Service

public class ReservationService {

	private final ReservationRepository reservationRepository;
	private final HouseRepository houseRepository;
	private final UserRepository userRepository;

	public ReservationService(
			ReservationRepository reservationRepository,
			HouseRepository houseRepository,
			UserRepository userRepository) {
		this.reservationRepository = reservationRepository;
		this.houseRepository = houseRepository;
		this.userRepository = userRepository;
	}

	@Transactional
	public void create(ReservationRegisterForm reservationRegisterForm) {
		Reservation reservation = new Reservation();
		Integer userId = reservationRegisterForm.getUserId();
		House house = houseRepository.getReferenceById(reservationRegisterForm.getHouseId());
		User user = userRepository.getReferenceById(userId);
		LocalDate checkinDate = LocalDate.parse(reservationRegisterForm.getCheckinDate());
		LocalDate checkoutDate = LocalDate.parse(reservationRegisterForm.getCheckoutDate());
		Integer numberOfPeople = reservationRegisterForm.getNumberOfPeople();
		Integer amount = reservationRegisterForm.getAmount();

		reservation.setHouse(house);
		reservation.setUser(user);
		reservation.setCheckinDate(checkinDate);
		reservation.setCheckoutDate(checkoutDate);
		reservation.setNumberOfPeople(reservationRegisterForm.getNumberOfPeople());
		reservation.setAmount(reservationRegisterForm.getAmount());

		reservationRepository.save(reservation);
	}
	public void create(Map<String, String> metadata) {

		ReservationRegisterForm form = new ReservationRegisterForm();
		form.setHouseId(Integer.valueOf(metadata.get("houseId")));
		form.setUserId(Integer.valueOf(metadata.get("userId")));
		form.setCheckinDate(metadata.get("checkinDate"));
		form.setCheckoutDate(metadata.get("checkoutDate"));
		form.setNumberOfPeople(Integer.valueOf(metadata.get("numberOfPeople")));
		form.setAmount(Integer.valueOf(metadata.get("amount")));

		// 既存ロジックを再利用
		create(form);
	}

	//宿泊人数が定員以下かどうかをチェックする

	public boolean isWithinCapacity(Integer numberOfPeople, Integer capacity) {
		return numberOfPeople <= capacity;
	}

	//宿泊料金を計算する

	public Integer calculateAmount(LocalDate checkinDate, LocalDate checkoutDate, Integer price) {
		long numberOfNights = ChronoUnit.DAYS.between(checkinDate, checkoutDate);
		int amount = price * (int) numberOfNights;
		return amount;
	}

}
