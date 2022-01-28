package com.small.service.impl;

import com.small.dao.TypeDao;
import com.small.pojo.TypeBean;
import com.small.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;

public class TypeServiceImpl implements TypeService
{

    private TypeDao typeDao;

    public void setTypeDao(TypeDao typeDao) {
        this.typeDao = typeDao;
    }


    @Override
    public ArrayList<TypeBean> get_ListInfo() {
        return typeDao.get_ListInfo();
    }

    @Override
    public boolean updateTypeBook(int tid, String name) {
        int i = typeDao.updateTypeBook(tid, name);
        if(i>0){
            return true;
        }
        return false;
    }

    @Override
    public boolean addBookType(String name) {
        int i = typeDao.addBookType(name);
        if(i>0){
            return true;
        }
        return false;
    }

    @Override
    public boolean deleteBookType(int tid) {
        int i = typeDao.deleteBookType(tid);
        if(i>0){
            return true;
        }
        return false;
    }
}
