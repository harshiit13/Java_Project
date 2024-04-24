<%-- 
    Document   : my_cus
    Created on : 24 Apr, 2024, 2:51:37 AM
    Author     : harsh
--%>
<%@ page import="java.io.*, java.sql.*, java.util.Base64" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Details</title>
        <style>
                .details {
      width: 100%;
      padding: 20px;
      box-sizing: border-box;
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
    }
        .container {
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
      align-items: center;
      margin-top: 50px;
      padding: 20px;
      background-color: #fff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
    }
    
      body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f4f4;
    }
    .details p {
      flex: 0 0 48%;
      margin: 10px 0;
      font-size: 14px;
      color: #666;
      text-align: left;
    }
        </style>
    </head>
    <body>
        <h1>Inside customeer details!</h1>
        
            <% 
        String username1 = "";
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            // Iterate over cookies to find the one you need
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    username1 = cookie.getValue();
                    // Now 'username' contains the value of the cookie named 'username'
                    break; // Exit the loop once the cookie is found
                }
            }
        }
        
        try {
            String jdbcUrl = "jdbc:mysql://localhost:3306/java_project";
            String id = "root";
            String org = "";
            String password = "";
            System.out.println("Before try .....  ");
            Connection connection;
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcUrl, id, password); 
                Statement stmt1 = connection.createStatement();
            Statement stmt = connection.createStatement();
            ResultSet rs1 = stmt1.executeQuery("SELECT * FROM camp where organization='"+username1+"'");
               
               System.out.println("after resultset ");
                 while (rs1.next()) {
               ResultSet rs = stmt.executeQuery("SELECT * FROM userdata where org='"+rs1.getInt("id")+"'");
            while (rs.next()) {
             
                %>
                
                <div class="container">
                   <div class="details">
                       <p><h1> <%= rs1.getString("name") %> </h1></p>
      <p><strong>Full Name : </strong> <%= rs.getString("full_name") %> </p>
      <p><strong>Date of Birth : </strong> <%= rs.getString("DOB") %> </p>
      <p><strong>Nationality : </strong> <%= rs.getString("nationality") %> </p>
      <p><strong>Email : </strong> <%= rs.getString("email") %> years</p>
      <p><strong>Phonr Number :</strong> <%= rs.getString("phone_number") %>  </p>
      <p><strong>Gender : </strong> <%= rs.getString("gender") %> </p>
      <p><strong>Payment Method :</strong> <%= rs.getString("payment_mode") %> </p>
      <p><strong>Medical details :</strong> <%= rs.getString("medical_info") %> </p>
      <p><strong>Treking Information : </strong> <%= rs.getString("tracking_info") %>  </p>
      <p><strong>Fitness Level :</strong> <%= rs.getString("fitness_level") %> </p>
    </div>
    </div>
                
                
                              <%
            }
}
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    <button onclick="window.location.href='index.jsp'"> Back </button>
        
    </body>
</html>
