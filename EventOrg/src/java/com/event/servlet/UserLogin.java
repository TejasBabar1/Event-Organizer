/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.event.servlet;

import com.event.dao.AdminDao;
import com.event.dao.UserDao;
import com.event.entities.Admin;
import com.event.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author tejas
 */
public class UserLogin extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String user_name = request.getParameter("email");
            String pass = request.getParameter("pass");
            String wholog = request.getParameter("wholog");
            
            HttpSession session = request.getSession();
            if(wholog.equals("user")){
                UserDao dao=new UserDao(ConnectionProvider.getConnection());

                User user=dao.getUserByEmailPass(user_name, pass);
                if(user!=null){
                    session.setAttribute("user", user);
                    out.println("user");
                }
                else{
                    out.println("invalid credentials");
                }
            }
            else{
                AdminDao dao = new AdminDao(ConnectionProvider.getConnection());
                Admin admin = dao.getAdminByEmailPass(user_name, pass);
                
                if(admin!=null){
                    session.setAttribute("admin", admin);
                    out.println("admin");
                }
                else{
                    out.println("invalid credentials");
                }
                
                
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
