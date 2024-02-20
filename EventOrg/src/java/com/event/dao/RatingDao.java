/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.event.dao;

/**
 *
 * @author tejas
 */


import com.event.entities.Rating;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RatingDao {
    private Connection con;

    public RatingDao(Connection con) {
        this.con = con;
    }

    // Method to add or update a rating
    public boolean addOrUpdateRating(Rating rating) {
        boolean result = false;
        try {
            // First, check if a rating entry exists for the given user and event
            String selectSql = "SELECT ratings FROM ratings WHERE userid = ? AND eventid = ?";
            try (PreparedStatement selectStatement = con.prepareStatement(selectSql)) {
                selectStatement.setInt(1, rating.getUserId());
                selectStatement.setInt(2, rating.getEventId());
                try (ResultSet resultSet = selectStatement.executeQuery()) {
                    if (resultSet.next()) {
                        // If a rating entry exists, update the existing rating
                        int previousRating = resultSet.getInt("ratings");
                        int newRating = previousRating + rating.getRatings();
                        String updateSql = "UPDATE ratings SET ratings = ? WHERE userid = ? AND eventid = ?";
                        try (PreparedStatement updateStatement = con.prepareStatement(updateSql)) {
                            updateStatement.setInt(1, newRating);
                            updateStatement.setInt(2, rating.getUserId());
                            updateStatement.setInt(3, rating.getEventId());
                            result = updateStatement.executeUpdate() > 0;
                        }
                    } else {
                        // If no rating entry exists, insert a new rating
                        String insertSql = "INSERT INTO ratings (userid, eventid, ratings) VALUES (?, ?, ?)";
                        try (PreparedStatement insertStatement = con.prepareStatement(insertSql)) {
                            insertStatement.setInt(1, rating.getUserId());
                            insertStatement.setInt(2, rating.getEventId());
                            insertStatement.setInt(3, rating.getRatings());
                            result = insertStatement.executeUpdate() > 0;
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}

