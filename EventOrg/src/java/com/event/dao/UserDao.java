package com.event.dao;

import com.event.entities.User;
import java.sql.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    // method to insert data
    public boolean saveUser(User user) {
        boolean f = false;

        try {

            String query = "insert into user(name,email,password,mobile,gender,class_branch) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getMobile());
            pstmt.setString(5, user.getGender());
            pstmt.setString(6, user.getClass_branch());

            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    // get user by username and pass
    public User getUserByEmailPass(String email, String pass) {
        User user = null;

        try {
            String query = "select * from user where email=? and password=? ;";

            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, pass);

            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                user = new User();

                String name = set.getString("name");
                user.setName(name);

                user.setEmail(set.getString("email"));
                user.setId(set.getInt("id"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setMobile(set.getString("mobile"));
                user.setClass_branch(set.getString("class_branch"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public User getUserById(int uid) {
        User user = null;
        try {
            String query = "select * from user where id=? ;";

            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, uid);

            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                user = new User();

                String name = set.getString("name");
                user.setName(name);

                user.setEmail(set.getString("email"));
                user.setId(set.getInt("id"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setMobile(set.getString("mobile"));
                user.setClass_branch(set.getString("class_branch"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;

    }

    public boolean updateUser(User user) {
        boolean f = false;
        try {
            String query = "update user set name=? , email=? , password=?,mobile=?, gender=? , class_branch=? where id=? ; ";

            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getMobile());
            p.setString(5, user.getGender());
            p.setString(6, user.getClass_branch());
            p.setInt(7, user.getId());

            p.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    // Update user information by user id
    public int updateUserDetails(int userId, String name, String email, String mobile, String classBranch) {
        int f = 0;
        try {
            String query = "update user set name=? , email=? , mobile=?, class_branch=? where id=? ;";

            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, name);
            p.setString(2, email);
            p.setString(3, mobile);
            p.setString(4, classBranch);
            p.setInt(5, userId);

            int rowsAffected = p.executeUpdate();
            if (rowsAffected > 0) {
                f = rowsAffected;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

}
