package com.example.samuraitrabel.security;

//UserDetailを実装するためのクラス
//
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.example.samuraitrabel.entity.User;

public class UserDetailsImpl implements UserDetails {
	private final User user;
	private final Collection<SimpleGrantedAuthority> authorities;

	public UserDetailsImpl(User user, Collection<SimpleGrantedAuthority> authorities) {
	    this.user = user;
	    this.authorities = authorities;
	}

	public User getUser() {
		return user;
	}

	
	//ハッシュ化済みのパスワードを返す
	@Override
	public String getPassword() {
		return user.getPassword();
	}

	//ログイン時に利用するユーザー名（メールアドレス）を返す
	@Override
	public String getUsername() {
		return user.getEmail();
	}

	//ロールのコレクションを返す
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	//アカウントが期限切れでなければtrueをかえす
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	//ユーザーがロックされていなければtrueを返す
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	//ユーザーのパスワードが期限切れ出なけれtrueを返す
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	//ユーザーが有効であればtrueを返す
	@Override
	public boolean isEnabled() {
		return user.getEnabled();
	}
}