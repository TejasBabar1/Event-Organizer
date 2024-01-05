
package com.event.entities;


public class Event {
    private int id;
    private String event_name;
    private String event_date;
    private String location;
    private String time;
    private String speaker;
    private String registration_start_date;
    private String registration_end_date;
    private String description;
    
  

    public Event() {
    }

    public Event(int id, String event_name, String event_date, String location, String time, String speaker, String registration_start_date, String registration_end_date, String description) {
        this.id = id;
        this.event_name = event_name;
        this.event_date = event_date;
        this.location = location;
        this.time = time;
        this.speaker = speaker;
        this.registration_start_date = registration_start_date;
        this.registration_end_date = registration_end_date;
        this.description = description;
        
        
    }

    public Event(String event_name, String event_date, String location, String time, String speaker, String registration_start_date, String registration_end_date, String description) {
        this.event_name = event_name;
        this.event_date = event_date;
        this.location = location;
        this.time = time;
        this.speaker = speaker;
        this.registration_start_date = registration_start_date;
        this.registration_end_date = registration_end_date;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEvent_name() {
        return event_name;
    }

    public void setEvent_name(String event_name) {
        this.event_name = event_name;
    }

    public String getEvent_date() {
        return event_date;
    }

    public void setEvent_date(String event_date) {
        this.event_date = event_date;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getSpeaker() {
        return speaker;
    }

    public void setSpeaker(String speaker) {
        this.speaker = speaker;
    }

    public String getRegistration_start_date() {
        return registration_start_date;
    }

    public void setRegistration_start_date(String registration_start_date) {
        this.registration_start_date = registration_start_date;
    }

    public String getRegistration_end_date() {
        return registration_end_date;
    }

    public void setRegistration_end_date(String registration_end_date) {
        this.registration_end_date = registration_end_date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    
}
