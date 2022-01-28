package com.small.service.impl;

import com.small.dao.AdminDao;
import com.small.pojo.AdminBean;
import com.small.service.AdminService;

import java.util.ArrayList;

public class AdminServiceImpl implements AdminService
{

    private AdminDao adminDao;

    public void setAdminDao(AdminDao adminDao) {
        this.adminDao = adminDao;
    }


    @Override
    public boolean Login_verify(String username, String password) {
        AdminBean adminInfo = adminDao.getAdminInfo(username, password);
        if (adminInfo != null) {
            //登录成功
            return true;
        }
        //登录失败
        return false;
    }

    @Override
    public boolean Register(AdminBean adminBean) {
        int i = adminDao.Register(adminBean);
        if(i>0){
            return true ;
        }
        return false ;
    }

    @Override
    public AdminBean getAdminInfo(String username, String password) {
        return adminDao.getAdminInfo(username,password);
    }

    @Override
    public ArrayList<AdminBean> get_ListInfo() {
        return adminDao.get_ListInfo();
    }

    @Override
    public AdminBean get_AidInfo(int aid) {
        return adminDao.get_AidInfo(aid);
    }

    @Override
    public AdminBean get_AidInfo2(String aid) {
        return adminDao.get_AidInfo2(aid);
    }

    @Override
    public boolean updateUser(AdminBean adminBean) {
        int i = adminDao.updateUser(adminBean);
        if(i>0){
            return true;
        }
        return false;
    }

    @Override
    public boolean deleteUser(int aid) {
        int i = adminDao.deleteUser(aid);
        if(i>0){
            return true;
        }
        return false;
    }
}
