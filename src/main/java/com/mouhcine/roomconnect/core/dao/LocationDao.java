package com.mouhcine.roomconnect.core.dao;

import com.mouhcine.roomconnect.core.bo.Location;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LocationDao extends JpaRepository<Location,Long> {
}
