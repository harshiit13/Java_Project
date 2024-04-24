<%-- 
    Document   : my_camps
    Created on : 24 Apr, 2024, 2:11:55 AM
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
    <title>JSP Page</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
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
            String password = "";
            System.out.println("Before try .....  ");
            Connection connection;
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcUrl, id, password); 
            Statement stmt = connection.createStatement();
               ResultSet rs = stmt.executeQuery("SELECT * FROM camp where organization='"+username1+"'");
               System.out.println("after resultset ");
            while (rs.next()) {
                Blob imageBlob = rs.getBlob("photo");  
                byte[] imageData = imageBlob.getBytes(1, (int) imageBlob.length());
                String base64Image = Base64.getEncoder().encodeToString(imageData);
                %>
                
            
  <div class="container mt-5">
    <div class="card">
      <div class="row no-gutters">
        <div class="col-md-4">
          <img class="img-fluid h-100" src="data:image/jpeg;base64,<%= base64Image %>" alt="Image">
        </div>
        <div class="col-md-8">
          <div class="card-body">
            <h5 class="card-title"> <%= rs.getString("name") %> </h5>
            <p class="card-text"><%= rs.getString("description") %></p>
            <ul class="list-group list-group-flush">
              <li class="list-group-item"><strong>Date</strong><%= rs.getString("date") %></li>
              <li class="list-group-item"><strong>Data 2:</strong> Value 2</li>
              <li class="list-group-item"><strong>Data 3:</strong> Value 3</li>
              <!-- Add more data fields here if needed -->
            </ul>
            <!-- Additional fields or buttons can be added here -->
          </div>
        </div>
      </div>
    </div>
  </div>
             
                
                
                <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

    <div class='row m-5'>
        <div class='col-6'></div>
    <div class='col-1'>
    <button class="btn btn-primary" onclick="window.location.href = 'index.jsp'"> Back </button>
    </div> 
              <div class='col-5'></div>
        </div>
    
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
