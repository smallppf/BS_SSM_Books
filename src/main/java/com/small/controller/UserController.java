package com.small.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.small.pojo.*;
import com.small.service.impl.BookServiceImpl;
import com.small.service.impl.CollectionServiceImpl;
import com.small.service.impl.TypeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private BookServiceImpl bookService;

    @Autowired
    private TypeServiceImpl typeService;

    @Autowired
    private CollectionServiceImpl collectionService;

    //用户
    @GetMapping("/index2")
    public String index2() {
        return "WEB-INF/view/index2";
    }

    /**
     * 查看图书
     *
     * @param model
     * @return
     */
    @GetMapping("/select")
    public String select(Model model) {
        //开启分页
        PageHelper.startPage(1, 8);
        ArrayList<BookBean> books = bookService.get_ListInfo();
        PageInfo<BookBean> pageInfo = new PageInfo<>(books);
        //第几页
        int pageNum = pageInfo.getPageNum();
        //共多少页
        int pages = pageInfo.getPages();
        //获取图书类型
        ArrayList<TypeBean> typeBeans = typeService.get_ListInfo();
        //将数据携带给前端
        model.addAttribute("book", books);
        model.addAttribute("data", typeBeans);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("pages", pages);

        return "WEB-INF/view/select";
    }

    /**
     * 根据类型查询书籍
     *
     * @param type
     * @param model
     * @return
     */
    @GetMapping("/select/{type}")
    public String select2(@PathVariable String type, Model model, HttpSession session) {

        AdminBean admin = (AdminBean) session.getAttribute("admin");
        //开启分页
        PageHelper.startPage(1, 8);
        List<BookBean> books = bookService.findByType(type);
        PageInfo<BookBean> pageInfo = new PageInfo<>(books);
        int pageNum = pageInfo.getPageNum();
        //共多少页
        int pages = pageInfo.getPages();

        ArrayList<TypeBean> typeBeans = typeService.get_ListInfo();


        model.addAttribute("book", books);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("pages", pages);
//        model.addAttribute("bookTypeList", typeBeans);
        model.addAttribute("data", typeBeans);

        if (admin.getStatus() == 1) {
            return "WEB-INF/view/select";
        } else if (admin.getStatus() == 2) {
            return "WEB-INF/view/admin_book";
        } else {
            return "error";
        }

    }

    /**
     * 借阅信息
     *
     * @param model
     * @return
     */
    @GetMapping("/borrow")
    public String borrow(Model model, HttpSession session) {

        String aid = (String) session.getAttribute("aid");
        ArrayList<HistoryBean> book = bookService.get_HistoryListInfo(1, aid);

        model.addAttribute("book", book);

        return "WEB-INF/view/borrow";
    }

    /**
     * 借阅历史
     *
     * @param model
     * @return
     */
    @GetMapping("/history")
    public String history(Model model, HttpSession session) {
        //获取用户id
        String aid = (String) session.getAttribute("aid");
        //根据用户id查询到借阅的历史信息
        ArrayList<HistoryBean> book = bookService.get_HistoryListInfo(0, aid);
        //将数据携带给前端
        model.addAttribute("book", book);
        return "WEB-INF/view/history";
    }

    /**
     * 借阅图书
     *
     * @param bid
     * @param session
     * @return
     */
    @GetMapping("/user/borrowServlet/{bid}")
    public String borrowServlet(@PathVariable int bid, HttpSession session) {
        AdminBean adminBean = (AdminBean) session.getAttribute("admin");
        boolean b = bookService.borrowBook(bid, adminBean);
        if (!b) {
            return "error";
        }
        return "redirect:/select";
    }

    /**
     * 注销功能
     *
     * @param session
     * @return
     */
    @GetMapping("/login")
    public String login(HttpSession session) {
        session.removeAttribute("admin");
        return "login";
    }


    /**
     * 查看收藏的图书
     * @param session
     * @param model
     * @return
     */
    @GetMapping("/star")
    public String Collection(HttpSession session,Model model) {
        AdminBean admin = (AdminBean) session.getAttribute("admin");
        int aid = admin.getAid();
        PageHelper.startPage(1, 8);//开启分页
        List<BookBean> books = collectionService.findByAdminId(aid);
        PageInfo<BookBean> pageInfo = new PageInfo<>(books);
        int pageNum = pageInfo.getPageNum();//第几页
        int pages = pageInfo.getPages();//共多少页
        ArrayList<TypeBean> typeBeans = typeService.get_ListInfo();
        model.addAttribute("book", books);
        model.addAttribute("data", typeBeans);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("pages", pages);
        return "WEB-INF/view/selectStar";
    }

    /**
     * 添加图书收藏
     * @param bookId
     * @param session
     * @param model
     * @return
     */
    @GetMapping("/addStar/{bookId}")
    public String AddStar(@PathVariable("bookId") int bookId,HttpSession session,Model model) {
        //获取用户id
        AdminBean admin = (AdminBean) session.getAttribute("admin");
        //添加到收藏中
        collectionService.addStar(new CollectionBean(0, bookId, admin.getAid()));
        return "redirect:/select";
    }

    /**
     * 删除图书收藏
     * @param bookId
     * @param session
     * @param model
     * @return
     */
    @GetMapping("/delStar/{bookId}")
    public String DelStar(@PathVariable("bookId") int bookId,HttpSession session,Model model) {
        //获取用户id
        AdminBean admin = (AdminBean) session.getAttribute("admin");
        //添加到收藏中
        collectionService.delStar(new CollectionBean(0, bookId, admin.getAid()));
        return "redirect:/star";
    }


    /**
     * 收藏里根据类型查询书籍
     *
     * @param type
     * @param model
     * @return
     */
    @GetMapping("/selectStar/{type}")
    public String select3(@PathVariable String type, Model model, HttpSession session) {

        AdminBean admin = (AdminBean) session.getAttribute("admin");
        //开启分页
        PageHelper.startPage(1, 8);
        List<BookBean> books = collectionService.findByAdminIdAndBookType(admin.getAid(),type);
        PageInfo<BookBean> pageInfo = new PageInfo<>(books);
        int pageNum = pageInfo.getPageNum();
        //共多少页
        int pages = pageInfo.getPages();

        ArrayList<TypeBean> typeBeans = typeService.get_ListInfo();

        model.addAttribute("book", books);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("pages", pages);
//        model.addAttribute("bookTypeList", typeBeans);
        model.addAttribute("data", typeBeans);

        if (admin.getStatus() == 1) {
            return "WEB-INF/view/selectStar";
        }  else {
            return "error";
        }

    }

    /**
     * 收藏里的模糊查询
     * @param name
     * @param model
     * @return
     */
    @PostMapping("/selectServletStar")
    public String selectServlet(String name, Model model,HttpSession session) {
        AdminBean admin = (AdminBean) session.getAttribute("admin");
        //开启分页
        PageHelper.startPage(1,8);
        List<BookBean> book = collectionService.findByAdminIdAndBookName(admin.getAid(),name);
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

        return "WEB-INF/view/selectStar";

    }




}
