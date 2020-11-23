package SQL;

import java.sql.SQLException;

public class OperatorStudent {
    public void addStudent(Student s,DBUtils db)throws SQLException {
        String sql="insert into student values('"+s.getUsername()+"','"+s.getStudentID()+"','" +s.getPassword() +"');";
        db.executeUpdateInsert(sql);
    }
    public void updateStudent(Student s,DBUtils db)throws SQLException{
        String sql="UPDATE student SET pass = '"+s.getPassword()+"' WHERE username = '"+s.getUsername()+"';";
        db.update(sql);
    }
    public boolean find(String u,String p,DBUtils db)throws SQLException{
        String sql="select * from student where username = '"+u+"' ;";
        if(p.equals(db.find(sql))){
            return true;
        }
        else{
            return false;
        }
    }
}
