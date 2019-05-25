/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.model.DAO;
import oms.model.Customer;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import oms.model.Movie;
import oms.model.Staff;
import oms.model.Time;
/**
 *
 * @author Hieu
 */
public class DBManager {
    private Statement st;
    public DBManager (Connection conn) throws SQLException{
        st = conn.createStatement();
    }
    //Customer
    //Add Customer
    public void addCustomer(String ID, String name, String email, String password, String phone, String address, String status) throws SQLException
    {
        st.executeUpdate("Insert into ISDUSER.CUSTOMER values ('"+ID+"','"+name+"','"+email+"','"+password+"','"+phone+"','"+address+"','"+status+"')");
    }
    //get All Customer
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
    //Movies
    //get All Movies from db
    public ArrayList<Movie> getAllMovies() throws SQLException{
        ArrayList<Movie> movies = new ArrayList<Movie>();
        ResultSet rs = st.executeQuery("SELECT * from ISDUSER.MOVIE");
        while (rs.next()) {
            
        Movie movie = new Movie(rs.getString("ID"), rs.getString("Title"), rs.getString("Genre"), rs.getDouble("Price"),
        rs.getString("Releasedate"),rs.getInt("availableCopies"));
        
        movies.add(movie);
            
        }  
        return movies;
     
    
    }
    // Add Movie to db 
    public void addMovies(String ID, String title, String genre, double price, String releasedate, int availablecopies) throws SQLException
    {
        st.executeUpdate("Insert into ISDUSER.MOVIE values ('"+ID+"','"+title+"','"+genre+"',"+price+",'"+releasedate+"',"+availablecopies+")");
    }
    //Edit Movies in db
    public void updateMovie(String ID, String title, String genre, double price, String releasedate, int availablecopies) throws SQLException {
        //code for update-operation
        st.executeUpdate("Update ISDUSER.MOVIE SET TITLE ='"+title+"', GENRE='"+genre+"',PRICE="+price+",RELEASEDATE='"+releasedate+"', AVAILABLECOPIES="+availablecopies+"  Where ID= '"+ID+"' ");
        
    }
    //Delete Movies in db
    public void deleteMovie(String ID) {
        try {
            st.executeUpdate("Delete from ISDUSER.MOVIE Where ID ='"+ID+"'  ");
        } catch (SQLException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    //Search for movies for searching from the header
    public ArrayList<Movie> searchMovies(String search) throws SQLException {
        ArrayList<Movie> Searchmovies = new ArrayList<Movie>();
        ResultSet rs = st.executeQuery("Select * from ISDUSER.MOVIE WHERE TITLE LIKE '"+search+"' OR GENRE LIKE '"+search+"'");
        while(rs.next())
        {
             Movie movie = new Movie(rs.getString("ID"), rs.getString("Title"), rs.getString("Genre"), rs.getDouble("Price"),
            rs.getString("Releasedate"),rs.getInt("availableCopies"));
        
             Searchmovies.add(movie); 
        }
        return Searchmovies;
    }
   public ArrayList<Time> getAllTime() throws SQLException
    {
        ArrayList<Time> tim = new ArrayList<Time>();
        ResultSet rs = st.executeQuery("SELECT * from ISDUSER.LOGINTIME1");
       
        while (rs.next() ) 
        {
            
            Time time = new Time(rs.getString("1"), rs.getTimestamp("2"), rs.getTimestamp("3"));
            tim.add(time);
            
        }  
        return tim;
     
     
   }
    
    
   
     // Add record to db 
    public void addRecord(String ID, Timestamp loginT, Timestamp logoutT) throws SQLException
    {
        st.executeUpdate("Insert into ISDUSER.LOGINTIME1 values ('"+ID+"','"+loginT+"','"+logoutT+"')");
    }
//    //Edit record in db
//    public void updateRecord(String ID, Timestamp loginT, Timestamp logoutT) throws SQLException {
//        //code for update-operation
//        st.executeUpdate("Update ISDUSER.LOGINTIME SET TITLE =?????'"+title+"', GENRE='"+genre+"',PRICE="+price+",RELEASEDATE='"+releasedate+"', AVAILABLECOPIES="+availablecopies+"  Where ID= '"+ID+"' ");
//        
//    }
    //Delete record in db
    public void deleteRecord(String ID, Timestamp loginT) 
    {
        try 
        {
            st.executeUpdate("Delete from ISDUSER.LOGINTIME1 Where USERID ='"+ID+"' AND  LOGOUTTIME= '"+loginT+"'   ");
        } 
        catch (SQLException ex) 
        {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
     //Find record by times in the database
    public Time findRecord(String loginY,String loginM,String loginD) throws SQLException {
        //setup the select sql query string
        String searchQueryString = "select * from ISDUSER.LOGINTIME1 where (DATEPART(yy, LOGINTIME) = '"+loginY+"' AND DATEPART(mm, LOGINTIME) = '"+loginM+"' AND DATEPART(dd, LOGINTIME) = '"+loginD+"') ";
        //execute this query using the statement field
       //add the results to a ResultSet
         ResultSet rs = st.executeQuery(searchQueryString);
        //search the ResultSet for a records using the parameters
         boolean hasRecord = rs.next();
         
                 
         if(hasRecord){
         
             String sID = rs.getString("1");
             Timestamp sLoginT = rs.getTimestamp("2"); 
             Timestamp sLogoutT = rs.getTimestamp("3");
             
             
            return new Time (sID, sLoginT, sLogoutT);
         }
        
         rs.close();
        // st.close();
         
         return null;
         
    }
}
