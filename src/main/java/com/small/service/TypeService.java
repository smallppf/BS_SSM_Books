package com.small.service;

import com.small.pojo.TypeBean;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface TypeService {

    /**
     * 获取所有图书类型的信息，返回数组形式
     * @return
     */
    public ArrayList<TypeBean> get_ListInfo();

    /**
     * 修改图书分类的信息
     * @param tid
     * @param name
     */
    public boolean updateTypeBook( int tid,  String name);

    /**
     * 添加一个图书分类
     * @param name
     */
    public boolean addBookType( String name);

    /**
     * 删除一个图书分类
     * @param tid
     */
    public boolean deleteBookType(int tid);

}
