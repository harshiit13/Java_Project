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
@WebServlet(name = "show_1", urlPatterns = {"/show_1"})
public class show extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String rcamp = request.getParameter("rcamp");
        
        Cookie cookie = new Cookie("rcamp", rcamp);
        
        cookie.setMaxAge(24 * 60 * 60);
      
        response.addCookie(cookie);
        response.sendRedirect("camp_info.jsp");
      
      
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
