/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import entity.Products;
import entity.Admin;
import dao.AdminDao;
import entity.Categories;
import java.util.List;
import javax.servlet.annotation.MultipartConfig;

/**
 *
 * @author LENOVO
 */
@MultipartConfig
public class InsertProduct extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        Products product = new Products();
        String productName = request.getParameter("productname");

        Part filePart = request.getPart("productimg");
        InputStream productImg = filePart.getInputStream();

        String priceParam = request.getParameter("price");
        System.out.println(priceParam);
        double price = 0;
        price = Double.parseDouble(priceParam);

        String quantityParam = request.getParameter("quantity");
        System.out.println(quantityParam);
        int quantity = 0;
        quantity = Integer.parseInt(quantityParam);
        
        String categoryIdParam = request.getParameter("categoryid");
        if ( categoryIdParam == null){
            System.out.println("loai san pham bi null");
        }else{
            int categoryId = Integer.parseInt(categoryIdParam);
            product.setCategoryid(categoryId);
        }

//        int categoryId = Integer.parseInt(request.getParameter("categoryid"));

        
        product.setProductnameString(productName);
        product.setImg(productImg);
        product.setPrice(price);
        product.setQuantity(quantity);
        

        AdminDao adminDao = new AdminDao();
        adminDao.insertProduct(product);
         response.sendRedirect("TaiSanPham");
//        response.sendRedirect("LayLoaiSanPham");
//        

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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
