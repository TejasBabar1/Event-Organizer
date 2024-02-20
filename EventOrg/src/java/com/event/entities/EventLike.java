/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.event.entities;

/**
 *
 * @author tejas
 */

public class EventLike {
    private int like_id;
    private int user_id;
    private int event_id;

    public EventLike() {
    }

    public EventLike(int like_id, int user_id, int event_id) {
        this.like_id = like_id;
        this.user_id = user_id;
        this.event_id = event_id;
    }
    
    public EventLike( int user_id, int event_id) {
        this.user_id = user_id;
        this.event_id = event_id;
    }

    public int getLike_id() {
        return like_id;
    }

    public void setLike_id(int like_id) {
        this.like_id = like_id;
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
}

