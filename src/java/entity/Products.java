/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LENOVO
 */
public class Products {
    private int productid;
    private int categoryid;
    private String productname;
    private double price;
    private int quantity;
    private InputStream img;
    public Products(){
        
    }

    public Products(int productid, int categoryid, String productname, double price, int quantity, InputStream img) {
        this.productid = productid;
        this.categoryid = categoryid;
        this.productname = productname;
        this.price = price;
        this.quantity = quantity;
        this.img = img;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public int getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    public String getProductnameString() {
        return productname;
    }

    public void setProductnameString(String productnameString) {
        this.productname = productnameString;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public InputStream getImg() {
        return img;
    }

//    public InputStream getImageproductInputStream() {
//        return img;
//    }
//
//    public void setImageproductInputStream(InputStream img) {
//        this.img = img;
//    }
    public void setImg(InputStream img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Products{" + "productid=" + productid + ", categoryid=" + categoryid + ", productnameString=" + productname+ ", price=" + price + ", quantity=" + quantity + ", imageproductInputStream=" + img+ '}';
    }
    public String getUrlImage() {
        BufferedReader br = new BufferedReader(new InputStreamReader(img));
        String aux;
        StringBuffer strOut = new StringBuffer();
        try {
            while ((aux = br.readLine()) != null) {
                strOut.append(aux);
            }
        } catch (IOException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return strOut.toString();
    }

    public void setCategoryid(String Category) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
