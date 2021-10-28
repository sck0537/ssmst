package com.sck.service.impl;

import com.sck.dao.AdminMapper;
import com.sck.pojo.Admin;
import com.sck.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminMapper adminMapper;
    @Override
    public int updatePwd(String pwd) {
        return adminMapper.updatePwd(pwd);
    }

    @Override
    public Admin findSys(Admin admin) {
        return adminMapper.findSys(admin);
    }

}
