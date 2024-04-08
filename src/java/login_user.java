/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author harsh
 */
@WebServlet(urlPatterns = {"/login_user_1"})
public class login_user extends HttpServlet {

 


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.print("Hello");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        PrintWriter out = response.getWriter();
          out.print("Inside DoPost method ");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        out.println(email);
        out.println(password);
       
        
          String jdbcURL = "jdbc:mysql://localhost:3306/java_project";
        String jdbcUsername = "root";
        String jdbcPassword = "";
        System.out.print("Here we are after password ---------- ----");
         try {
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            if(connection != null){
            
            String sql = "SELECT password,username FROM org where email = 'harshitsinhdabhi.21.ce@iite.indusuni.ac.in'";

            // Create PreparedStatement
            Statement statement = connection.createStatement();
            // Set parameters
            

            // Execute the insert statement
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                String username = resultSet.getString("username");
                String pass = resultSet.getString("password");
                if(pass.equals(password)){
                     Cookie cookie = new Cookie("username",username);   
        response.addCookie(cookie);
        response.sendRedirect("index.jsp");
                }
                
            }

            // Close resources
            statement.close();
            connection.close();
            }
           else{
                out.print("Problem in connection ..--");
            }
       } catch (SQLException | ClassNotFoundException e) {
          e.printStackTrace();
           System.out.print("Something went wrong inside try ");
       }
        
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
