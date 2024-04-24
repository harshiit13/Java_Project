/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "my_camps_1", urlPatterns = {"/my_camps_1"})
public class my_camps extends HttpServlet {

 


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = "";
      PrintWriter out = response.getWriter();
        Cookie[] cookies = request.getCookies();
       if (cookies != null) {
            // Iterate over cookies to find the one you need
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                     username = cookie.getValue();
                    // Now 'value' contains the value of the cookie named 'rcamp'
                 
                    break; // Exit the loop once the cookie is found
                }
            }
response.sendRedirect("my_camps.jsp");
    }
    }
       

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
