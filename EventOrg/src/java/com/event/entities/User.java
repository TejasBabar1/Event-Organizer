
package com.event.entities;


public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private String mobile;
    private String gender;
    private String class_branch;

   
    public User() {
    }
    
    

    public User(int id, String name, String email, String password, String mobile, String gender, String class_branch) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.mobile = mobile;
        this.gender = gender;
        this.class_branch = class_branch;
    }

    public User(String name, String email, String password, String mobile, String gender, String class_branch) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.mobile = mobile;
        this.gender = gender;
        this.class_branch = class_branch;
    }
    
    
     
    

    public String getMobile() {
        return mobile;
    }
    
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getClass_branch() {
        return class_branch;
    }

    public void setClass_branch(String class_branch) {
        this.class_branch = class_branch;
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
    
    
    
}
