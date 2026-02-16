package com.example.moattravel.event;
//トークン発行に必要なクラス
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Component;

import com.example.moattravel.entity.User;

@Component
public class SignupEventPublisher {
	
	//イベント発火！
	private final ApplicationEventPublisher applicationEventPublisher;

	public SignupEventPublisher(ApplicationEventPublisher applicationEventPublisher) {
		this.applicationEventPublisher = applicationEventPublisher;
	}
	
	//イベントを発生させたいタイミングでこれを呼び出すとでてくる
	public void publishSignupEvent(User user, String requestUrl) {
		//使用者側にデータを渡す。
		applicationEventPublisher.publishEvent(new SignupEvent(this, user, requestUrl));
	}
}
