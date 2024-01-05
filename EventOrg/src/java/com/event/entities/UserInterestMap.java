
package com.event.entities;


public class UserInterestMap {
    private int user_id;
    private int interest_id;

    public UserInterestMap() {
    }

    public UserInterestMap(int user_id, int interest_id) {
        this.user_id = user_id;
        this.interest_id = interest_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getInterest_id() {
        return interest_id;
    }

    public void setInterest_id(int interest_id) {
        this.interest_id = interest_id;
    }
    
}
