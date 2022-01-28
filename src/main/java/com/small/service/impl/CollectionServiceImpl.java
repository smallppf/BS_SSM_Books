package com.small.service.impl;

import com.small.dao.BookDao;
import com.small.dao.CollectionDao;
import com.small.dao.TypeDao;
import com.small.pojo.BookBean;
import com.small.pojo.CollectionBean;
import com.small.service.CollectionService;

import java.util.ArrayList;
import java.util.List;

public class CollectionServiceImpl implements CollectionService {

    private CollectionDao collectionDao;

    private BookDao bookDao;

    private TypeDao typeDao;

    public void setCollectionDao(CollectionDao collectionDao) {
        this.collectionDao = collectionDao;
    }

    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    public void setTypeDao(TypeDao typeDao) {
        this.typeDao = typeDao;
    }

    @Override
    public List<BookBean> findByAdminId(int id) {
        List<BookBean> books = new ArrayList<>();
        List<CollectionBean> collectionBeans = collectionDao.findByAdminId(id);
        for (CollectionBean c : collectionBeans) {
            BookBean bookInfo = bookDao.get_BookInfo(c.getBookid());
            books.add(bookInfo);
        }
        return books;
    }

    @Override
    public List<BookBean> findByAdminIdAndBookName(int id, String name) {
        //根据id获取收藏的图书
        List<CollectionBean> collectionBeans = collectionDao.findByAdminId(id);
        //根据模糊查询获取的图书
        List<BookBean> books1 = bookDao.getLikeList("%"+name+"%");
        return bookEqs(books1, collectionBeans);
    }

    @Override
    public List<BookBean> findByAdminIdAndBookType(int id, String type) {

        //根据id获取收藏的图书
        List<CollectionBean> collectionBeans = collectionDao.findByAdminId(id);
        //根据模糊查询获取的图书
        List<BookBean> books2 = bookDao.findByType(type);
        return bookEqs(books2, collectionBeans);
    }

    @Override
    public boolean addStar(CollectionBean collectionBean) {
        return collectionDao.addCollection(collectionBean)>0;
    }

    @Override
    public boolean delStar(CollectionBean collectionBean) {
        return collectionDao.delCollection(collectionBean.getBookid(),collectionBean.getAdminid())>0;
    }

    //将两个数组里面相同的数据提取出来
    private List<BookBean> bookEqs(List<BookBean> b1,List<CollectionBean> b2){
        //设置一个空的数组
        List<BookBean> books = new ArrayList<>();
        //循环遍历判断是否相同
        for (BookBean b: b1) {
            for (CollectionBean c : b2) {
                BookBean bookInfo = bookDao.get_BookInfo(c.getBookid());
                if( b.getName().equals(bookInfo.getName())){
                    books.add(bookInfo);
                }
            }
        }
        return books;

    }

}
