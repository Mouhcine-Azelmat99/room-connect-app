package com.lqt.repository;

import com.lqt.pojo.Landlord;
import com.lqt.pojo.Landlord;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface LandlordRepository extends JpaRepository<Landlord, Long> {
    @Query("SELECT l FROM landlords l WHERE l.user.username = ?1")
    Landlord findByUsername(String loggedInUsername);
//    Landlord findLandlordByUser_Username(String loggedInUsername);

}
