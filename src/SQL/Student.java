package SQL;

public class Student {
    private String username;//primary key
    private String studentID;
    private String password;
    public Student(String username, String studentID,String password){
        this.username = username;
        this.studentID=studentID;
        this.password = password;
    }
    public String getUsername() {
        return username;
    }
    public String getStudentID(){return studentID;}
    public String getPassword() {
        return password;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public void setStudentID(String studentID){this.studentID=studentID;}
    public void setPassword(String password) {
        this.password = password;
    }
}
