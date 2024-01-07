package com.event.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EventInterestMappingDao {

    private Connection con;

    public EventInterestMappingDao(Connection con) {
        this.con = con;
    }

    public boolean addEventInterestMapping(int eventId, int interestId) {
        boolean result = false;

        try {
            String sql = "INSERT INTO EventInterestMapping (event_id, interest_id) VALUES (?, ?)";
            try ( PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setInt(1, eventId);
                preparedStatement.setInt(2, interestId);

                int rowsAffected = preparedStatement.executeUpdate();
                result = rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    public List<Integer> getEventIdsByInterestId(int interestId) {
        List<Integer> eventIds = new ArrayList<>();

        try {
            String sql = "SELECT event_id FROM EventInterestMapping WHERE interest_id = ?";
            try ( PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setInt(1, interestId);

                try ( ResultSet resultSet = preparedStatement.executeQuery()) {
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

    public List<Integer> getInterestIdsByEventId(int eventId) {
        List<Integer> interestIds = new ArrayList<>();

        try {
            String sql = "SELECT interest_id FROM EventInterestMapping WHERE event_id = ?";
            try ( PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setInt(1, eventId);

                try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        int interestId = resultSet.getInt("interest_id");
                        interestIds.add(interestId);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return interestIds;
    }

    public List<Integer> getEventIdsByInterestIds(List<Integer> interestIds) {
        List<Integer> eventIds = new ArrayList<>();

        try {
            String sql = "SELECT DISTINCT event_id FROM EventInterestMapping WHERE interest_id = ?";
            try ( PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                for (Integer interestId : interestIds) {
                    preparedStatement.setInt(1, interestId);

                    try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                        while (resultSet.next()) {
                            int eventId = resultSet.getInt("event_id");
                            eventIds.add(eventId);
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return eventIds;
    }

}
