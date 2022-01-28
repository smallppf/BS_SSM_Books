package com.small.dao;

import com.small.pojo.TypeBean;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface TypeDao {
    /**
     * 获取所有图书类型的信息，返回数组形式
     * @return
     */
     ArrayList<TypeBean> get_ListInfo();

    /**
     * 修改图书分类的信息
     * @param tid
     * @param name
     */
     int updateTypeBook(@Param("tid") int tid,@Param("name") String name);

    /**
     * 添加一个图书分类
     * @param name
     */
     int addBookType(@Param("name") String name);

    /**
     * 删除一个图书分类
     * @param tid
     */
     int deleteBookType(@Param("tid")int tid);


}
