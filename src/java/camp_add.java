/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.*;
import java.util.*;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author harsh
 */
@WebServlet(name = "camp_add", urlPatterns = {"/camp_add"})
public class camp_add extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
      
       
       
//      String name = request.getParameter("name");
//      String date = request.getParameter("date");
//      String description = request.getParameter("description");
//      String duration0 = request.getParameter("duration");
//      int duration = Integer.parseInt(duration0);
//      String pickup = request.getParameter("pickup");
//      String location = request.getParameter("location");
//      String age0 = request.getParameter("age");
//      int age = Integer.parseInt(age0);
//      String price0 = request.getParameter("price");
//      int price = Integer.parseInt(price0);
//      String base_camp = request.getParameter("base_camp");
//      String capacity0 = request.getParameter("capacity");
//      int capacity = Integer.parseInt(capacity0);
//      String altitude0 = request.getParameter("altitude");
//      int altitude = Integer.parseInt(altitude0);
      

        // Create a map to store form parameters
        Map<String, String> formParameters = new HashMap<>();

        // Retrieve multipart data
        Collection<Part> parts = request.getParts();
        for (Part part : parts) {
            if (part.getContentType() == null) { // Regular form field
                String fieldName = part.getName();
                String fieldValue = request.getParameter(fieldName);
                formParameters.put(fieldName, fieldValue);
            }
        }
        
      String name = formParameters.get("name");
      String date = formParameters.get("date");
      String description = formParameters.get("description");
      String duration = formParameters.get("duration");
     
      String pickup = formParameters.get("pickup");
      String location = formParameters.get("location");
      String age = formParameters.get("age");
    
      String price = formParameters.get("price");
      String difficulty = formParameters.get("difficulty");
     
      String base_camp = formParameters.get("base_camp");
      String capacity = formParameters.get("capacity");
      String organization = formParameters.get("organization");
      String altitude = formParameters.get("altitude");
  

        // Get the byte array from the output strea
         PrintWriter out = response.getWriter();
         
//         String SAVE_DIR = "uploads";
//          String appPath = request.getServletContext().getRealPath("");
//        String savePath = appPath + File.separator + SAVE_DIR;
//
//        File fileSaveDir = new File(savePath);
//        if (!fileSaveDir.exists()) {
//            fileSaveDir.mkdir();
//        }
//
//        String fileName = "";
//        for (Part part : request.getParts()) {
//            fileName = extractFileName(part);
//            part.write(savePath + File.separator + fileName);
//        }
//
//        response.getWriter().println("File " + fileName + " uploaded successfully!");



 String jdbcUrl = "jdbc:mysql://localhost:3306/java_project";
        String username = "root";
        String password = "";
 System.out.println("Before try .....  ");
 Connection connection;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcUrl, username, password); 
            Class.forName("com.mysql.jdbc.Driver");
            Part part = request.getPart("photo");
            System.out.println("Here at part images ... ");
            String fileName = extractFileName(part);
            InputStream inputStream = part.getInputStream();

            String sql = "INSERT INTO camp (name,date,description,duration,pickup,location,difficulty,age,price,base_camp,capacity,altitude,photo,organization) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, name);
                statement.setString(2, date);
                statement.setString(3, description);
                statement.setString(4, duration);
                statement.setString(5, pickup);
                 statement.setString(6, location);
                  statement.setString(7 , difficulty);
                   statement.setString(8 , age);
                    statement.setString(9 , price);
                     statement.setString(10, base_camp);
                      statement.setString(11, capacity);
                       statement.setString(12, altitude);
                statement.setBlob(13, inputStream);
                statement.setString(14, organization);
                statement.executeUpdate();
            }

            response.sendRedirect("index.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
             System.out.println(e.toString());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(camp_add.class.getName()).log(Level.SEVERE, null, ex);
        }
    

 
         
        

      
      
    }
    
       private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return "";
    }
       
        private byte[] toByteArray(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int bytesRead;
        while ((bytesRead = in.read(buffer)) != -1) {
            out.write(buffer, 0, bytesRead);
        }
        return out.toByteArray();
    }
}


   
