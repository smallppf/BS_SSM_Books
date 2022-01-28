package com.small.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.small.pojo.AdminBean;
import com.small.pojo.BookBean;
import com.small.pojo.HistoryBean;
import com.small.pojo.TypeBean;
import com.small.service.impl.AdminServiceImpl;
import com.small.service.impl.BookServiceImpl;
import com.small.service.impl.TypeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

@Controller
public class AdminController {
    @Autowired
    private AdminServiceImpl adminService;
    @Autowired
    private BookServiceImpl bookService;
    @Autowired
    private TypeServiceImpl typeService;

    @GetMapping("/index")
    public String index(){

        return "index";
    }

    /**
     * 登录验证
     *
     * @param username
     * @param password
     * @param session
     * @return
     */
    @PostMapping("/LoginServlet")
    public String LoginServlet(String username, String password, HttpSession session) {
        boolean b = adminService.Login_verify(username, password);
        if (b) {
            //登录成功
            //根据账号和密码查找出读者的信息
            AdminBean adminBean = adminService.getAdminInfo(username, password);
            //将aid存入session中
            session.setAttribute("aid", "" + adminBean.getAid());
            session.setAttribute("admin", adminService.get_AidInfo(adminBean.getAid()));
            //设置session的失效时间
            session.setMaxInactiveInterval(6000);
            //根据status的值来判断是管理员，还是读者，status=1为读者
            session.removeAttribute("state");
            if (adminBean.getStatus() == 1) {
                return "WEB-INF/view/index2";
            } else {
                return "WEB-INF/view/admin";
            }
        } else {
            //登录失败
            //没有找到对应的账号和密码，返回重新登录
            session.setAttribute("state", "用户名或者密码不正确");
            return "login";
        }

    }

    /**
     * 图书管理功能
     *
     * @param model
     * @return
     */
    @GetMapping("/admin_book")
    public String AdminBook1(Model model) {
        //开启分页
        PageHelper.startPage(1,8);
        //查询所有图书
        ArrayList<BookBean> bookdata = bookService.get_ListInfo();
        PageInfo<BookBean> pageInfo = new PageInfo<>(bookdata);
        //第几页
        int pageNum = pageInfo.getPageNum();
        //共多少页
        int pages = pageInfo.getPages();

        ArrayList<TypeBean> data = typeService.get_ListInfo();
        ArrayList<TypeBean> typeBeans = typeService.get_ListInfo();

        model.addAttribute("book", bookdata);
        model.addAttribute("data", data);
        model.addAttribute("bookTypeList", typeBeans);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("pages", pages);
//        data.stream().forEach(System.out::println);
        return "WEB-INF/view/admin_book";
    }
    /**
     * 分页功能
     * @param pageNum
     * @param model
     * @param session
     * @return
     */
    @GetMapping("/admin_book/{pageNum}")
    public String AdminBook2(@PathVariable int pageNum,Model model,HttpSession session) {
        AdminBean admin = (AdminBean) session.getAttribute("admin");

        //开启分页
        PageHelper.startPage(pageNum,8);
        //查询所有图书
        ArrayList<BookBean> bookdata = bookService.get_ListInfo();
        PageInfo<BookBean> pageInfo = new PageInfo<>(bookdata);

        //共多少页
        int pages = pageInfo.getPages();

        ArrayList<TypeBean> data = typeService.get_ListInfo();
        ArrayList<TypeBean> typeBeans = typeService.get_ListInfo();

        model.addAttribute("book", bookdata);
        model.addAttribute("data", data);
        model.addAttribute("bookTypeList", typeBeans);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("pages", pages);
//        data.stream().forEach(System.out::println);

        if(admin.getStatus()==1){
            return "WEB-INF/view/select";
        }else if(admin.getStatus()==2){
            return "WEB-INF/view/admin_book";
        }else {
            return "error";
        }
    }

    /**
     * 用户管理
     * @param model
     * @return
     */
    @GetMapping("/admin_user")
    public String AdminUser(Model model) {
        ArrayList<AdminBean> data = adminService.get_ListInfo();
        model.addAttribute("data", data);

        return "WEB-INF/view/admin_user";
    }

    /**
     * 图书类型管理
     *
     * @param model
     * @return
     */
    @GetMapping("/admin_booktype")
    public String adminBooktype(Model model) {

        ArrayList<TypeBean> data = typeService.get_ListInfo();
        model.addAttribute("bookdata", data);
        System.out.println("———————————进来了adminBooktype———————————");
        data.stream().forEach(System.out::println);

        return "WEB-INF/view/admin_booktype";
    }

