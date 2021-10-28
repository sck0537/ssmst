package com.sck.service;


import com.sck.pojo.Admin;

public interface AdminService {
    //修改密码
    int updatePwd(String pwd);

    //查询登录
    Admin findSys(Admin admin);

}
