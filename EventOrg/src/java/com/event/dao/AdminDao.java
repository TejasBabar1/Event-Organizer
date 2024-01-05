
package com.event.dao;

import com.event.entities.Admin;
import java.sql.*;

public class AdminDao {
    private Connection con;

    public AdminDao(Connection con) {
        this.con = con;
    }
    
    
    public Admin getAdminByEmailPass(String email,String pass){
        Admin user=null;
        
        try {
            String query ="select * from admin where email=? and password=? ;";
            
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, pass);
            
            ResultSet set=pstmt.executeQuery();
            if(set.next()){
                user=new Admin();
              
                String name=set.getString("name");
                user.setName(name);
                
                user.setEmail(set.getString("email"));
                user.setId(set.getInt("id"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setMobile(set.getString("mobile"));
                user.setClub_nmae(set.getString("club_name"));
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        return user;
    }
    
    public Admin getAdminById(int id){
        Admin user=null;
        
        try {
            String query ="select * from admin where id=? ;";
            
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setInt(1, id);
            
            ResultSet set=pstmt.executeQuery();
            if(set.next()){
                user=new Admin();
              
                String name=set.getString("name");
                user.setName(name);
                
                user.setEmail(set.getString("email"));
                user.setId(set.getInt("id"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setMobile(set.getString("mobile"));
                user.setClub_nmae(set.getString("club_name"));
               
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        return user;
    }
}
