package com.small.dao;

import com.small.pojo.CollectionBean;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CollectionDao {

    /**
     * 根据用户id查询收藏的数据
     * @param id
     * @return
     */
    List<CollectionBean> findByAdminId(@Param("id") int id);

    /**
     * 添加收藏
     * @param collectionBean
     * @return
     */
    int addCollection(CollectionBean collectionBean);

    /**
     * 删除收藏
     * @param bookid
     * @param adminid
     * @return
     */
    int delCollection(@Param("bookid") int bookid,@Param("adminid") int adminid);

}
