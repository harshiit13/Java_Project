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
      String duration0 = formParameters.get("duration");
     // int duration = Integer.parseInt(duration0);
      String pickup = formParameters.get("pickup");
      String location = formParameters.get("location");
      String age0 = formParameters.get("age");
     // int age = Integer.parseInt(age0);
      String price0 = formParameters.get("price");
     // int price = Integer.parseInt(price0);
      String base_camp = formParameters.get("base_camp");
      String capacity0 = formParameters.get("capacity");
     // int capacity = Integer.parseInt(capacity0);
      String altitude0 = formParameters.get("altitude");
    //  int altitude = Integer.parseInt(altitude0);

        // Get the byte array from the output strea
         PrintWriter out = response.getWriter();
         
      out.println("In post request after camp submission ");
      out.print(name);
      out.println(age0);
      out.println(price0);
      out.println(duration0);
     
      out.println(capacity0);
       out.println(pickup);
      out.println(date);
      out.println(base_camp);

      
      
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
