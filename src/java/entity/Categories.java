/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author LENOVO
 */
public class Categories {
    private int  categoryid;
    private String categoryname;
    private String description;
    public Categories(){
        
    }

    public Categories(int categoryid, String categoryname, String description) {
        this.categoryid = categoryid;
        this.categoryname = categoryname;
        this.description = description;
    }
    
    

    public int getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    public String getCategoryname() {
        return categoryname;
    }

    public void setCategoryname(String categoryname) {
        this.categoryname = categoryname;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Categories{" + "categoryid=" + categoryid + ", categorynameString=" + categoryname+ ", descriptionString=" + description + '}';
    }
    
    
}
