
/*This stand-alone application test the connection to the db once setup in DB class
 *It performs an add-function of a Student to the database
 *To use this app, you should complete the addStudent method in DBManager class
 *
 *
 *@author George
**/
package oms.model.controller;

import oms.model.DAO.DBManager;
import oms.model.DAO.DBConnector;
import java.sql.*;
import java.util.*;
import java.util.logging.*;

public class Test {
    private static Scanner in = new Scanner(System.in);
    
    public static void main(String[] args) {
        try {
            DBConnector connector = new DBConnector(); //Create a connection and initialize DB conn-field
            Connection conn = connector.openConnection(); //Get the protected connection instance from DB superclass to share for the application classes
            DBManager db = new DBManager(conn); //DBManger instance provide users with access to CRUD operations
            
            int key = (new Random()).nextInt(999999);
            String ID = "" + key; 
            System.out.print("Student email: ");
            String email = in.nextLine();
            System.out.print("Student name: ");
            String name = in.nextLine();
            System.out.print("Student password: ");
            String password = in.nextLine();
            System.out.print("Student DOB: ");
            String phone = in.nextLine();
            System.out.print("Student favorite color: ");
            String address = in.nextLine();
            String status = "ke";
            db.addCustomer(ID, email, name, password, phone, address,status); //This method must be completed in DBManager class
            System.out.println("Student is added to the database.");
            connector.closeConnection(); //Professional practice is to close connection to database once operations are finalized
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Test.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}