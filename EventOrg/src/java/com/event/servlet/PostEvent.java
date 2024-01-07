/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.event.servlet;

import com.event.dao.AdminDao;
import com.event.dao.EventDao;
import com.event.dao.UserDao;
import com.event.entities.Admin;
import com.event.entities.Event;
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
public class PostEvent extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            out.println("our data is ");
            String eName = request.getParameter("eventName");
            String eDate = request.getParameter("eventDate");
            String location = request.getParameter("location");
            String sTime = request.getParameter("startTime");
            String eTime = request.getParameter("endTime");
            
            String speaker = request.getParameter("speaker");
            String resStDate = request.getParameter("registrationStartDate");
            String resEndDate = request.getParameter("registrationEndDate");
            String description = request.getParameter("eventDescription");
            
            Event e=new Event(eName,eDate,location,sTime,speaker,resStDate,resEndDate,description);
                
                // create userdao object
                EventDao dao=new EventDao(ConnectionProvider.getConnection());
                int id=dao.saveEventAndGetId(e);
                if(id!=-1){
                    HttpSession session = request.getSession();
                    Event ev = dao.getEventByEventId(id);
                    session.setAttribute("event", ev);
                    out.println("Done");
                }
                else{
                    out.println("not saved");
                }
//                  String msg = dao.saveEvent(e);
//                  out.println(msg);
            
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
