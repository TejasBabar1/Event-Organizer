
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
    
    public boolean saveEvent(Event p){
        boolean f=false;
        
        try {
            String q = "INSERT INTO Event(event_name, event_date, location, time, speaker, "
                    + "registration_start_date, registration_end_date, description) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getEvent_name());
            pstmt.setDate(2, java.sql.Date.valueOf(p.getEvent_date()));
            pstmt.setString(3, p.getLocation());
            pstmt.setTime(4, java.sql.Time.valueOf(p.getTime()));
            pstmt.setString(5, p.getSpeaker());
            pstmt.setDate(6, java.sql.Date.valueOf(p.getRegistration_start_date()));
            pstmt.setDate(7, java.sql.Date.valueOf(p.getRegistration_end_date()));
            pstmt.setString(8, p.getDescription());

            // Execute the SQL statement
            int rowsAffected = pstmt.executeUpdate();

            f=true;
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return f;
                
    }
    
    public List<Event> getAllEvent() {
        List<Event> eventList = new ArrayList<>();

        try {
            String q = "SELECT * FROM Event";
            PreparedStatement pstmt = con.prepareStatement(q);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Event event = new Event();
                event.setId(rs.getInt("id"));
                event.setEvent_name(rs.getString("event_name"));
                event.setEvent_date(rs.getString("event_date"));
                event.setLocation(rs.getString("location"));
                event.setTime(rs.getString("time"));
                event.setSpeaker(rs.getString("speaker"));
                event.setRegistration_start_date(rs.getString("registration_start_date"));
                event.setRegistration_end_date(rs.getString("registration_end_date"));
                event.setDescription(rs.getString("description"));

                eventList.add(event);
            }

            // Close resources
            rs.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return eventList;
    }

    
        
    
    
    public Event getEventByEventId(int id) {
        Event event = null;

        try {
            String q = "SELECT * FROM Event WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setInt(1, id);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                event = new Event();
                event.setId(rs.getInt("id"));
                event.setEvent_name(rs.getString("event_name"));
                event.setEvent_date(rs.getString("event_date"));
                event.setLocation(rs.getString("location"));
                event.setTime(rs.getString("time"));
                event.setSpeaker(rs.getString("speaker"));
                event.setRegistration_start_date(rs.getString("registration_start_date"));
                event.setRegistration_end_date(rs.getString("registration_end_date"));
                event.setDescription(rs.getString("description"));
            }

            // Close resources
            rs.close();
            pstmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return event;
    }
}

