/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author LENOVO
 */
public class TestConnect {

    public Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/quanlycuahang?useUnicode=true&characterEncoding=utf8";
        String user = "root";
        String password = "";
          try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Đảm bảo rằng driver đã được tải
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("Ket noi thanh cong");
            System.out.println(conn.getCatalog());   // In ra catalog hiện tại (có thể là tên cơ sở dữ liệu)
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return DriverManager.getConnection(url,user,password);
    }
}
