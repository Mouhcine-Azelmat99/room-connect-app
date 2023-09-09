package com.lqt.service.serviceImpl;


import com.lqt.pojo.Utilisateur;
import com.lqt.security.UserPrincipal;
import com.lqt.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;



@Service
public class CustomAuthentificationService implements UserDetailsService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public UserDetails loadUserByUsername(String username) {
		Utilisateur user = (Utilisateur) userRepository.findByUsername(username);
		if (user == null) {
			throw new UsernameNotFoundException(username);
		}
		return new UserPrincipal(user);
	}

	public void addUser(Utilisateur utilisateur){
		utilisateur.setPassword(passwordEncoder.encode(utilisateur.getPassword()));
		userRepository.save(utilisateur);
	}

	public List<Utilisateur> getAll(){
		return userRepository.findAll();
	}

	public void delete(Long id){
		userRepository.deleteById(id);
	}
	public void update(Utilisateur utilisateur){
		userRepository.save(utilisateur);
	}
	public Utilisateur getById(Long id){
		return userRepository.findById(id).get();
	}
}