package com.garage.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import garage.Cart;
import garage.Product;

public class ProductDao {

	private Connection con;
	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    

	public ProductDao(Connection con) {
		
		this.con = con;
	}
	
	
	public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        try {

            query = "select * from products";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
            	Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));

                products.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return products;
    }
	
    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        List<Cart> products = new ArrayList<>();
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select * from products where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();                                            //lesson 8  
                    while (rs.next()) {
                        Cart row = new Cart();
                        row.setId(rs.getInt("id"));
                        row.setName(rs.getString("name"));
                        row.setCategory(rs.getString("category"));
                        row.setPrice(rs.getDouble("price")*item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        products.add(row);
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return products;
    }
    
    public Product getSingleProduct(int id) {
    	Product row = null;
    	
    	try {
    		query = "select * from products where id=?";
    		pst = this.con.prepareStatement(query);
    		pst.setInt(1, id);
    		rs = pst.executeQuery();
    		
    		while(rs.next()) {
            	row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
    		}
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return row;
    }
    
    public double getTotalCartPrice(ArrayList<Cart> cartList) {
    	
    	double sum = 0;
    	
    	try {
    		if(cartList.size() >0) {
    			for(Cart item: cartList) {
    				query = "select price from products where id=?";
    				pst = this.con.prepareStatement(query);
    				pst.setInt(1, item.getId());
    				rs = pst.executeQuery();
    				
    				while(rs.next()) {
    					sum+= rs.getDouble("price") * item.getQuantity(); //then i call pDao.getTotalCartPrice in cart.jsp lesson 9 8:33
    				}
    			}
    		}
    		
    		
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return sum;
    }
}