    /**
     * 管理员页面
     * @return
     */
    @GetMapping("/admin")
    public String admin() {
        return "WEB-INF/view/admin";
    }

    /**
     * 图书借阅信息
     *
     * @param model
     * @return
     */
    @GetMapping("/admin_borrow")
    public String adminBorrow(Model model) {
        ArrayList<HistoryBean> data = bookService.get_HistoryListInfo2(1);
        model.addAttribute("bookdata", data);
        data.stream().forEach(System.out::println);

        System.out.println("———————————进来了adminBorrow———————————");

        return "WEB-INF/view/admin_borrow";
    }

    /**
     * 图书归还信息
     *
     * @param model
     * @return
     */
    @GetMapping("/admin_history")
    public String adminHistory(Model model) {

        ArrayList<HistoryBean> data = bookService.get_HistoryListInfo2(0);
        model.addAttribute("bookdata", data);
        data.stream().forEach(System.out::println);
        System.out.println("———————————进来了adminHistory———————————");

        return "WEB-INF/view/admin_history";
    }

    /**
     * 模糊查询
     * @param tip
     * @param name
     * @param model
     * @return
     */
    @PostMapping("/selectServlet")
    public String selectServlet(int tip, String name, Model model) {
        //开启分页
        PageHelper.startPage(1,8);
        ArrayList<BookBean> book = bookService.getLikeList(name);
        PageInfo<BookBean> pageInfo = new PageInfo<>(book);
        //第几页
        int pageNum = pageInfo.getPageNum();
        //共多少页
        int pages = pageInfo.getPages();

        ArrayList<TypeBean> data = typeService.get_ListInfo();
        model.addAttribute("book", book);
        model.addAttribute("data", data);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("pages", pages);
        if (tip == 1) {
            return "WEB-INF/view/admin_book";
        } else if (tip == 2){
            return "WEB-INF/view/select";
        }else {
            return "error";
        }
    }


    /**
     * 删除书籍
     * @param bid
     * @return
     */
    @GetMapping("/deleteServlet/{bid}")
    public String deleteServlet(@PathVariable int bid) {
        System.out.println("要删除的id是===》" + bid);
        boolean b = bookService.deleteBook(bid);
        if (!b) {
            return "error";
        }
        return "redirect:admin_book";
    }

    /**
     * 头部导航
     * @return
     */
    @GetMapping("/admin_header")
    public String adminHeader() {
        return "WEB-INF/view/admin_header";
    }


    /**
     * 添加图书
     *
     * @param bookBean
     * @return
     */
    @PostMapping("/AddBookServlet")
    public String AddBookServlet(BookBean bookBean,HttpServletRequest req,@PathVariable("file") MultipartFile file) throws IOException {
        //调用图片下载方法
        String filename = addressimg(req, file);
        if(filename!=null){
            bookBean.setAddress(filename);
        }else {
            return "error";
        }
        //添加图片名称
        System.out.println("bookBean===>"+bookBean);

        boolean b = bookService.addBook(bookBean);
        if(!b){
            return "error";
        }
        return "redirect:admin_book";
    }

    /**
     * 修改书籍信息
     *
     * @param bookBean
     * @return
     */
    @PostMapping("/updateBookServlet")
    public String updateBookServlet(BookBean bookBean,HttpServletRequest req,@PathVariable("file") MultipartFile file) throws IOException {
        //调用图片下载方法
        String filename = addressimg(req, file);
        if(filename!=null){
            bookBean.setAddress(filename);
        }else {
            return "error";
        }

        System.out.println("bookBean===>"+bookBean);

        boolean b = bookService.updateBook(bookBean);
        if (!b) {
            return "error";
        }
        return "redirect:admin_book";
    }


    /**
     * 修改密码
     * @param password
     * @param password2
     * @param url
     * @param session
     * @return
     */
    @PostMapping("/AdminServlet1")
    public String AdminServlet1(String password, String password2, String url, HttpSession session) {
        //获取当前用户或者管理员信息
        AdminBean adminBean = (AdminBean) session.getAttribute("admin");
        if (adminBean.getPassword().equals(password)) {
            //修改密码
            adminBean.setPassword(password2);
            boolean b = adminService.updateUser(adminBean);
            session.setAttribute("admin", adminService.get_AidInfo(adminBean.getAid()));
            if (!b) {
                return "error";
            }
        }
        return ("redirect:/" + url);
    }

