package com.lqt.service.serviceImpl;

import com.lqt.pojo.PropertyListing;
import com.lqt.repository.PropertyListingRepository;
import com.lqt.service.PropertyListingService;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PropertyListingServiceImpl implements PropertyListingService {

    @Autowired
    private PropertyListingRepository propertyListingRepository;

    @Override
    public List<PropertyListing> getAllListings() {
        return propertyListingRepository.findAll();
    }

    @Override
    public PropertyListing getPropertyListingById(Long id) {
        return propertyListingRepository.findById(id).orElse(null);
    }

    @Override
    @Transactional
    public void addPropertyListing(PropertyListing propertyListing) {
        propertyListingRepository.save(propertyListing);
    }

    @Override
    @Transactional
    public void editPropertyListing(PropertyListing propertyListing) {
        propertyListingRepository.save(propertyListing);
    }

    @Override
    public void delete(Long propertyListingid) {
        propertyListingRepository.deleteById(propertyListingid);
    }
}
