/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.event.servlet;


import com.event.dao.EventInterestMappingDao;
import com.event.dao.InterestDao;

import com.event.entities.Event;

import com.tech.blog.helper.ConnectionProvider;
import jakarta.servlet.ServletException;

import jakarta.servlet.http.*;
import java.io.BufferedReader;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.stream.Collectors;

public class Recommendation extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            
           BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
            String payload = reader.lines().collect(Collectors.joining());    
            String[] interests = payload.split(",");
            
            
           HttpSession session = request.getSession();
           Event event = (Event) session.getAttribute("event");
           int e_id=event.getId();
           
           out.println("recommend ke andar ");
           
           
           
            InterestDao dao=new InterestDao(ConnectionProvider.getConnection());
            EventInterestMappingDao e_i_dao=new EventInterestMappingDao(ConnectionProvider.getConnection());
           
            
           int s=1,e=1,m=interests.length;
           
            for(int i=0;i<m;i++)
            {
                String str=interests[i];
                int n=str.length();
                s=i==0?2:1;
                e=i==m-1?n-2:n-1;
                
                String modified=str.substring(s,e);
                
                int int_id = dao.getIdByInterest(modified);
                boolean f=false;
                if(int_id!=-1){
                    f=e_i_dao.addEventInterestMapping(e_id, int_id);
                }
                
               out.println(f);
            }
           
           
//           out.println(event.getId());
           
           
            
            
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
