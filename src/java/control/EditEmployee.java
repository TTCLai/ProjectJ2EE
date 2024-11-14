/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.AdminDao;
import entity.Employees;
import java.sql.*;

/**
 *
 * @author LENOVO
 */
public class EditEmployee extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String employeeIdStr = request.getParameter("employeeid");
    
      System.out.println(employeeIdStr);

    if (employeeIdStr != null) {
        try {
            int employeeId = Integer.parseInt(employeeIdStr);
            AdminDao adminDao = new AdminDao();
            Employees employee = adminDao.getEmployeeByID(employeeId);
            request.setAttribute("employee", employee);
            request.getRequestDispatcher("FormEdit.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            // Handle the case where the parameter is not a valid integer
            // (e.g., log an error, send an error message to the user)
            // You might want to redirect to an error page or display an error message
            response.sendRedirect("error.jsp"); // Example: Redirect to an error page
        }
    } else {
        // Handle the case where the parameter is missing
        // (e.g., log an error, send an explanation to the user)
        // You might want to redirect to an error page or display an error message
        response.sendRedirect("error.jsp"); // Example: Redirect to an error page
    }
}

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        int employeeid = Integer.parseInt(request.getParameter("employeeid"));
        String fullname = request.getParameter("fullname");
        String img = request.getParameter("img");
        String password = request.getParameter("password");
        int gender = Integer.parseInt(request.getParameter("gender"));
        java.sql.Date birthday = java.sql.Date.valueOf(request.getParameter("birthday"));
        String phonenumber = request.getParameter("phonenumber");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String address = request.getParameter("address");
        Employees employee = new Employees();
        employee.setEmployeeid(employeeid);
        employee.setFullname(fullname);
//        employee.setImg(img);
        employee.setPassword(password);
        employee.setGender(gender);
        employee.setGender(gender);
        employee.setBirthday(birthday);
        employee.setPhonenumber(phonenumber);
        employee.setSalary(salary);
        employee.setAddress(address);
        AdminDao adminDao = new AdminDao();
        adminDao.editEmployee(employee);
        response.sendRedirect("TaiNhanVien");

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
