package com.cattlehub.dao;

import java.sql.*;

import com.cattlehub.entities.users;

public class usersDao {
    private Connection con;

    public usersDao(Connection con) {
        this.con = con;
    }

    // SIGNUP - Save user to database
    public boolean saveUser(users users) {  
        boolean f = false;
        try {
            String sql = "INSERT INTO users (full_name, email, password, phone, address, role) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = this.con.prepareStatement(sql);

            pstmt.setString(1, users.getFull_name());
            pstmt.setString(2, users.getEmail());
            pstmt.setString(3, users.getPassword());  // plain text password (should be hashed)
            pstmt.setString(4, users.getPhone());
            pstmt.setString(5, users.getAddress());
            pstmt.setString(6, users.getRole());

            pstmt.executeUpdate();         
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return f;
    }

    // LOGIN - Get user by email and password
    public users getUserByEmailAndPassword(String email , String password) {
        users user = null;
        String sql = "SELECT * FROM users WHERE email=? AND password=?";

        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            try (ResultSet set = pstmt.executeQuery()) {
                if (set.next()) {
                    user = new users();
                    user.setUsers_id(set.getInt("user_id"));
                    user.setFull_name(set.getString("full_name"));
                    user.setEmail(set.getString("email"));
                    user.setPassword(set.getString("password"));
                    user.setPhone(set.getString("phone"));
                    user.setAddress(set.getString("address"));
                    user.setRole(set.getString("role"));
                    user.setProfile_image(set.getString("profile_image"));
                    user.setCreated_at(set.getTimestamp("created_at"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
    
//    Edit User Profile
    public boolean updateUser(users user) {
    	boolean f=false;
    	
    	try {
    		
    		String sql="update users set full_name=?,email=?,password=?,phone=?,address=?,role=?,profile_image=? WHERE user_id=?";
    		
    		PreparedStatement p=con.prepareStatement(sql);
    		 p.setString(1, user.getFull_name());
    	        p.setString(2, user.getEmail());
    	        p.setString(3, user.getPassword());
    	        p.setString(4, user.getPhone());
    	        p.setString(5, user.getAddress());
    	        p.setString(6, user.getRole());
    	        p.setString(7, user.getProfile_image());
    	        p.setInt(8, user.getUsers_id());
    		
    		p.executeUpdate();
    		f=true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    	
    	return f;
    }
}
