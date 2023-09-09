package com.lqt.service;

import com.lqt.pojo.PropertyListing;

import java.util.List;

public interface PropertyListingService {
    List<PropertyListing> getAllListings();
    PropertyListing getPropertyListingById(Long id);
    void addPropertyListing(PropertyListing propertyListing);
    void editPropertyListing(PropertyListing propertyListing);
    void delete(Long propertyListingid);

}
