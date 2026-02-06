package com.example.samuraitrabel.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.samuraitrabel.entity.User;
import com.example.samuraitrabel.repository.UserRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	private final UserRepository userRepository;

	public UserDetailsServiceImpl(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		try {
			User user = userRepository.findByEmail(email);
			if (user == null) {
				throw new UsernameNotFoundException("ユーザーが見つかりませんでした。");
			}

			Collection<SimpleGrantedAuthority> authorities = new ArrayList<>();
			String roleName = user.getRole().getName(); 

			authorities.add(new SimpleGrantedAuthority(roleName));

			return new UserDetailsImpl(user, authorities);
		} catch (Exception e) {
			throw new UsernameNotFoundException("ユーザー情報の取得中にエラーが発生しました。");
		}
	}
}