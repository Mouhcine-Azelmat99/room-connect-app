package com.mouhcine.roomconnect.core.dao;

import com.mouhcine.roomconnect.core.bo.Tenant;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TenantDao extends JpaRepository<Tenant,Long> {
}
