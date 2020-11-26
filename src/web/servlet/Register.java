package web.servlet;

import SQL.DBUtils;
import SQL.OperatorStudent;
import SQL.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Register",urlPatterns = "/Register")
public class Register extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取在web.xml中的配置的全局属性
        String encode = request.getServletContext().getInitParameter("encode");
        //为了防止乱码设置编码
        request.setCharacterEncoding(encode);
        response.setContentType("text/html;charset="+encode);
        //获得请求过来的资源
        String username = request.getParameter("username");
        String studentID=request.getParameter("studentID");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        System.out.println(username);
        System.out.println(studentID);
        System.out.println(password);
        System.out.println(repassword);
        if(username==null||password==null||repassword==null||studentID==null){
            response.getWriter().write("所有的数据都不能为空，请重新<a href = 'register.jsp'>填写</a>");
            return;
        }
        //判断两次密码是否一致
        if(!password.equals(repassword)) {
            response.getWriter().write("两次密码输入不一致，请重新<a href = 'register.jsp'>填写</a>");
            return;
        }
        try{
            OperatorStudent opS=new OperatorStudent();
            DBUtils db=new DBUtils();
            opS.addStudent(new Student(username,studentID,password),db);
            db.close();
            request.getRequestDispatcher("/oj.jsp").forward(request,response);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}