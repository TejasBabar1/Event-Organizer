/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.event.entities;

import java.sql.Timestamp;

public class EventRegistration {
    private int registration_id;
    private int user_id;
    private int event_id;
    private Timestamp registration_date;

    public EventRegistration() {
    }

    public EventRegistration(int registration_id, int user_id, int event_id, Timestamp registration_date) {
        this.registration_id = registration_id;
        this.user_id = user_id;
        this.event_id = event_id;
        this.registration_date = registration_date;
    }
    
    public EventRegistration(int user_id, int event_id, Timestamp registration_date) {
        this.user_id = user_id;
        this.event_id = event_id;
        this.registration_date = registration_date;
    }

    public int getRegistration_id() {
        return registration_id;
    }

    public void setRegistration_id(int registration_id) {
        this.registration_id = registration_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getEvent_id() {
        return event_id;
    }

    public void setEvent_id(int event_id) {
        this.event_id = event_id;
    }

    public Timestamp getRegistration_date() {
        return registration_date;
    }

    public void setRegistration_date(Timestamp registration_date) {
        this.registration_date = registration_date;
    }
}
