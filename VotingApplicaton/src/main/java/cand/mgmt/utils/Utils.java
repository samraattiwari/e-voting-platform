package cand.mgmt.utils;

public class Utils {
	
	public static final String DB_BASE = "jdbc:mysql://localhost:3306";
	public static final String DB_URL = "jdbc:mysql://localhost:3306/voterdata";
	public static final String USERNAME = "root";
	public static final String PASSWORD = "1234";
	
	public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	
	public static final String CREATE_SCHEMA = "CREATE SCHEMA voterdata;";
	
	public static final String CREATE_TABLE = "CREATE TABLE details (\n"
	        + "    voterId INT AUTO_INCREMENT PRIMARY KEY,\n"
	        + "    firstName VARCHAR(15) NOT NULL,\n"
	        + "    lastName VARCHAR(15) NOT NULL,\n"
	        + "    aadharNo BIGINT NOT NULL,\n"
	        + "    age INT NOT NULL,\n"
	        + "    state VARCHAR(20) NOT NULL,\n"
	        + "    city VARCHAR(20) NOT NULL,\n"
	        + "    hasVoted BIT(1) DEFAULT 0,\n"
	        + "    dob DATE NOT NULL,\n"
	        + "    password VARCHAR(20) NOT NULL\n"
	        + ");\n";


	
	public static final String INSERT_DETAILS = "INSERT INTO details (firstName, lastName, aadharNo, age, state, city, dob, password) \n"
			+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
	
	public static final String UPDATE_DETAILS = "UPDATE details SET firstName = ?, lastName = ?, age = ? WHERE voterId = ?";

	public static final String GET_DETAILS = "SELECT * FROM details WHERE voterId = ?";
	
	public static final String GET_ALL_DETAILS = "SELECT * FROM details;";
	
	public static final String DELETE_DETAILS = "DELETE FROM details WHERE voterId = ?;";
	
	public static final String MARK_VOTER_AS_VOTED = "UPDATE details SET hasVoted = TRUE WHERE voterId = ?";

	

}
