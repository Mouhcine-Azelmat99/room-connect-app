package com.lqt.repository;

import com.lqt.pojo.Tenant;
import com.lqt.pojo.Utilisateur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TenantRepository extends JpaRepository<Tenant, Long> {
    Tenant findByUser(Utilisateur user);
}
