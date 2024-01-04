
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
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
@MultipartConfig
public class EditServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");            
            out.println("</head>");
            out.println("<body>");
          
            
            // fetch all data 
            
            String userEmail=request.getParameter("user_email");
            String userName=request.getParameter("user_name");
            String userPass=request.getParameter("user_password");
            
            Part part=request.getPart("image");
            String imagename=part.getSubmittedFileName();
            
            
            // get the user from session
            HttpSession s=request.getSession();
            User user= (User) s.getAttribute("currentuser");
            
            user.setEmail(userEmail);
            user.setName(userName);
            user.setPassword(userPass);
            
            String oldp=user.getProfile();
            
            user.setProfile(imagename);
            
            // update database
            
            
            UserDao userDao=new UserDao(ConnectionProvider.getConnection());
            boolean ans=userDao.updateUser(user);
            if(ans){
                
                String oldpath=request.getRealPath("/")+"pics"+File.separator+oldp;

                String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();
                
                if(!oldp.equals("default.png")){
                     Helper.deleteFile(oldpath);
                }
               
                
                    if(Helper.saveFile(part.getInputStream(), path)){
                        Message msg=new Message("Profile Updated !!","Success", "alert-success");
                       
                        s.setAttribute("msg", msg);
                        
                        
                    }
                    
                    else{
                        Message msg=new Message("SomeThing Went Wrong","error", "alert-danger");
                        s.setAttribute("msg", msg);
                    }
            }
            else{
                Message msg=new Message("SomeThing Went Wrong","error", "alert-danger");
                s.setAttribute("msg", msg);
            }
            
            response.sendRedirect("profile.jsp");
            
            out.println("</body>");
            out.println("</html>");
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
