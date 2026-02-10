package com.example.samuraitrabel.event;

//Listenerクラスにイベントが発生したことを知らせるクラス
//イベント情報を保持できる
import org.springframework.context.ApplicationEvent;

import com.example.samuraitrabel.entity.User;

import lombok.Getter;

@Getter

public class SignupEvent extends ApplicationEvent {
	private User user;
	private String requestUrl;

	public SignupEvent(Object source, User user, String requestUrl) {
		super(source);
		this.user = user;
		this.requestUrl = requestUrl;
	}

}
