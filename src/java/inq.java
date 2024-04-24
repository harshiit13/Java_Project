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
        
    String JDBC_URL = "jdbc:mysql://localhost:3306/java_project";
    String JDBC_USERNAME = "root";
    String JDBC_PASSWORD = "";

    // Stored procedure to insert user data
    String INSERT_USER_DATA_SP = "{CALL InsertUserData(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,?)}";
   
   
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
        
        
         
             PreparedStatement preparedStatement = connection.prepareCall(INSERT_USER_DATA_SP);

            // Set parameters for the stored procedure
            preparedStatement.setString(1, request.getParameter("full_name"));
            preparedStatement.setString(2, request.getParameter("DOB"));
            preparedStatement.setString(3, request.getParameter("nationality"));
            preparedStatement.setString(4, request.getParameter("email"));
            preparedStatement.setString(5, request.getParameter("phone_number"));
            preparedStatement.setString(6, request.getParameter("gender"));
            preparedStatement.setString(7, request.getParameter("payment_mode"));
            preparedStatement.setString(8, request.getParameter("medical_info"));
            preparedStatement.setString(9, request.getParameter("tracking_info"));
            preparedStatement.setString(10, request.getParameter("dietary_restrictions"));
            preparedStatement.setString(11, request.getParameter("fitness_level"));
               preparedStatement.setString(12, request.getParameter("org"));
            // Execute the stored procedure
            preparedStatement.executeUpdate();
        
        response.sendRedirect("/Java_Project/");
    }catch(Exception e){
        System.out.print(e.toString());
    }
}


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
