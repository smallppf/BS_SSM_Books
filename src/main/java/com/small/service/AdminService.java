package com.small.service;

import com.small.pojo.AdminBean;

import java.util.ArrayList;

public interface AdminService {
    /**
     * 登录验证功能，传入用户名和密码，在数据库中查找，如果找到了，返回true，没找到则返回false
     * @param username
     * @param password
     * @return
     */
    public boolean Login_verify(String username,String password);
    /**
     * 注册账号的函数，传入账号，密码，姓名，邮箱，手机号，借阅天数，可借阅数
     * @param username
     * @param password
     * @param name
     * @param email
     * @param phone
     * @param lend_num
     * @param max_num
     */
    public boolean Register(AdminBean adminBean);

    /**
     * 根据传入的账号，密码，来查找对应的读者信息，返回一个AdminBean类型，
     * @param username
     * @param password
     * @return
     */
    public AdminBean getAdminInfo(String username, String password);

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
    public AdminBean get_AidInfo(int aid);

    /**
     * 根据传入的aid，查找到对应的读者的全部信息，返回一个AdminBean类型的数据，与上一个相似，只是aid的类型为String，
     * @param aid
     * @return
     */
    public AdminBean get_AidInfo2(String aid);
    /**
     * 修改读者的信息，
     */
    public boolean updateUser(AdminBean adminBean);

    /**
     * 删除用户的信息，根据传入的aid作为条件
     * @param aid
     */
    public boolean deleteUser(int aid);

}
