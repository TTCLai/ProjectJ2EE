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

import dao.AdminDao;
import entity.Admin;
import entity.Employees;
import dao.EmpolyeeDao;

import javax.servlet.http.HttpSession;

/**
 *
 * @author LENOVO
 */
public class Login extends HttpServlet {

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
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        
        AdminDao admindao = new AdminDao();
        EmpolyeeDao empolyeedao = new EmpolyeeDao();
        
        // Kiểm tra nếu userId là số (để xác định Employee) hay không (để xác định Admin)
        Admin admin = admindao.login(userId, password);
        Employees employee = null;

        if(admin==null){
            try{
                int employeeid = Integer.parseInt(userId);
                employee = empolyeedao.login(employeeid, password);
            }catch(NumberFormatException e){
                
            }
        }
        HttpSession session = request.getSession();
        if(admin!=null){
            session.setAttribute("role", "admin");
            session.setAttribute("ad", admin);
            session.setMaxInactiveInterval(1000);
            request.getRequestDispatcher("home.jsp").forward(request, response);
            
        }
        else if(employee !=null){
            session.setAttribute("role", "employee");
            session.setAttribute("emp",employee);
            session.setMaxInactiveInterval(1000);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }
        else {
            // Thông báo lỗi nếu cả hai không thành công
            request.setAttribute("error", "Invalid credentials. Please try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
        processRequest(request, response);
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
