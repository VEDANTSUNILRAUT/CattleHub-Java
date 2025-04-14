package com.cattlehub.dao;

import java.sql.*;
import java.util.*;
import com.cattlehub.entities.Category;
import com.cattlehub.entities.cattle;

public class CattleDao {

	Connection con;

	public CattleDao(Connection con) {
		this.con = con;
	}

	// Function to fetch the categories from db
	public ArrayList<Category> getCategory() {
		ArrayList<Category> list = new ArrayList<>();

		try {
			String sql = "select * from category";
			Statement st = con.createStatement();
			ResultSet set = st.executeQuery(sql);

			while (set.next()) {
				int cid = set.getInt("cid");
				String name = set.getString("name");
				String description = set.getString("description");

				Category c = new Category(cid, name, description);
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

//	function for storing data in db of cattle:

	public boolean saveCattle(cattle c) {
		boolean f = false;

		try {

			String q = "insert into cattle(name,age,weight,breed,cid,price,cattle_img,seller_id)value(?,?,?,?,?,?,?,?)";

			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setString(1, c.getName());
			pstmt.setInt(2, c.getAge());
			pstmt.setDouble(3, c.getWeight());
			pstmt.setString(4, c.getBreed());
			pstmt.setInt(5, c.getCid());
			pstmt.setDouble(6, c.getPrice());
			pstmt.setString(7, c.getCattle_img());
			pstmt.setInt(8, c.getSeller_id());
			
			pstmt.executeUpdate();
			f=true;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return f;
	}
	
//	Method to get all post form db:
	
	public List<cattle> getAllCattle() {
		List <cattle> list=new ArrayList<>();
//		Fetch All the post:
				
		try {
			
			PreparedStatement p = con.prepareStatement("select * from cattle");
			
			ResultSet set=p.executeQuery();
			
			while(set.next()) {
				  int cattle_id = set.getInt("cattle_id");
				    String name = set.getString("name");
				    int age = set.getInt("age");
				    double weight = set.getDouble("weight");
				    String breed = set.getString("breed");
				    int cid = set.getInt("cid");
				    double price = set.getDouble("price");
				    String cattle_img = set.getString("cattle_img");
				    int seller_id = set.getInt("seller_id");
				    String registered_date=set.getString("registered_date");

				    cattle cattle = new cattle(cattle_id, name, age, weight, breed, cid, price, cattle_img, seller_id, registered_date);
				    list.add(cattle);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return list;
}
	
	
	
//	Get post by categories.
	public List<cattle> getCattleByCatId(int cid){
List <cattle> list=new ArrayList<>();
//		Fetch All the post by categories ID:

try {
	
	PreparedStatement p = con.prepareStatement("select * from cattle where cid=?");
	p.setInt(1, cid);
	
	ResultSet set=p.executeQuery();
	
	while(set.next()) {
		  int cattle_id = set.getInt("cattle_id");
		    String name = set.getString("name");
		    int age = set.getInt("age");
		    double weight = set.getDouble("weight");
		    String breed = set.getString("breed");
		    double price = set.getDouble("price");
		    String cattle_img = set.getString("cattle_img");
		    int seller_id = set.getInt("seller_id");
		    String registered_date=set.getString("registered_date");

		    cattle cattle = new cattle(cattle_id, name, age, weight, breed, cid, price, cattle_img, seller_id, registered_date);
		    list.add(cattle);
		
	}
} catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();
}



		return list;
		
		
	}

}
