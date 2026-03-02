package com.example.demo.event;

//イベントを発生させるクラス
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Component;

import com.example.demo.entity.User;

@Component
public class SignupEventPublisher {

	private final ApplicationEventPublisher applicationEventPublisher;

	public SignupEventPublisher(ApplicationEventPublisher applicationEventPublisher) {
		this.applicationEventPublisher = applicationEventPublisher;
	}

	//イベントを発生させたいタイミングでこのメソッドを呼び出す
	public void publishSignupEvent(User user, String requestUrl) {
		applicationEventPublisher.publishEvent(
				new SignupEvent(this, user, requestUrl));
	}
}