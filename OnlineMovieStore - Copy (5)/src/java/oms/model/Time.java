/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.model;
import java.sql.*;
 

/**
 *
 * @author kevin
 */
public class Time {

       private String customerID;
       private Timestamp loginT;
       private Timestamp logoutT;
       
    public Time(String customerID, Timestamp loginT, Timestamp logoutT) {
        this.customerID = customerID;
        this.loginT = loginT;
        this.logoutT = logoutT;
    }

    public String getCustomerID() {
        return customerID;
    }

    public Timestamp getLoginT() {
        return loginT;
    }
 
    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public void setLoginT(Timestamp loginT) {
        this.loginT = loginT;
    }

    public void setLogoutT(Timestamp logoutT) {
        this.logoutT = logoutT;
    }

    public Timestamp getLogoutT() {
        return logoutT;
    }
    
       
   
}
