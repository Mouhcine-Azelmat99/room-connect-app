package com.lqt.service.serviceImpl;

import com.lqt.pojo.Tenant;
import com.lqt.repository.TenantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TenantService {

    @Autowired
    private TenantRepository tenantDao;

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
