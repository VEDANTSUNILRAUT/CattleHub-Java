package com.cattlehub.entities;

public class cattle {

    private int cattle_id;
    private String name;
    private int age;
    private double weight;
    private String breed;
    private int cid;
    private double price;
    private String cattle_img;
    private int seller_id;
    private String registered_date;

    // Default constructor
    public cattle() {
    }

    // Constructor without ID and date (used when adding new cattle)
    public cattle(String name, int age, double weight, String breed, int cid, double price, String cattle_img, int seller_id) {
        this.name = name;
        this.age = age;
        this.weight = weight;
        this.breed = breed;
        this.cid = cid;
        this.price = price;
        this.cattle_img = cattle_img;
        this.seller_id = seller_id;
    }

    // Full constructor
    public cattle(int cattle_id, String name, int age, double weight, String breed, int cid, double price,
                  String cattle_img, int seller_id, String registered_date) {
        this.cattle_id = cattle_id;
        this.name = name;
        this.age = age;
        this.weight = weight;
        this.breed = breed;
        this.cid = cid;
        this.price = price;
        this.cattle_img = cattle_img;
        this.seller_id = seller_id;
        this.registered_date = registered_date;
    }

    // Getters and setters

    public int getCattle_id() {
        return cattle_id;
    }

    public void setCattle_id(int cattle_id) {
        this.cattle_id = cattle_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public String getBreed() {
        return breed;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCattle_img() {
        return cattle_img;
    }

    public void setCattle_img(String cattle_img) {
        this.cattle_img = cattle_img;
    }

    public int getSeller_id() {
        return seller_id;
    }

    public void setSeller_id(int seller_id) {
        this.seller_id = seller_id;
    }

    public String getRegistered_date() {
        return registered_date;
    }

    public void setRegistered_date(String registered_date) {
        this.registered_date = registered_date;
    }
}
