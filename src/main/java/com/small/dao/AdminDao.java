package com.small.dao;

import com.small.pojo.AdminBean;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface AdminDao {
    /**
     * 登录验证功能，传入用户名和密码，在数据库中查找，如果找到了，返回true，没找到则返回false
     * @param username
     * @param password
     * @return
     */
    public AdminBean getAdminInfo(@Param("username") String username,@Param("password") String password);
    /**
     * 注册账号的函数，传入账号，密码，姓名，邮箱，手机号，借阅天数，可借阅数
     * @param adminBean
     * @return
     */
    public int Register(AdminBean adminBean);

    /**
     * 根据传入的账号，密码，来查找对应的读者信息，返回一个AdminBean类型，
     * @param username
     * @param password
     * @return
     */
    //public AdminBean Login_verify(String username, String password);
    /**
     * 获取全部用户的信息，其中sql语句中的status=1，表示只查找读者，不显示管理员的
     * @return
     */
    public ArrayList<AdminBean> get_ListInfo();
    /**
     * 根据传入的aid，查找到对应的读者的全部信息，返回一个AdminBean类型的数据
     * @param aid
     * @return
     */
    public AdminBean get_AidInfo(@Param("aid") int aid);

    /**
     * 根据传入的aid，查找到对应的读者的全部信息，返回一个AdminBean类型的数据，与上一个相似，只是aid的类型为String，
     * @param aid
     * @return
     */
    public AdminBean get_AidInfo2(@Param("aid")String aid);
    /**
     * 修改读者的信息，
     */
    public int updateUser(AdminBean adminBean);
    /**
     * 删除用户的信息，根据传入的aid作为条件
     * @param aid
     */
    public int deleteUser(@Param("aid") int aid);


}
