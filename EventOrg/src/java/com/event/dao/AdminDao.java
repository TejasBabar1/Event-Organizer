
package com.event.dao;

import com.event.entities.Admin;
import java.sql.*;

public class AdminDao {
    private Connection connection;

    public AdminDao(Connection con) {
        this.connection = con;
    }
    public Admin getAdminById(int id) {
        Admin admin = null;
        try {
            String sql = "SELECT * FROM Admin WHERE id = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, id);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        admin = extractAdminFromResultSet(resultSet);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }

    public Admin getAdminByEmailPass(String email, String pass) {
        Admin admin = null;
        try {
            String sql = "SELECT * FROM Admin WHERE email = ? AND password = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, email);
                preparedStatement.setString(2, pass);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        admin = extractAdminFromResultSet(resultSet);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }

    private Admin extractAdminFromResultSet(ResultSet resultSet) throws SQLException {
        int id = resultSet.getInt("id");
        String name = resultSet.getString("name");
        String email = resultSet.getString("email");
        String password = resultSet.getString("password");
        String mobile = resultSet.getString("mobile");
        String gender = resultSet.getString("gender");
        String clubName = resultSet.getString("club_name");

        return new Admin(id, name, email, password, mobile, gender, clubName);
    }
}
    
//    public Admin getAdminByEmailPass(String email,String pass){
//        Admin user=null;
//        
//        try {
//            String query ="select * from admin where email=? and password=? ;";
//            
//            PreparedStatement pstmt=con.prepareStatement(query);
//            pstmt.setString(1, email);
//            pstmt.setString(2, pass);
//            
//            ResultSet set=pstmt.executeQuery();
//            if(set.next()){
//                user=new Admin();
//              
//                String name=set.getString("name");
//                user.setName(name);
//                
//                user.setEmail(set.getString("email"));
//                user.setId(set.getInt("id"));
//                user.setPassword(set.getString("password"));
//                user.setGender(set.getString("gender"));
//                user.setMobile(set.getString("mobile"));
//                user.setClub_nmae(set.getString("club_name"));
//                
//            }
//            
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        
//        
//        
//        return user;
//    }
//    
//    public Admin getAdminById(int id){
//        Admin user=null;
//        
//        try {
//            String query ="select * from admin where id=? ;";
//            
//            PreparedStatement pstmt=con.prepareStatement(query);
//            pstmt.setInt(1, id);
//            
//            ResultSet set=pstmt.executeQuery();
//            if(set.next()){
//                user=new Admin();
//              
//                String name=set.getString("name");
//                user.setName(name);
//                
//                user.setEmail(set.getString("email"));
//                user.setId(set.getInt("id"));
//                user.setPassword(set.getString("password"));
//                user.setGender(set.getString("gender"));
//                user.setMobile(set.getString("mobile"));
//                user.setClub_nmae(set.getString("club_name"));
//               
//                
//            }
//            
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        
//        
//        
//        return user;
//    }
//}
