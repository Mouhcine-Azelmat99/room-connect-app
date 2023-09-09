package com.mouhcine.roomconnect.core.service;

import com.mouhcine.roomconnect.core.bo.Tenant;
import com.mouhcine.roomconnect.core.dao.TenantDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TenantService {

    @Autowired
    private TenantDao tenantDao;

    public List<Tenant> getAll(){
        return tenantDao.findAll();
    }

    public void add(Tenant t){
        tenantDao.save(t);
    }

    public void edit(Tenant t){
        tenantDao.save(t);
    }

    public void delete(Long id){
        tenantDao.deleteById(id);
    }

}