    /**
     * 修改个人信息
     * @param name
     * @param email
     * @param phone
     * @param url
     * @param session
     * @return
     */
    @PostMapping("/AdminServlet2")
    public String AdminServlet2(String name, String email, String phone, String url, HttpSession session) {
        //获取当前用户或者管理员的信息
        AdminBean adminBean = (AdminBean) session.getAttribute("admin");
        //将前端提交的信息替换之前的信息
        adminBean.setName(name);
        adminBean.setEmail(email);
        adminBean.setPhone(phone);
        //修改信息
        boolean b = adminService.updateUser(adminBean);
        //修改后将信息传递到session里
        session.setAttribute("admin", adminService.get_AidInfo(adminBean.getAid()));
        if (!b) {
            return "error";
        }
        return ("redirect:/" + url);
    }


    /**
     * 添加用户
     *
     * @param adminBean
     * @return
     */
    @PostMapping("/AddUserServlet")
    public String AddUserServlet(AdminBean adminBean) {
        adminBean.setStatus(1);
        boolean b = adminService.Register(adminBean);
        if (!b) {
            return "error";
        }
        //重定向到用户管理页面
        return "redirect:admin_user";
    }

    /**
     * 修改用户信息
     *
     * @param adminBean
     * @return
     */
    @PostMapping("/updateUserServlet")
    public String updateUserServlet(AdminBean adminBean) {
        adminBean.setStatus(1);
        boolean b = adminService.updateUser(adminBean);
        if (!b) {
            return "error";
        }
        //重定向到用户管理页面
        return "redirect:admin_user";
    }

    /**
     * 删除用户
     *
     * @param aid
     * @return
     */
    @GetMapping("/deleteUserServlet/{aid}")
    public String deleteUserServlet(@PathVariable int aid) {
        System.out.println("要删除的id是===》" + aid);
        boolean b = adminService.deleteUser(aid);
        if (!b) {
            return "error";
        }
        return "redirect:admin_user";
    }


    //图书类型
    /**
     * 添加图书类型
     *
     * @param name
     * @return
     */
    @PostMapping("/AddBookTypeServlet")
    public String AddBookTypeServlet(String name) {
        System.out.println("name===>" + name);
        boolean b = typeService.addBookType(name);
        if (!b) {
            return "error";
        }

        return "redirect:admin_booktype";
    }

    /**
     * 修改图书类型
     *
     * @param tid
     * @param name
     * @return
     */
    @PostMapping("/updateBookTypeServlet")
    public String updateBookTypeServlet(int tid, String name) {
        boolean b = typeService.updateTypeBook(tid, name);
        if (!b) {
            return "error";
        }
        return "redirect:admin_booktype";
    }

    /**
     * 删除图书类型
     *
     * @param tid
     * @return
     */
    @GetMapping("/deleteTypeServlet/{tid}")
    public String deleteTypeServlet(@PathVariable int tid) {
        boolean b = typeService.deleteBookType(tid);
        if (!b) {
            return "error";
        }
        return "redirect:admin_booktype";
    }


    //还书
    /**
     * 还书功能
     * @param tip
     * @param show
     * @param hid
     * @return
     */
    @GetMapping("/borrowServlet/{tip}/{show}/{hid}")
    public String borrowServlet(@PathVariable int tip, @PathVariable int show, @PathVariable int hid) {
        if (tip == 2) {
            boolean b = bookService.borrowBook2(hid);
            if (!b) {
                return "error";
            }
            //还书
            if (show == 1) {
                //show为1表示用户
                return "redirect:/borrow";
            } else if (show == 2) {
                //show为2表示管理员
                return "redirect:/admin_borrow";
            }
        }
        return "error";
    }

    /**
     * 跳转到注册页面
     * @return
     */
    @GetMapping("/register")
    public String register(){

        return "WEB-INF/view/register";
    }

    /**
     * 注册功能
     *
     * @param adminBean
     * @return
     */
    @PostMapping("/RegisterServlet")
    public String RegisterServlet(AdminBean adminBean) {

        System.out.println("注册页面的adminBean====》" + adminBean);
        //设置权限为用户
        adminBean.setStatus(1);
        boolean b = adminService.Register(adminBean);
        if (!b) {
            return "error";
        }
        return "login";
    }

    /**
     * 图片上传下载
     * @param req
     * @param file
     * @return
     */
    private static String addressimg(HttpServletRequest req, MultipartFile file){
        //获取图片的下载地址
        String realPath = req.getServletContext().getRealPath("/static/img/bookimg/");
        //获取图片名称
        String filename = file.getOriginalFilename();
        //将名称和地址拼接成一个文件地址
        File file1 = new File(realPath+ filename);
        System.out.println("file1==>"+file1);
        //将前端上传的文件下载到指定的地址
        try {
            file.transferTo(file1);//下载图片到指定位置
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
        return file.getOriginalFilename();
    }




}


