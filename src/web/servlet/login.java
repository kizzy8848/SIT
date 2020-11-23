package web.servlet;

import SQL.DBUtils;
import SQL.OperatorStudent;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "login",urlPatterns = "/login")
public class login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //InputStream instream=this.getServletContext().getResourceAsStream("/WEB-INF/classes/SQL/config.properties");
        //先获取到全局配置中的设置的编码
        String encode = req.getServletContext().getInitParameter("encode");
        //设置请求和响应的编码
        req.setCharacterEncoding(encode);
        resp.setContentType("text/html;charset="+encode);
        try {
            OperatorStudent opS=new OperatorStudent();
            DBUtils db=new DBUtils();
            //从登录页面拿到用户输入的用户名
            String name = req.getParameter("user");
            //从登录页面拿到用户输入的密码
            String pwd = req.getParameter("password");
            //还是在控制台上输出看是否拿到的帐号密码
            System.out.println("用户名：" +name);
            System.out.println("密码："+ pwd);
            //下边就是加载数据库的过程
            if (opS.find(name,pwd,db)){
                //5.跳转到
                req.getRequestDispatcher("/oj.jsp").forward(req,resp);
            }else {
                resp.getWriter().write("对不起你帐号名有误，请<a href='register.jsp'>注册</a>");
            }
            db.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}

