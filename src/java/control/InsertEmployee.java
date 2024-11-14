/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.AdminDao;
import entity.Employees;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author LENOVO
 */
@MultipartConfig
public class InsertEmployee extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InsertEmployee</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InsertEmployee at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        processRequest(request, response);
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
//        processRequest(request, response);
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String fullName = request.getParameter("fullname");
        System.out.println(fullName);

        Part filePart = request.getPart("img");
        InputStream img = filePart.getInputStream();

        String password = request.getParameter("password");
        System.out.println(password);

        String address = request.getParameter("address");
        System.out.println(address);

        String phoneNumber = request.getParameter("phonenumber");

        // Tạo đối tượng Employees
        Employees employee = new Employees();
        employee.setFullname(fullName);
        employee.setImg(img);
        employee.setPassword(password);
        employee.setPhonenumber(phoneNumber);
        employee.setAddress(address);

        // Lưu nhân viên vào cơ sở dữ liệu
        AdminDao adminDao = new AdminDao();
        adminDao.insertEmployee(employee);

        System.out.println(employee.getFullname());

        // Chuyển hướng về danh sách nhân viên
        response.sendRedirect("TaiNhanVien");
//        response.sendRedirect("TaiTaiKhoan");

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
