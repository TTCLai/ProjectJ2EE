/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author LENOVO
 */
import entity.Admin;
import entity.Employees;
import entity.Categories;
import entity.Products;
import connect.TestConnect;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDao {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // Login
    public Admin login(String username, String password) {
        String query = "SELECT * FROM admin\n"
                + "WHERE username = ?\n"
                + "AND password=?";
        try {
            conn = new TestConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Admin(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    // Quản lý nhân viên
    public void insertEmployee(Employees employee) {
        String query = "INSERT INTO employees (EmployeeID, FullName, img, Password, Gender, Birthday, PhoneNumber, Salary, Address) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = new TestConnect().getConnection();
            ps = conn.prepareStatement(query);

           
            ps.setInt(1, employee.getEmployeeid()); 
            ps.setString(2, employee.getFullname());
            ps.setBlob(3, employee.getImg());
            ps.setString(4, employee.getPassword()); 
            ps.setInt(5, employee.getGender()); 
            ps.setDate(6, employee.getBirthday()); 
            ps.setString(7, employee.getPhonenumber()); 

          
            if (employee.getSalary() == 0) {
                ps.setNull(8, java.sql.Types.DOUBLE); 
            } else {
                ps.setDouble(8, employee.getSalary()); 
            }

            ps.setString(9, employee.getAddress()); 

            // Thực hiện câu lệnh SQL
            int rowsAffected = ps.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đảm bảo đóng các tài nguyên
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Xoa nhan vien
    public void deleteEmployee(int empoyeeid) {
        String query = "DELETE FROM employees where EmployeeID=?";
        try {
            conn = new TestConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, empoyeeid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Đóng kết nối và PreparedStatement
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Lay tat ca nhan vien (show all)
    public List<Employees> getAllEmloyee() {
        List<Employees> list = new ArrayList<>();
        String query = "SELECT *FROM employees";
        try {
            conn = new TestConnect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Employees(rs.getInt("EmployeeID"),
                        rs.getString("FullName"),
                        rs.getBinaryStream("img"),
                        rs.getString("Password"),
                        rs.getInt("Gender"),
                        rs.getDate("Birthday"),
                        rs.getString("PhoneNumber"),
                        rs.getDouble("Salary"),
                        rs.getString("Address")));
                System.out.println("Employee ID: " + rs.getInt("EmployeeID"));
                System.out.println("Employee Name: " + rs.getString("FullName"));
                System.out.println("Employee Password: " + rs.getString("Password"));
                System.out.println("Employee Phone: " + rs.getString("PhoneNumber"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Edit Nhan vien
    public void editEmployee(Employees employee) {
        String query = "UPDATE employees SET "
                + "FullName=?,"
                + " img=?,"
                + " Password=?,"
                + " Gender=?,"
                + " Birthday=?,"
                + " PhoneNumber=?,"
                + " Salary=?,"
                + " Address=? WHERE EmployeeID=?";
        try {
            conn = new TestConnect().getConnection();
            ps = conn.prepareStatement(query);

            ps.setString(1, employee.getFullname());
           
            ps.setBlob(2, employee.getImg());
            
            ps.setString(3, employee.getPassword());
            ps.setInt(4, employee.getGender());
            ps.setDate(5, employee.getBirthday());
            ps.setString(6, employee.getPhonenumber());
            if (employee.getSalary() == 0) {
                ps.setNull(7, java.sql.Types.DOUBLE);
            } else {
                ps.setDouble(7, employee.getSalary());
            }
            ps.setString(8, employee.getAddress());
            ps.setInt(9, employee.getEmployeeid());
            int rowsAffected = ps.executeUpdate(); // Sử dụng executeUpdate()
            System.out.println("Rows affected: " + rowsAffected);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    // Lay nhan vien theo id
    public Employees getEmployeeByID(int id) {
        String query = "SELECT * FROM employees WHERE EmployeeID =?";
        Employees employee = null;
        try {
            conn = new TestConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                employee = new Employees();
                employee.setEmployeeid(rs.getInt("EmployeeID"));
                employee.setFullname(rs.getString("FullName"));
                employee.setImg(rs.getBinaryStream("img"));
                employee.setPassword(rs.getString("Password"));
                employee.setGender(rs.getInt("Gender"));
                employee.setBirthday(rs.getDate("Birthday"));
                employee.setPhonenumber(rs.getString("PhoneNumber"));
                employee.setSalary(rs.getDouble("Salary"));
                employee.setAddress(rs.getString("Address"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return employee;
    }
///////////////////////////////////////////////// Quan Ly LOAI SAN PHAM /////////////////////////////////////////////////
    // Lay tat ca Loai San Pham

    public List<Categories> getAllCategorieses() {
        List<Categories> list = new ArrayList<>();
        String query = "SELECT *FROM categories";
        try {
            conn = new TestConnect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Categories(rs.getInt("CategoryID"),
                        rs.getString("CategoryName"),
                        rs.getString("Description")));

                System.out.println("Category ID: " + rs.getInt("CategoryID"));
                System.out.println("Category Name: " + rs.getString("CategoryName"));
                System.out.println("Description: " + rs.getString("Description"));  // In mật khẩu ra
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<String> getCategoryName() {
        List<String> list = new ArrayList<>();
        String query = "SELECT CategoryName From categories";
        try {
            conn = new TestConnect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("CategoryName"));
                System.out.println("Category Name: " + rs.getString("CategoryName"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Xoa Loai San Pham
    public void deleteCategory(int categoryid) {
        String query = "DELETE FROM categories where CategoryID=?";
        try {
            conn = new TestConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, categoryid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Đóng kết nối và PreparedStatement
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Them Loai San Pham
    public void insertCategory(Categories categories) {
        String query = "INSERT INTO categories (CategoryID,CategoryName,Description) "
                + "VALUES (?, ?, ?)";
        try {
            conn = new TestConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, categories.getCategoryid());
            ps.setString(2, categories.getCategoryname());
            ps.setString(3, categories.getDescription());
            int rowsAffected = ps.executeUpdate(); // Sử dụng executeUpdate()
            System.out.println("Rows affected: " + rowsAffected);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

///////////////////////////////////////////////// Quan Ly SAN PHAM /////////////////////////////////////////////////
    public void insertProduct(Products products) {
        String query = "INSERT INTO products (ProductID,CategoryID,ProductName,UnitPrice,QInStore,ImageProduct) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            conn = new TestConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, products.getProductid());
            ps.setInt(2, products.getCategoryid());
            ps.setString(3, products.getProductnameString());
            ps.setDouble(4, products.getPrice());
            ps.setInt(5, products.getQuantity());
            ps.setBlob(6, products.getImg());
            int rowsAffected = ps.executeUpdate(); // Sử dụng executeUpdate()
            System.out.println("Rows affected: " + rowsAffected);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public Products getProductByID(int productid) {
        String query = "SELECT * FROM products WHERE ProductID =?";
        Products product = null;
        try {
            conn = new TestConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productid);
            rs = ps.executeQuery();
            if (rs.next()) {
                product = new Products();
                product.setProductid(rs.getInt("ProductID"));
                product.setCategoryid(rs.getInt("CategoryID"));
                product.setProductnameString(rs.getString("ProductName"));
                product.setPrice(rs.getDouble("UnitPrice"));
                product.setQuantity(rs.getInt("QInStore"));
                product.setImg(rs.getBinaryStream("ImageProduct"));
               
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return product;
    }
    
    public List<Products> getAllProducts() {
        List<Products> list = new ArrayList<>();
        String query = "SELECT *FROM products";
        try {
            conn = new TestConnect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()){
                list.add(new Products(rs.getInt("ProductID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ProductName"),
                        rs.getDouble("UnitPrice"),
                        rs.getInt("QInStore"),
                        rs.getBinaryStream("ImageProduct")
                ));
                System.out.println("Product ID: "+rs.getInt("ProductID"));
                System.out.println("Category ID: "+ rs.getInt("CategoryID"));
                System.out.println("Product Name: "+ rs.getString("ProductName"));
                System.out.println("Unit Price: "+rs.getDouble("UnitPrice"));
                System.out.println("Quantity in Store: "+rs.getInt("QInStore"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public void deleteProduct(int productid) {
        String query = "DELETE FROM products where ProductID=?";
        try {
            conn = new TestConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Đóng kết nối và PreparedStatement
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
