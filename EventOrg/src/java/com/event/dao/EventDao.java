package com.event.dao;

import com.event.entities.Event;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EventDao {

    private Connection con;

    public EventDao(Connection con) {
        this.con = con;
    }

//    public boolean saveEvent(Event event) {
//        boolean result = false;
//        try {
//            String sql = "INSERT INTO Event (event_name, event_date, location, time, speaker, registration_start_date, registration_end_date, description) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
//            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
//                preparedStatement.setString(1, event.getEvent_name());
//                preparedStatement.setString(2, event.getEvent_date());
//                preparedStatement.setString(3, event.getLocation());
//                preparedStatement.setString(4, event.getTime());
//                preparedStatement.setString(5, event.getSpeaker());
//                preparedStatement.setString(6, event.getRegistration_start_date());
//                preparedStatement.setString(7, event.getRegistration_end_date());
//                preparedStatement.setString(8, event.getDescription());
//
//                int rowsAffected = preparedStatement.executeUpdate();
//                result = rowsAffected > 0;
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return result;
//    }
    // Method to save an event
    public boolean saveEvent(Event event) {
        boolean result = false;
        try {
            String sql = "INSERT INTO Event (event_name, event_date, location, time, speaker, registration_start_date, registration_end_date, description, admin_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try ( PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setString(1, event.getEvent_name());
                preparedStatement.setString(2, event.getEvent_date());
                preparedStatement.setString(3, event.getLocation());
                preparedStatement.setString(4, event.getTime());
                preparedStatement.setString(5, event.getSpeaker());
                preparedStatement.setString(6, event.getRegistration_start_date());
                preparedStatement.setString(7, event.getRegistration_end_date());
                preparedStatement.setString(8, event.getDescription());
                preparedStatement.setInt(9, event.getAdmin_id());

                int rowsAffected = preparedStatement.executeUpdate();
                result = rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

//     public List<Event> getAllEvent() {
//        List<Event> events = new ArrayList<>();
//
//        try {
//            String sql = "SELECT * FROM Event";
//            try (PreparedStatement preparedStatement = con.prepareStatement(sql);
//                 ResultSet resultSet = preparedStatement.executeQuery()) {
//
//                while (resultSet.next()) {
//                    Event event = extractEventFromResultSet(resultSet);
//                    events.add(event);
//                }
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return events;
//    }
    public List<Event> getAllEvent() {
        List<Event> events = new ArrayList<>();

        try {
            String sql = "SELECT * FROM Event";
            try ( PreparedStatement preparedStatement = con.prepareStatement(sql);  ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Event event = extractEventFromResultSet(resultSet);
                    events.add(event);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return events;
    }

//    private Event extractEventFromResultSet(ResultSet resultSet) throws SQLException {
//        int id = resultSet.getInt("id");
//        String eventName = resultSet.getString("event_name");
//        String eventDate = resultSet.getString("event_date");
//        String location = resultSet.getString("location");
//        String time = resultSet.getString("time");
//        String speaker = resultSet.getString("speaker");
//        String registrationStartDate = resultSet.getString("registration_start_date");
//        String registrationEndDate = resultSet.getString("registration_end_date");
//        String description = resultSet.getString("description");
//
//        return new Event(id, eventName, eventDate, location, time, speaker, registrationStartDate, registrationEndDate, description);
//    
//}
    // Helper method to extract event data from ResultSet
    private Event extractEventFromResultSet(ResultSet resultSet) throws SQLException {
        int id = resultSet.getInt("id");
        String eventName = resultSet.getString("event_name");
        String eventDate = resultSet.getString("event_date");
        String location = resultSet.getString("location");
        String time = resultSet.getString("time");
        String speaker = resultSet.getString("speaker");
        String registrationStartDate = resultSet.getString("registration_start_date");
        String registrationEndDate = resultSet.getString("registration_end_date");
        String description = resultSet.getString("description");
        int adminId = resultSet.getInt("admin_id");

        return new Event(id, adminId, eventName, eventDate, location, time, speaker, registrationStartDate, registrationEndDate, description);
    }

//    public Event getEventByEventId(int id) {
//        Event event = null;
//
//        try {
//            String sql = "SELECT * FROM Event WHERE id = ?";
//            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
//                preparedStatement.setInt(1, id);
//
//                try (ResultSet resultSet = preparedStatement.executeQuery()) {
//                    if (resultSet.next()) {
//                        event = extractEventFromResultSet(resultSet);
//                    }
//                }
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return event;
//    }
    public Event getEventByEventId(int id) {
        Event event = null;

        try {
            String sql = "SELECT * FROM Event WHERE id = ?";
            try ( PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setInt(1, id);

                try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        event = extractEventFromResultSet(resultSet);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return event;
    }

//    public int saveEventAndGetId(Event event) {
//    int generatedId = -1; // Initialize with a default value
//
//    try {
//        String sql = "INSERT INTO Event (event_name, event_date, location, time, speaker, registration_start_date, registration_end_date, description) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
//        try (PreparedStatement preparedStatement = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
//            preparedStatement.setString(1, event.getEvent_name());
//            preparedStatement.setString(2, event.getEvent_date());
//            preparedStatement.setString(3, event.getLocation());
//            preparedStatement.setString(4, event.getTime());
//            preparedStatement.setString(5, event.getSpeaker());
//            preparedStatement.setString(6, event.getRegistration_start_date());
//            preparedStatement.setString(7, event.getRegistration_end_date());
//            preparedStatement.setString(8, event.getDescription());
//
//            int rowsAffected = preparedStatement.executeUpdate();
//            if (rowsAffected > 0) {
//                try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
//                    if (generatedKeys.next()) {
//                        generatedId = generatedKeys.getInt(1);
//                    }
//                }
//            }
//        }
//    } catch (SQLException e) {
//        e.printStackTrace();
//    }
//
//    return generatedId;
//    }
//    
//    
//    public List<Event> getEventsByEventIds(List<Integer> eventIds) {
//    List<Event> events = new ArrayList<>();
//
//    if (eventIds.isEmpty()) {
//        return events; // Return an empty list if the input list is empty
//    }
//
//    try {
//        StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM Event WHERE id IN (");
//
//        // Append placeholders for event IDs
//        for (int i = 0; i < eventIds.size(); i++) {
//            sqlBuilder.append("?");
//            if (i < eventIds.size() - 1) {
//                sqlBuilder.append(", ");
//            }
//        }
//
//        sqlBuilder.append(")");
//
//        try (PreparedStatement preparedStatement = con.prepareStatement(sqlBuilder.toString())) {
//            // Set event IDs as parameters in the prepared statement
//            for (int i = 0; i < eventIds.size(); i++) {
//                preparedStatement.setInt(i + 1, eventIds.get(i));
//            }
//
//            try (ResultSet resultSet = preparedStatement.executeQuery()) {
//                while (resultSet.next()) {
//                    Event event = extractEventFromResultSet(resultSet);
//                    events.add(event);
//                }
//            }
//        }
//    } catch (SQLException e) {
//        e.printStackTrace();
//    }
//
//    return events;
//}
//
//
//}
    public int saveEventAndGetId(Event event) {
        int generatedId = -1; // Initialize with a default value

        try {
            String sql = "INSERT INTO Event (event_name, event_date, location, time, speaker, registration_start_date, registration_end_date, description, admin_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try ( PreparedStatement preparedStatement = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                preparedStatement.setString(1, event.getEvent_name());
                preparedStatement.setString(2, event.getEvent_date());
                preparedStatement.setString(3, event.getLocation());
                preparedStatement.setString(4, event.getTime());
                preparedStatement.setString(5, event.getSpeaker());
                preparedStatement.setString(6, event.getRegistration_start_date());
                preparedStatement.setString(7, event.getRegistration_end_date());
                preparedStatement.setString(8, event.getDescription());
                preparedStatement.setInt(9, event.getAdmin_id());

                int rowsAffected = preparedStatement.executeUpdate();
                if (rowsAffected > 0) {
                    try ( ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            generatedId = generatedKeys.getInt(1);
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return generatedId;
    }

    public List<Event> getEventsByEventIds(List<Integer> eventIds) {
        List<Event> events = new ArrayList<>();

        if (eventIds.isEmpty()) {
            return events; // Return an empty list if the input list is empty
        }

        try {
            StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM Event WHERE id IN (");

            // Append placeholders for event IDs
            for (int i = 0; i < eventIds.size(); i++) {
                sqlBuilder.append("?");
                if (i < eventIds.size() - 1) {
                    sqlBuilder.append(", ");
                }
            }

            sqlBuilder.append(")");

            try ( PreparedStatement preparedStatement = con.prepareStatement(sqlBuilder.toString())) {
                // Set event IDs as parameters in the prepared statement
                for (int i = 0; i < eventIds.size(); i++) {
                    preparedStatement.setInt(i + 1, eventIds.get(i));
                }

                try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        Event event = extractEventFromResultSet(resultSet);
                        events.add(event);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return events;
    }
}
