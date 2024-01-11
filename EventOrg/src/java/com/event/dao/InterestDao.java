
package com.event.dao;

import com.event.entities.Interest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class InterestDao {

    private Connection con;

    public InterestDao(Connection con) {
        this.con = con;
    }
    
    public boolean saveInterest(Interest interest) {
        boolean success = false;

        try {
            String query = "INSERT INTO Interest(interest_name) VALUES (?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, interest.getInterest_name());

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Interest inserted successfully.");
                success = true;
            } else {
                System.out.println("Failed to insert interest.");
            }

            // Close resources
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return success;
    }

    // Retrieve all interests from the database
    public List<Interest> getAllInterests() {
        List<Interest> interestList = new ArrayList<>();

        try {
            String query = "SELECT * FROM Interest";
            PreparedStatement pstmt = con.prepareStatement(query);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Interest interest = new Interest();
                interest.setId(rs.getInt("id"));
                interest.setInterest_name(rs.getString("interest_name"));

                interestList.add(interest);
            }

            // Close resources
            rs.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return interestList;
    }
    
    public Interest getInterestById(int id) {
        Interest interest = null;

        try {
            String query = "SELECT * FROM Interest WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, id);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                interest = new Interest();
                interest.setId(rs.getInt("id"));
                interest.setInterest_name(rs.getString("interest_name"));
            }

            // Close resources
            rs.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return interest;
    }
    
    public List<Interest> getInterestsById(int id) {
    List<Interest> interests = new ArrayList<>();

    try {
        String query = "SELECT * FROM Interest WHERE id = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, id);

        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            Interest interest = new Interest();
            interest.setId(rs.getInt("id"));
            interest.setInterest_name(rs.getString("interest_name"));
            interests.add(interest);
        }

        // Close resources
        rs.close();
        pstmt.close();

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return interests;
}

    
    public int getIdByInterest(String interestName) {
        int interestId = -1;

        try {
            String query = "SELECT id FROM Interest WHERE interest_name = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, interestName);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                interestId = rs.getInt("id");
            }

            // Close resources
            rs.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return interestId;
    }
}

