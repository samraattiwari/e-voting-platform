package cand.mgmt.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cand.mgmt.entities.Voter;
import cand.mgmt.utils.Utils;
import cand.mgmt.dao.*;

public class VoterImpl implements VoterInt {

	Connection getconnection() throws ClassNotFoundException, SQLException {

		Class.forName(Utils.DRIVER);

		Connection con = DriverManager.getConnection(Utils.DB_URL, Utils.USERNAME, Utils.PASSWORD);
		return con;
	}

	
	public void createSchema() throws ClassNotFoundException, SQLException {

		Class.forName(Utils.DRIVER);

		Connection con = DriverManager.getConnection(Utils.DB_BASE, Utils.USERNAME, Utils.PASSWORD);
		Statement stmt = con.createStatement();

		int result = stmt.executeUpdate(Utils.CREATE_SCHEMA);
		System.out.println("\n RESULT: " + result);

	}

	
	public void createTable() throws ClassNotFoundException, SQLException {

		Connection con = getconnection();
		Statement stmt = con.createStatement();

		stmt.executeUpdate(Utils.CREATE_TABLE);

	}

	
	public int insertDetails(Voter voter) throws ClassNotFoundException, SQLException {

		Connection con = getconnection();
		PreparedStatement Pstmt = con.prepareStatement(Utils.INSERT_DETAILS, Statement.RETURN_GENERATED_KEYS);

		Pstmt.setString(1, voter.getFirstName());
		Pstmt.setString(2, voter.getLastName());
		Pstmt.setLong(3, voter.getAadharNo());
		Pstmt.setInt(4, voter.getAge());
		Pstmt.setString(5, voter.getState());
		Pstmt.setString(6, voter.getCity());
		Pstmt.setDate(7, voter.getDob());
		Pstmt.setString(8, voter.getPassword());

		int result = Pstmt.executeUpdate();

		if (result > 0) {
			ResultSet generatedKeys = Pstmt.getGeneratedKeys();
			if (generatedKeys.next()) {
				voter.setVoterId(generatedKeys.getInt(1));  // Set voterId in  voter 
			}
		}

		return result;
	}

	
	public int updateDetails(Voter voter) throws ClassNotFoundException, SQLException {
		Connection con = getconnection();
		PreparedStatement Pstmt = con.prepareStatement(Utils.UPDATE_DETAILS);
//		Voter voter = new Voter();

		Pstmt.setString(1, voter.getFirstName());
		Pstmt.setString(2, voter.getLastName());
		Pstmt.setInt(3, voter.getAge());
		Pstmt.setInt(4, voter.getVoterId());

		return Pstmt.executeUpdate();
	}

	
	public Voter getDetails(int voterId) throws ClassNotFoundException, SQLException {
		Connection con = getconnection();

		PreparedStatement Pstmt = con.prepareStatement(Utils.GET_DETAILS);
		Pstmt.setInt(1, voterId);

		ResultSet rSet = Pstmt.executeQuery();
		Voter voter = new Voter();

		if (rSet.next()) {
			int voterID = rSet.getInt("voterId");
			String firstName = rSet.getString("firstName");
			String lastName = rSet.getString("lastName");
			long aadhar = rSet.getLong("aadharNo");
			int age = rSet.getInt("age");
			String state = rSet.getString("state");
			String city = rSet.getString("city");
			boolean hasVoted = rSet.getBoolean("hasVoted");
			String password = rSet.getString("password");

			voter.setVoterId(voterID);
			voter.setFirstName(firstName);
			voter.setLastName(lastName);
			voter.setAadharNo(aadhar);
			voter.setAge(age);
			voter.setState(state);
			voter.setCity(city);
			voter.setHasVoted(hasVoted);
			voter.setPassword(password);
		}

		return voter;
	}

	
	public List<Voter> getAllDetails() throws ClassNotFoundException, SQLException {
		
		Connection con = getconnection();
		Statement Pstmt = con.createStatement();
		
		ResultSet rset = Pstmt.executeQuery(Utils.GET_ALL_DETAILS);
		
		List<Voter> vot = new ArrayList<Voter>();
		
		while (rset.next()) {
			
			int voterId = rset.getInt("voterId");
			String firstName = rset.getString("firstName");
			String lastName = rset.getString("lastName");
			long aadharNo = rset.getLong("aadharNo");
			int age = rset.getInt("age");
			String state = rset.getString("state");
			String city = rset.getString("city");
			boolean hasVoted = rset.getBoolean("hasVoted");
			String password = rset.getString("password");
			
			Voter voter = new Voter();
			voter.setVoterId(voterId);
			voter.setFirstName(firstName);
			voter.setLastName(lastName);
			voter.setAadharNo(aadharNo);
			voter.setAge(age);
			voter.setState(state);
			voter.setCity(city);
			voter.setHasVoted(hasVoted);
			voter.setPassword(password);
			
			vot.add(voter);
		}
		
		return vot;
	}
	
	public void markVoterAsVoted(int voterId) throws ClassNotFoundException, SQLException {
	    try (Connection con = getconnection();
	            PreparedStatement pStmt = con.prepareStatement(Utils.MARK_VOTER_AS_VOTED)) {

	           pStmt.setInt(1, voterId);
	           pStmt.executeUpdate();

	       } catch (SQLException | ClassNotFoundException e) {
	           // Log the exception or handle it as appropriate
	           e.printStackTrace();
	           throw e; // Rethrow the exception to propagate it to the caller
	       }
	   }



	
	public int deleteDetails(int voterId) throws ClassNotFoundException, SQLException {
		Connection con = getconnection();
		PreparedStatement Pstmt = con.prepareStatement(Utils.DELETE_DETAILS);
		
		Pstmt.setInt(1, voterId);
		
		
		return Pstmt.executeUpdate();
	}

}
