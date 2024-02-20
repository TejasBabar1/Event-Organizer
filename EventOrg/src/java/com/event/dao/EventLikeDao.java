/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.event.dao;

/**
 *
 * @author tejas
 */


import com.event.entities.EventLike;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EventLikeDao {
    private Connection con;

    public EventLikeDao(Connection con) {
        this.con = con;
    }

    // Method to save a like
    public boolean saveLike(EventLike like) {
        boolean result = false;
        try {
            String sql = "INSERT INTO EventLikes (user_id, event_id) VALUES (?, ?)";
            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setInt(1, like.getUser_id());
                preparedStatement.setInt(2, like.getEvent_id());

                int rowsAffected = preparedStatement.executeUpdate();
                result = rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    // Method to delete a like
    public boolean deleteLike(EventLike like) {
        boolean result = false;
        try {
            String sql = "DELETE FROM EventLikes WHERE user_id = ? AND event_id = ?";
            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setInt(1, like.getUser_id());
                preparedStatement.setInt(2, like.getEvent_id());

                int rowsAffected = preparedStatement.executeUpdate();
                result = rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
}

