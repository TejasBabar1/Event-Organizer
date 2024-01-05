package com.event.dao;

import com.event.entities.Interesteduser;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class InteresteduserDao {
    
    private Connection con;

    public InteresteduserDao(Connection con) {
        this.con = con;
    }

     public boolean saveInterestedUser(Interesteduser interestedUser) {
        boolean success = false;

        try {
            String query = "INSERT INTO InterestedUser(user_id, event_id) VALUES (?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, interestedUser.getUser_id());
            pstmt.setInt(2, interestedUser.getEvent_id());

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Interested user inserted successfully.");
                success = true;
            } else {
                System.out.println("Failed to insert interested user.");
            }

            // Close resources
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return success;
    }

     
    public List<Interesteduser> getAllInterestedUser() {
        List<Interesteduser> interestedUserList = new ArrayList<>();

        try {
            String query = "SELECT * FROM InterestedUser";
            PreparedStatement pstmt = con.prepareStatement(query);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Interesteduser interestedUser = new Interesteduser();
                interestedUser.setUser_id(rs.getInt("user_id"));
                interestedUser.setEvent_id(rs.getInt("event_id"));

                interestedUserList.add(interestedUser);
            }

            // Close resources
            rs.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return interestedUserList;
    }

    // Retrieve users by event ID
    public List<Interesteduser> getUserByEventId(int eventId) {
        List<Interesteduser> interestedUserList = new ArrayList<>();

        try {
            String query = "SELECT * FROM InterestedUser WHERE event_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, eventId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Interesteduser interestedUser = new Interesteduser();
                interestedUser.setUser_id(rs.getInt("user_id"));
                interestedUser.setEvent_id(rs.getInt("event_id"));

                interestedUserList.add(interestedUser);
            }

            // Close resources
            rs.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return interestedUserList;
    }

    // Retrieve events by user ID
    public List<Interesteduser> getEventByUserId(int userId) {
        List<Interesteduser> interestedUserList = new ArrayList<>();

        try {
            String query = "SELECT * FROM InterestedUser WHERE user_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Interesteduser interestedUser = new Interesteduser();
                interestedUser.setUser_id(rs.getInt("user_id"));
                interestedUser.setEvent_id(rs.getInt("event_id"));

                interestedUserList.add(interestedUser);
            }

            // Close resources
            rs.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return interestedUserList;
    }
}
