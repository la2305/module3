package com.example.displaycustomerlistoke;

public class Customer {
    private String name;
    private String date;
    private String location;
    private String image;

    public Customer(String name, String date, String location, String image) {
        this.name = name;
        this.date = date;
        this.location = location;
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
