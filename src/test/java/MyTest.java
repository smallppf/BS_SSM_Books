import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.small.pojo.BookBean;
import com.small.service.impl.BookServiceImpl;
import com.small.service.impl.CollectionServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.BootstrapWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;


public class MyTest {

    @Test
    public void Test() {

        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        BookServiceImpl bookService = context.getBean(BookServiceImpl.class);
        PageHelper.startPage(3,5);
        ArrayList<BookBean> books = bookService.get_ListInfo();
        PageInfo<BookBean> pageInfo = new PageInfo<>(books);
        int pageNum = pageInfo.getPageNum();
//        int pageSize = pageInfo.getPageSize();
        int pages = pageInfo.getPages();

        System.out.println("pageNum==>"+pageNum);
//        System.out.println("pageSize==>"+pageSize);
        System.out.println("pages==>"+pages);

        books.stream().forEach(System.out::println);


    }

    @Test
    public void Test1() {

        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        CollectionServiceImpl service = context.getBean(CollectionServiceImpl.class);
        List<BookBean> books = service.findByAdminId(10);
        books.stream().forEach(System.out::println);


    }
    @Test
    public void Test2() {
        Calendar cal= Calendar.getInstance();
        int y=cal.get(Calendar.YEAR);
        int m=cal.get(Calendar.MONTH)+1;
        int d=cal.get(Calendar.DATE);
        int h=cal.get(Calendar.HOUR_OF_DAY);
        int mi=cal.get(Calendar.MINUTE);
        int s=cal.get(Calendar.SECOND);
        System.out.println("现在时刻是"+y+"年"+m+"月"+d+"日"+h+"时"+mi+"分"+s+"秒");
    }


}
