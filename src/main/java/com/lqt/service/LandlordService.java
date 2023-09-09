package com.lqt.service;

import com.lqt.pojo.Landlord;
import com.lqt.repository.LandlordRepository;
import org.springframework.beans.factory.annotation.Autowired;

public interface LandlordService {

    public Landlord getByUsername(String name);
}
