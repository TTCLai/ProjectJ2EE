/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author LENOVO
 */
import entity.Employees;
import connect.TestConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class EmpolyeeDao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public Employees login(int employeeid, String password){
        String query = "SELECT * FROM employees\n" 
                +"WHERE employeeid = ?\n"
                + "AND password=?";
        try{
            conn = new TestConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,employeeid);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while(rs.next()){
                return new Employees(rs.getInt(1),
                        rs.getString(2),
                        rs.getBinaryStream(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getDate(6),
                        rs.getString(7),
                        rs.getDouble(8),
                        rs.getString(9));
            }
            
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            try{
                if(rs!=null) rs.close();
                if(ps!=null) ps.close();
                if(conn!=null) conn.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }

        return null;
    }
}
