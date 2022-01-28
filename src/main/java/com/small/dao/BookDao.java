package com.small.dao;

import com.small.pojo.BookBean;
import com.small.pojo.HistoryBean;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

public interface BookDao {

    /**
     * 添加图书信息，传入所有的信息
     */
    public int addBook(BookBean bookBean);

    /**
     * 获取所有的图书信息，返回的是ArrayList数组形式
     * @return
     */
    public ArrayList<BookBean> get_ListInfo();

    /**
     * 获取借阅记录的全部信息，传入的条件有status，aid，表示搜索正在借阅的，或者已经还书的信息，aid代表当前登录用户
     * @param status
     * @return
     */
    public ArrayList<HistoryBean> get_HistoryListInfo(@Param("status") int status,@Param("aid") String aid);

    /**
     * 获取借阅记录的全部信息，传入的条件有status，表示搜索正在借阅的，或者已经还书的信息
     * @param status
     * @return
     */
    public ArrayList<HistoryBean> get_HistoryListInfo2(@Param("status")int status);

    /**
     * 获取单个图书的信息，根据传入的bid来查找，返回一个BookBean数据类型
     * @param bid
     * @return
     */
    public BookBean get_BookInfo(@Param("bid") int bid);

    /**
     * 修改图书的信息，bid作为条件，
     */
    public int updateBook(BookBean bookBean);

    /**
     * 删除图书信息，根据传入的bid作为条件
     * @param bid
     */
    public int deleteBook(int bid);

    /**
     * 用户查找图书，根据输入的名称，使用like进行模糊查询，然后返回一个ArrayList数组类型
     * @param name
     * @return
     */
    public ArrayList<BookBean> getLikeList(String name);

    /**
     * 图书借阅函数，根据传入bid图书id，adminbean当前登录用户的信息，在借阅记录数据表中新插入一条记录
     */
    public int borrowBook(HistoryBean historyBean);

    /**
     * 还书功能的函数，根据传入的hid借阅记录id，讲status字段的值改为0，并将还书日期改变为当前日期
     * @param hid
     */
    public int borrowBook2(@Param("endtime") String endtime ,@Param("status")int status ,@Param("hid") int hid);


    /**
     * 根据类型查找图书
     * @param type
     * @return
     */
    List<BookBean> findByType(@Param("type") String type);



}
