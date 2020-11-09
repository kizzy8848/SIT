package SQL;

import java.sql.*;

public class DBUtils {
    private Connection con=null; // 数据库连接对象
    private  String URL = PropertyUtil.getValue("url");// 数据库连接地址
    private  String UserName = PropertyUtil.getValue("user");// 数据库的用户名
    private  String Password = PropertyUtil.getValue("password");// 数据库的密码
    private  String DriverClass=PropertyUtil.getValue("driverClass"); //驱动名称
    private ResultSet res;
    private Statement stt;
    public DBUtils(){
        con = getConnection();
    }
    public Connection getConnection() {
        Connection conn=null;
        try {
            Class.forName(DriverClass); // 加载驱动
            System.out.println("加载驱动成功!!!");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            //通过DriverManager类的getConenction方法指定三个参数,连接数据库
            conn = DriverManager.getConnection(URL, UserName, Password);
            System.out.println("连接数据库成功!!!");
            //返回连接对象
            return conn;
        } catch (SQLException e){
            e.printStackTrace();
            return null; }
    }
    public void close(){  //close
        if(this.con!=null){
            try{
                this.con.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }
}
