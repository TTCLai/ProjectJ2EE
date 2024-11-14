/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.AdminDao;
import entity.Categories;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author LENOVO
 */
public class InsertCategory extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String categoryname = request.getParameter("categoryname");
        System.out.println("abc :" + categoryname);
//        try {
//            String categoryIdParam = request.getParameter("id");
//            System.out.println("category ID Param: " + categoryIdParam);
//            int categoryId = 0; 
//            if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
//                try {
//                    categoryId = Integer.parseInt(categoryIdParam); 
//                } catch (NumberFormatException e) {
//                    throw new IllegalArgumentException("Mã loại sản phẩm không hợp lệ."); 
//                }
//            } else {
//                throw new IllegalArgumentException("Mã loại sản phẩm không thể để trống."); 
//            }

            String description = request.getParameter("description");
            System.out.println("description");

            Categories category = new Categories();
//            category.setCategoryid(categoryId);
            category.setCategoryname(categoryname);
            category.setDescription(description);

            AdminDao adminDao = new AdminDao();
            adminDao.insertCategory(category);

            response.sendRedirect("TaiLoaiSanPham");

//        } catch (NumberFormatException e) {
//            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Tham số không hợp lệ: " + e.getMessage());
//        } catch (IllegalArgumentException e) {
//            response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Có lỗi xảy ra trong quá trình xử lý yêu cầu.");
//        }
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
