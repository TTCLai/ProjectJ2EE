/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author LENOVO
 */
public class Admin {
    private int userid;
    private String username;
    private String password;
    
    public Admin(){
        
    }

    public Admin(int userid, String username, String password) {
        this.userid = userid;
        this.username = username;
        this.password = password;
    }
    

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Admin{" + "userid=" + userid + ", username=" + username + ", password=" + password + '}';
    }
    
    
    
}
