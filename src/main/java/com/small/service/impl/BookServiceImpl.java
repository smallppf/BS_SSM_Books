package com.small.service.impl;

import com.small.dao.BookDao;
import com.small.pojo.AdminBean;
import com.small.pojo.BookBean;
import com.small.pojo.HistoryBean;
import com.small.service.BookService;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class BookServiceImpl implements BookService {

    private BookDao bookDao;

    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }


    @Override
    public boolean addBook(BookBean bookBean) {
        int i = bookDao.addBook(bookBean);
        if (i > 0) {
            return true;
        }
        return false;
    }

    @Override
    public ArrayList<BookBean> get_ListInfo() {
        return bookDao.get_ListInfo();
    }

    @Override
    public ArrayList<HistoryBean> get_HistoryListInfo(int status, String aid) {
        return bookDao.get_HistoryListInfo(status, aid);
    }

    @Override
    public ArrayList<HistoryBean> get_HistoryListInfo2(int status) {
        return bookDao.get_HistoryListInfo2(status);
    }

    @Override
    public BookBean get_BookInfo(int bid) {
        return bookDao.get_BookInfo(bid);
    }

    @Override
    public boolean updateBook(BookBean bookBean) {
        int i = bookDao.updateBook(bookBean);
        if (i > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean deleteBook(int bid) {
        int i = bookDao.deleteBook(bid);
        if (i > 0) {
            return true;
        }
        return false;
    }

    @Override
    public ArrayList<BookBean> getLikeList(String name) {
        return bookDao.getLikeList("%"+name+"%");
    }

    @Override
    public boolean borrowBook(int bid, AdminBean adminbean) {
        BookBean bookbean = this.get_BookInfo(bid);
        //生成日期的功能
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH)+1;
        int day = c.get(Calendar.DATE);
        //生成借阅开始日期
        String begintime = "" + year + "-" + month + "-" + day;
        month = month + 1;
        //生成截止还书日期
        String endtime = "" + year + "-" + month + "-" + day;

        HistoryBean historyBean = new HistoryBean(0,
                adminbean.getAid(),
                bid,
                bookbean.getCard(),
                bookbean.getName(),
                adminbean.getName(),
                adminbean.getUsername(),
                begintime,
                endtime,
                1);
        int i = bookDao.borrowBook(historyBean);
        if(i>0){
            return true;
        }
        return false;
    }

    @Override
    public boolean borrowBook2(int hid) {
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH)+1;
        int day = c.get(Calendar.DATE);
        //生成还书日期
        String endtime = "" + year + "-" + month + "-" + day;

        int i = bookDao.borrowBook2(endtime, 0, hid);
        if (i > 0) {
            return true;
        }
        return false;
    }

    @Override
    public List<BookBean> findByType(String type) {
        return bookDao.findByType(type);
    }
}
