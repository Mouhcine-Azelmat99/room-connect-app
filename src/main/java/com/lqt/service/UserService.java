package com.lqt.service;

import com.lqt.pojo.Utilisateur;

import java.util.List;

public interface UserService {
    void save(Utilisateur user);
    List<Utilisateur> getAll();
    void update(Utilisateur user);
    void delete(Long id);

    boolean findByUsername(String username);

    void saveUser(Utilisateur user);

    Utilisateur getByUserName(String userName);
}