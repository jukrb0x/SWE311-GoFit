package com.jb.gofit.entity;


import androidx.room.ColumnInfo;
import androidx.room.Entity;
import androidx.room.PrimaryKey;

@Entity(tableName = "user")
public class User {
    @PrimaryKey(autoGenerate = true)
    public int uid;

    @ColumnInfo(name = "username")
    public String username;

    @ColumnInfo(name = "name")
    public String name;

    @ColumnInfo(name = "email")
    public String email;

    @ColumnInfo(name = "password")
    public String password;

    @ColumnInfo(name = "weight")
    public double weight;

    @ColumnInfo(name = "height")
    public double height;

    @ColumnInfo(name = "age")
    public int age;

    @ColumnInfo(name = "sex")
    public int sex;     // 1: male, 2: female

    @ColumnInfo(name = "weight_goal")
    public double weightGoal;

    // Constructor
    public User(String username, String name, String email, String password, double weight, double height, int age, int sex) {
        this.username = username;
        this.name = name;
        this.email = email;
        this.password = password;
        this.weight = weight;
        this.height = height;
        this.age = age;
        this.sex = sex;
    }

    // Setters and Getters

    public int getUid() {
        return uid;
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

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public double getWeightGoal() {
        return weightGoal;
    }

    public void setWeightGoal(double weightGoal) {
        this.weightGoal = weightGoal;
    }
}
