<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, java.util.Base64" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Trek Details</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f4f4;
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

    .trek-name {
      font-size: 24px;
      margin-top: 0;
      color: #333;
      text-align: center;
    }

    .trek-image img {
      width: 100%;
      height: 30vh; /* 30% of viewport height */
      object-fit: cover;
      border-top-left-radius: 10px;
      border-top-right-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .trek-description {
      font-size: 16px;
      color: #666;
      text-align: center;
      padding: 20px;
    }

    .details {
      width: 100%;
      padding: 20px;
      box-sizing: border-box;
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
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
<% 
    try {
        String jdbcUrl = "jdbc:mysql://localhost:3306/java_project";
        String id = "root";
        String password = "";
        String value = "";
        System.out.println("Before try .....  ");
        Connection connection = null;
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcUrl, id, password); 
        Statement stmt = connection.createStatement();
         Cookie[] cookies = request.getCookies();
         if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("rcamp")) {
                     value = cookie.getValue();
                    
                    break; // Exit the loop once the cookie is found
                }
            }
         }
        ResultSet rs = stmt.executeQuery("SELECT * FROM camp where id="+value);
        while (rs.next()) {
            Blob imageBlob = rs.getBlob("photo");
            byte[] imageData = imageBlob.getBytes(1, (int) imageBlob.length());
            String base64Image = Base64.getEncoder().encodeToString(imageData);
%>
  <h1 class="trek-name"> <%= rs.getString("name") %> </h1>
  <div class="container">
    <div class="trek-image">
     <img class="img-fluid h-100" src="data:image/jpeg;base64,<%= base64Image %>" alt="Image">
    </div>
    <p class="trek-description">  
        <%= rs.getString("description") %>
    </p>
    <div class="details">
      <p><strong>Duration:</strong> <%= rs.getString("duration") %> days</p>
      <p><strong>Difficulty:</strong> <%= rs.getString("difficulty") %> </p>
      <p><strong>Location:</strong> <%= rs.getString("location") %> </p>
      <p><strong>Minimum Age:</strong> <%= rs.getString("age") %> years</p>
      <p><strong>Price:</strong> <%= rs.getString("price") %> rs. </p>
      <p><strong>Altitude:</strong> <%= rs.getString("altitude") %> </p>
      <p><strong>Pickup:</strong> <%= rs.getString("pickup") %> </p>
      <p><strong>Basecamp:</strong> <%= rs.getString("base_camp") %> </p>
      <p><strong>Capacity:</strong> <%= rs.getString("capacity") %>  Persons</p>
      <p><strong>Organization:</strong> <%= rs.getString("organization") %> </p>
    </div>
    <div>
        <button onclick="window.location.href = 'form2.jsp'">
            Register
        </button>
    </div>
  </div>
<%
        }
    } catch (Exception e) {
System.out.printf("Some error occured inside jsp file");
        e.printStackTrace();
    }
%>
</body>
</html>
