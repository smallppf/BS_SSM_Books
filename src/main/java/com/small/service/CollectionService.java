package com.small.service;

import com.small.pojo.BookBean;
import com.small.pojo.CollectionBean;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CollectionService {

    /**
     * 根据用户id查询用户收藏
     * @param id
     * @return
     */
    List<BookBean> findByAdminId(int id);

    /**
     * 根据用户id 加模糊查询的图书名称 获取图书
     * @param id
     * @param name
     * @return
     */
    List<BookBean> findByAdminIdAndBookName(int id,String name);

    /**
     * 根据用户id 加模糊查询的图书类型 获取图书
     * @param id
     * @param type
     * @return
     */
    List<BookBean> findByAdminIdAndBookType(int id,String type);

    /**
     * 添加图书收藏
     * @param collectionBean
     * @return
     */
    boolean addStar(CollectionBean collectionBean);

    /**
     * 删除图书收藏
     * @param collectionBean
     * @return
     */
    boolean delStar(CollectionBean collectionBean);

}
