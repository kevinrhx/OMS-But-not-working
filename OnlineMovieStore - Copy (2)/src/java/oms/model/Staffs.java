/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.model;

import java.util.ArrayList;

/**
 *
 * @author Bruce Moon
 */
public class Staffs {
    
    private ArrayList<Staff> staffs = new ArrayList<Staff>();
    
    public ArrayList<Staff> getAllStaff() {
        return this.staffs;
    }
    
    public void addStaff(Staff staff) {
        staffs.add(staff);
    }
    
    public void removeStaff(Customer customer) {
        staffs.remove(customer);
    }
    
    public Staff login(String ID, String password) {
        // For any Staff
        for (Staff s : staffs) {
            if (s.getStaffID().equals(ID) && s.getPassword().equals(password))
            // login done.
                return s; 

        }
        //failed to login
        return null; 
    
}
}
