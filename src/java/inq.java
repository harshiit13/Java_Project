/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author harsh
 */
@WebServlet(urlPatterns = {"/inq"})
public class inq extends HttpServlet {



 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    String JDBC_URL = "jdbc:mysql://localhost:3306/your_database_name";
    String JDBC_USERNAME = "your_username";
    String JDBC_PASSWORD = "your_password";

    // Stored procedure to insert user data
    String INSERT_USER_DATA_SP = "{CALL InsertUserData(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
   
   
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
        
        
         
             PreparedStatement preparedStatement = connection.prepareCall(INSERT_USER_DATA_SP);

            // Set parameters for the stored procedure
            preparedStatement.setString(1, userData.getFullName());
            preparedStatement.setDate(2, userData.getDateOfBirth());
            preparedStatement.setString(3, userData.getNationality());
            preparedStatement.setString(4, userData.getEmail());
            preparedStatement.setString(5, userData.getPhoneNumber());
            preparedStatement.setString(6, userData.getGender());
            preparedStatement.setString(7, userData.getPaymentMode());
            preparedStatement.setString(8, userData.getMedicalInfo());
            preparedStatement.setString(9, userData.getTrackingInfo());
            preparedStatement.setString(10, userData.getDietaryRestrictions());
            preparedStatement.setInt(11, userData.getFitnessLevel());

            // Execute the stored procedure
            preparedStatement.executeUpdate();
        
        PrintWriter out = response.getWriter();
        out.println("Heello there it's in post method");
        out.println(request.getParameter("org"));
    }catch(Exception e){
        System.print.out(e.toString());
    }
}


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
