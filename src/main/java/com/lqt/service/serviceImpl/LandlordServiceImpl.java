package com.lqt.service.serviceImpl;

import com.lqt.pojo.Landlord;
import com.lqt.repository.LandlordRepository;
import com.lqt.service.LandlordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LandlordServiceImpl implements LandlordService {
    @Autowired
    private LandlordRepository repository;

    public Landlord getByUsername(String name){
        return repository.findByUsername(name);
    }
}
