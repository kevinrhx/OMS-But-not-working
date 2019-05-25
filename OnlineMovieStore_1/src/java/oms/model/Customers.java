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
public class Customers {
    
    private ArrayList<Customer> customers = new ArrayList<Customer>();
    
    public ArrayList<Customer> getAllCustomers() {
        return this.customers;
    }
    
    public void addCustomer(Customer customer) {
        customers.add(customer);
    }
    
    public void removeCustomer(Customer customer) {
        customers.remove(customer);
    }
    
    public Customer login(String ID, String password) {
        // For any Customers
        for (Customer c : customers) {
            if (c.getCustomerID().equals(ID) && c.getPassword().equals(password))
            // login done.
                return c; 

        }
        //failed to login
        return null; 
    
}
}
