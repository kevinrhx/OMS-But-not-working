/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.model.DAO;
import oms.model.Customer;
import java.sql.*;
import java.util.ArrayList;
import oms.model.Staff;

/**
 *
 * @author Hieu
 */
public class DBManager {
    private Statement st;
    public DBManager (Connection conn) throws SQLException{
        st = conn.createStatement();
    }
    public void addCustomer(String ID, String name, String email, String password, String phone, String address, String status) throws SQLException
    {
        st.executeUpdate("Insert into ISDUSER.CUSTOMER values ('"+ID+"','"+name+"','"+email+"','"+password+"','"+phone+"','"+address+"','"+status+"')");
    }
    
    public ArrayList<Customer> getAllCustomers() throws SQLException{
        ArrayList<Customer> cus = new ArrayList<Customer>();
        ResultSet rs = st.executeQuery("SELECT * from ISDUSER.Customer");
        while (rs.next()) {
            
        Customer customer = new Customer(rs.getString("ID"), rs.getString("Name"), rs.getString("Email"), rs.getString("Password"),
        rs.getString("Phone"), rs.getString("Address"),rs.getString("Status"));
        
        cus.add(customer);
            
        }  
        return cus;
     
    
    }
    public void addStaff(String ID, String name, String email, String password, String phone, String address, int authorisation, String role) throws SQLException
    {
        st.executeUpdate("Insert into ISDUSER.STAFF values ('"+ID+"','"+name+"','"+email+"','"+password+"','"+phone+"','"+address+"',"+authorisation+",'"+role+"')");
    }
    public ArrayList<Staff> getAllStaff() throws SQLException
    {
        ArrayList<Staff> sta = new ArrayList<Staff>();
        ResultSet rs = st.executeQuery("select * from ISDUSER.STAFF");
        while (rs.next()) {
            
        Staff staff = new Staff(rs.getString("ID"), rs.getString("Name"), rs.getString("Email"), rs.getString("Password"),
        rs.getString("Phone"), rs.getString("Address"),rs.getInt("Authorisation"), rs.getString("Role"));
        
        sta.add(staff);
            
        }
        return sta;
    }
    
}