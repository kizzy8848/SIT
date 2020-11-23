package SQL;

import java.sql.SQLException;

public class test {
    DBUtils db=new DBUtils();
    OperatorStudent opS=new OperatorStudent();
    public void a()throws SQLException {
        opS.addStudent(new Student("ly","201808010921","zz"),db);
        opS.updateStudent(new Student("ly","","kk"),db);
        if(opS.find("ly","kk",db)){
            System.out.println("yes");
        }
    }
    public static void main(String []args)throws SQLException{
        test t=new test();
        t.a();
    }
}
