package com.lqt.service.serviceImpl;

import com.lqt.pojo.Utilisateur;
import com.lqt.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.lqt.repository.UserRepository;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;


    @Override
    public void save(Utilisateur user) {
        userRepository.save(user);
    }

    @Override
    public List<Utilisateur> getAll() {
        return  userRepository.findAll();
    }

    @Override
    public void update(Utilisateur user) {

    }

    @Override
    public void delete(Long id) {

    }
}
