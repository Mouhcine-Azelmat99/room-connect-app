package com.mouhcine.roomconnect.core.dao;

import com.mouhcine.roomconnect.core.bo.Utilisateur;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UtilisateurDao extends JpaRepository<Utilisateur,Long> {
    public Utilisateur findByName(String name);
}
