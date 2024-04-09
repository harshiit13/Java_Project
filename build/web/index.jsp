<%-- 
    Document   : index.jsp
    Created on : 5 Apr, 2024, 2:40:44 PM
    Author     : harsh
--%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page language="java" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        
        <% 
               String username = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        // Iterate through cookies to find the username cookie
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("username")) {
                // Found the username cookie, get its value
                username = cookie.getValue();
                break;
            }
        }
    }
            %>
        
        <section>
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Trip my Site</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
         <%
 
    if (username != null) {
     out.println("<li class='nav-item'><a class='nav-link' href='/Java_Project/create_camp'>Create Camp</a></li>   <li class='nav-item'><a class='nav-link' href='#'>My Camps</a></li>");
        
    } else {
     out.println("<li class='nav-item'><a class='nav-link' href='/Java_Project/register'>Register</a></li>");
    }
%>
       
        <li class="nav-item">
          <a class="nav-link disabled" aria-disabled="true">Disabled</a>
        </li>
      </ul>
        
        
        
 <%
 
    if (username != null) {
        
        out.println("<div class='d-flex ms-auto order-5'>Logout</div>");
    } else {
        System.out.println("Hwere iside oyttttttt");
         out.println("<div class='d-flex ms-auto order-5'><a class='nav-link' href='/Java_Project/login'>LogIn</a></div>");
    }
%>
        
      
        
    </div>
  </div>
</nav>

<section>
    <% 

 String jdbcUrl = "jdbc:mysql://localhost:3306/java_project";
 String id = "root";
        String password = "";
 System.out.println("Before try .....  ");
 Connection connection;
     
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcUrl, id, password); 
            Class.forName("com.mysql.jdbc.Driver");
        Statement stmt = null;
        ResultSet rs = null;
stmt = connection.createStatement();
 rs = stmt.executeQuery("SELECT * FROM camp");
 while (rs.next()) {
    %>

  <div class="container mt-5">
    <div class="card">
      <div class="row no-gutters">
        <div class="col-md-4">
          <img src="https://via.placeholder.com/150" class="card-img" alt="Placeholder Image">
        </div>
        <div class="col-md-8">
          <div class="card-body">
            <h5 class="card-title"><%= rs.getString("name") %></h5>
            <p class="card-text">Some example text. Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptate numquam enim deserunt repellat provident nisi aperiam! Fugit laudantium vero labore!</p>
            <ul class="list-group list-group-flush">
              <li class="list-group-item"><strong>Data 1:</strong>let's try</li>
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

    <% } %>
    
    
</section>
        </section>
        
        
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
