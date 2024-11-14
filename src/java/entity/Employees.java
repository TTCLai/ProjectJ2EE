/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;
import java.io.*;
import java.util.Base64;
import java.util.logging.*;

/**
 *
 * @author LENOVO
 */
public class Employees {
   private int employeeid;
   private String fullname;
   private String password;
   private InputStream img;
   private int gender;
   private Date birthday;
   private String phonenumber;
   private double salary;
   private String address;
   
   public Employees(){
       
   }

    public Employees(int employeeid, String fullname,InputStream img, String password, int gender, Date birthday, String phonenumber, double salary, String address) {
        this.employeeid = employeeid;
        this.fullname = fullname;
        this.password = password;
        this.img = img;
        this.gender = gender;
        this.birthday = birthday;
        this.phonenumber = phonenumber;
        this.salary = salary;
        this.address = address;
       
    }
   
   

    public int getEmployeeid() {
        return employeeid;
    }

    public void setEmployeeid(int employeeid) {
        this.employeeid = employeeid;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public InputStream getImg() {
        return img;
    }

    public void setImg(InputStream img) {
        this.img = img;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    
    @Override
    public String toString() {
        return "Employees{" + "employeeid=" + employeeid + ", fullname=" + fullname + ", password=" + password + ", img=" + img + ", gender=" + gender + ", birthday=" + birthday + ", phonenumber=" + phonenumber + ", salary=" + salary + ", address=" + address + '}';
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
   
   
    
}
