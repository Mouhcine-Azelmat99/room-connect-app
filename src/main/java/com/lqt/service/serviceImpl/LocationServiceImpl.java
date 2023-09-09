package com.lqt.service.serviceImpl;

import com.lqt.pojo.Location;
import com.lqt.repository.LocationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LocationServiceImpl {

    @Autowired
    private LocationRepository locationRepository;
    public void save(Location location){
        locationRepository.save(location);
    }
}
