package judge.common;

import com.mysql.cj.jdbc.MysqlDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 6、
 * 和数据库建立连接，进一步操作数据库
 */
public class DBUtil {
    private static final String URL ="jdbc:mysql://localhost:3306/sit?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai";

    private static final String USERNAME = "root";

    private static final String PASSWORD = "884899";

    private static DataSource dataSource = null;

    public static DataSource getDataSource() {
        if (dataSource == null) {
            synchronized (DBUtil.class) {
                if (dataSource == null) {
                    dataSource = new MysqlDataSource();
                    ((MysqlDataSource)(dataSource)).setURL(URL);
                    ((MysqlDataSource)(dataSource)).setUser(USERNAME);
                    ((MysqlDataSource)(dataSource)).setPassword(PASSWORD);
                }
            }
        }
        return dataSource;
    }

    public static Connection getConnection() {
        try {
            //内置了数据库连接池
            return getDataSource().getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void close(Connection connection, PreparedStatement statement, ResultSet result) {
        try {
            if (result != null) {
                result.close();
            }

            if (statement != null) {
                statement.close();
            }

            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
