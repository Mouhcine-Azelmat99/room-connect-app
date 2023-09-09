package com.lqt.repository;

import com.lqt.pojo.Utilisateur;
import com.lqt.pojo.Utilisateur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Set;


@Repository
public interface UserRepository extends JpaRepository<Utilisateur, Long>{
    Utilisateur findByUsername(String username);
    Utilisateur findByEmail(String email);

    Set<Utilisateur> findByUsernameOrEmail(String username, String email);
}
