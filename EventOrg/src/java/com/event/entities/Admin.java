
package com.event.entities;


public class Admin {
    private int id;
    private String name;
    private String email;
    private String password;
    private String mobile;
    private String gender;
    private String club_nmae;

    public Admin() {
    }

    public Admin(int id, String name, String email, String password, String mobile, String gender, String club_nmae) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.mobile = mobile;
        this.gender = gender;
        this.club_nmae = club_nmae;
    }

    public Admin(String name, String email, String password, String mobile, String gender, String club_nmae) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.mobile = mobile;
        this.gender = gender;
        this.club_nmae = club_nmae;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getClub_nmae() {
        return club_nmae;
    }

    public void setClub_nmae(String club_nmae) {
        this.club_nmae = club_nmae;
    }
    
    
}
