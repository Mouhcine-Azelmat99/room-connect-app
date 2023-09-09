package com.lqt.repository;

import com.lqt.pojo.PropertyListing;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PropertyListingRepository extends JpaRepository<PropertyListing, Long> {

    // Define custom query methods if needed
    // For example, you can define methods to search for property listings by specific criteria
}
