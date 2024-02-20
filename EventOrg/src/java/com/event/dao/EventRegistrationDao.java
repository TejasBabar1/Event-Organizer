/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.event.dao;

import com.event.entities.EventRegistration;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class EventRegistrationDao {
    private Connection con;

    public EventRegistrationDao(Connection con) {
        this.con = con;
    }

    // Method to save a registration
    public boolean saveRegistration(EventRegistration registration) {
        boolean result = false;
        try {
            String sql = "INSERT INTO EventRegistration (user_id, event_id, registration_date) VALUES (?, ?, ?)";
            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setInt(1, registration.getUser_id());
                preparedStatement.setInt(2, registration.getEvent_id());
                preparedStatement.setTimestamp(3, registration.getRegistration_date());

                int rowsAffected = preparedStatement.executeUpdate();
                result = rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
       // Method to get a list of event IDs registered by a user
    public List<Integer> getEventIdsRegisteredByUser(int userId) {
        List<Integer> eventIds = new ArrayList<>();
        try {
            String sql = "SELECT event_id FROM EventRegistration WHERE user_id = ?";
            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setInt(1, userId);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        int eventId = resultSet.getInt("event_id");
                        eventIds.add(eventId);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return eventIds;
    }
    
    // Method to get a list of user IDs registered for a specific event
    public List<Integer> getUserIdsRegisteredForEvent(int eventId) {
        List<Integer> userIds = new ArrayList<>();
        try {
            String sql = "SELECT user_id FROM EventRegistration WHERE event_id = ?";
            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setInt(1, eventId);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        int userId = resultSet.getInt("user_id");
                        userIds.add(userId);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userIds;
    }
}

