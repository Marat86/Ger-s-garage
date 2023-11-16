package com.garage.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import garage.User;
import garage.Vehicle;



public class LoginDao {
	
	private static String dbUrl = "jdbc:mysql://localhost:3306/customers";
	private static String dbUname = "root";
	private static String dbPassword = "root1234";
	private static String dbDriver = "com.mysql.cj.jdbc.Driver";
	
	public static void loadDriver(String dbDriver) {
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static  Connection getConnection() {
		
		Connection con = null;
		try {
			con = DriverManager.getConnection(dbUrl, dbUname, dbPassword );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}

	public static int insert (User user) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		
		String sql = "insert into user (userID, EmailAddress, fname, surname, password, licence, phone, gender, birthday)" + "values(?,?,?,?,?,?,?,?,?)";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, User.getUserID());
			ps.setString(2, user.getEmailAddress());
			ps.setString(3, user.getFname());
			ps.setString(4, user.getSurname());
			ps.setString(5, user.getPassword());
			ps.setString(6, user.getLicence());
			ps.setString(7, user.getPhone());
			ps.setString(8, user.getGender());
			ps.setString(9, user.getBirthday());
			return ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	
	public static boolean emailExists(String emailAddress) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		ResultSet rs = null;
		String query = "select EmailAddress from user " + "where EmailAddress =?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, emailAddress);
			rs = ps.executeQuery();
			return rs.next();
		
		}
		catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	public static int insertVehicle (Vehicle vehicle) {
		
		loadDriver(dbDriver);
		Connection con = getConnection();
		
		String sql ="insert into usercars (vehiclePlateID, vehiclePlate, userID, make, model, engineType)" + " values(?,?,?,?,?,?)";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, vehicle.getVehiclePlateID());
			ps.setString(2, vehicle.getVehiclePlate());
			ps.setLong(3, User.getUserID());
			ps.setString(4, vehicle.getMake());
			ps.setString(5, vehicle.getModel());
			ps.setString(6, vehicle.getEngineType());
			return ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	public static boolean checkPassword (String emailAddress, String password) throws SQLException {
		
		String correctPassword = null;
		loadDriver(dbDriver);
		Connection con = getConnection();
		
		Statement statement = con.createStatement();
		statement.executeQuery("select password from user where emailAddress='" + emailAddress + "'");
		ResultSet rs = statement.getResultSet();
		
		if(rs.next()) {
			correctPassword = rs.getString(1);
		}
		statement.close();
		if(correctPassword.equals(password)) {
			return true;
		}else {
			return false;
		}
	}
}
