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
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.*;

/**
 *
 * @author harsh
 */
@WebServlet(urlPatterns = {"/reg_check"})
public class reg_check extends HttpServlet {

     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    }

  

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        
        PrintWriter out = response.getWriter();
        out.println(name);
        out.println(email);
        out.println(username);
        out.println(address);
        out.println(password);
        out.println(phone);
        
        
        String jdbcURL = "jdbc:mysql://localhost:3306/java_project";
        String jdbcUsername = "root";
        String jdbcPassword = "";
        System.out.print("Here we are after password ---------- ----");
         try {
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            if(connection != null){
            
            String sql = "INSERT INTO org (name, email, username, address, password, phone) VALUES (?, ?, ?, ?, ?, ?)";

            // Create PreparedStatement
            PreparedStatement statement = connection.prepareStatement(sql);
            // Set parameters
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, username);
            statement.setString(4, address);
            statement.setString(5, password);
            statement.setString(6, phone);

            // Execute the insert statement
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                out.println("Data insetrted successfuly !!!!.....!!!!");
                Cookie cookie = new Cookie("username", username);   
        response.addCookie(cookie);
        response.sendRedirect("index.jsp");
            }else{
                out.println("Oh nooo problem -------");
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
