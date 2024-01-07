package com.event.dao;

import com.event.entities.UserInterestMap;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserInterestMapDao {

    private Connection con;

    public UserInterestMapDao(Connection con) {
        this.con = con;
    }

    public boolean saveUserInterestMap(UserInterestMap userInterestMap) {
        boolean success = false;

        try {
            String query = "INSERT INTO UserInterestMap(user_id, interest_id) VALUES (?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, userInterestMap.getUser_id());
            pstmt.setInt(2, userInterestMap.getInterest_id());

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("User-interest mapping inserted successfully.");
                success = true;
            } else {
                System.out.println("Failed to insert user-interest mapping.");
            }

            // Close resources
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return success;
    }

    public List<UserInterestMap> getAllUserInterestMap() {
        List<UserInterestMap> userInterestMapList = new ArrayList<>();

        try {
            String query = "SELECT * FROM UserInterestMap";
            PreparedStatement pstmt = con.prepareStatement(query);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                UserInterestMap userInterestMap = new UserInterestMap();
                userInterestMap.setUser_id(rs.getInt("user_id"));
                userInterestMap.setInterest_id(rs.getInt("interest_id"));

                userInterestMapList.add(userInterestMap);
            }

            // Close resources
            rs.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userInterestMapList;
    }

    // Retrieve users by interest ID
    public List<UserInterestMap> getUsersByInterestId(int interestId) {
        List<UserInterestMap> userInterestMapList = new ArrayList<>();

        try {
            String query = "SELECT * FROM UserInterestMap WHERE interest_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, interestId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                UserInterestMap userInterestMap = new UserInterestMap();
                userInterestMap.setUser_id(rs.getInt("user_id"));
                userInterestMap.setInterest_id(rs.getInt("interest_id"));

                userInterestMapList.add(userInterestMap);
            }

            // Close resources
            rs.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userInterestMapList;
    }

    // Retrieve interests by user ID
    public List<UserInterestMap> getInterestsByUserId(int userId) {
        List<UserInterestMap> userInterestMapList = new ArrayList<>();

        try {
            String query = "SELECT * FROM UserInterestMap WHERE user_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                UserInterestMap userInterestMap = new UserInterestMap();
                userInterestMap.setUser_id(rs.getInt("user_id"));
                userInterestMap.setInterest_id(rs.getInt("interest_id"));

                userInterestMapList.add(userInterestMap);
            }

            // Close resources
            rs.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userInterestMapList;
    }

    public List<Integer> getInterestByUserId(int userId) {
        List<Integer> interests = new ArrayList<>();

        try {
            String query = "SELECT interest_id FROM UserInterestMap WHERE user_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int interestId = rs.getInt("interest_id");
                interests.add(interestId);
            }

            // Close resources
            rs.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return interests;
    }

}
