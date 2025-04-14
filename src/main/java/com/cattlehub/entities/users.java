package com.cattlehub.entities;
import java.sql.*;

public class users {

	private int users_id;
	private String full_name;
	private String email;
	private String password;
	private String phone;
	private String address;
	private String role;
	private String profile_image;
	private Timestamp created_at;
	
	public users(int users_id, String full_name, String email, String password, String phone, String address,
			String role, Timestamp created_at) {
		super();
		this.users_id = users_id;
		this.full_name = full_name;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.address = address;
		this.role = role;
		this.created_at = created_at;
	}

	public users(String full_name, String email, String password, String phone, String address, String role,
			Timestamp created_at) {
		super();
		this.full_name = full_name;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.address = address;
		this.role = role;
		this.created_at = created_at;
	}

	public users() {
	}

//	getters and setters
	
	public int getUsers_id() {
		return users_id;
	}

	public void setUsers_id(int users_id) {
		this.users_id = users_id;
	}

	public String getFull_name() {
		return full_name;
	}

	public void setFull_name(String full_name) {
		this.full_name = full_name;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	

	public String getProfile_image() {
		return profile_image;
	}

	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}

	public Timestamp getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}
}
