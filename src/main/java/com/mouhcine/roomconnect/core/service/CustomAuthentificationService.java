package com.mouhcine.roomconnect.core.service;


import com.mouhcine.roomconnect.core.bo.Utilisateur;
import com.mouhcine.roomconnect.core.config.UserPrincipal;
import com.mouhcine.roomconnect.core.dao.UtilisateurDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *
 * Cette classe contient le gestionnaire d'authentification personnalisé
 *
 */

@Service
public class CustomAuthentificationService implements UserDetailsService {

	@Autowired
	private UtilisateurDao userRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public UserDetails loadUserByUsername(String username) {
		Utilisateur user = (Utilisateur) userRepository.findByName(username);
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