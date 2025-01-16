package cand.mgmt.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cand.mgmt.entities.Candidate;
import cand.mgmt.utils.CUtils;

public class CandidateImp implements CandInterface {

	Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName(CUtils.DRIVER);
		Connection con = DriverManager.getConnection(CUtils.DB_URL, CUtils.USERNAME, CUtils.PASSWORD);

		return con;
	}

	public void createSchema(String schemaName) throws ClassNotFoundException, SQLException {
		Class.forName(CUtils.DRIVER);

		try (Connection con = DriverManager.getConnection(CUtils.DB_BASE, CUtils.USERNAME, CUtils.PASSWORD);
				Statement stmt = con.createStatement();) {
			int result = stmt.executeUpdate(CUtils.CREATE_SCHEMA);
			System.out.println("\nResult" + result);
		}

	}

	public void createTable() throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		Statement stmt = con.createStatement();

		stmt.executeUpdate(CUtils.CREATE_TABLE);

	}

	public int insertCandidate(Candidate candidate) throws ClassNotFoundException, SQLException {
		Connection con = getConnection();

		PreparedStatement pStmt = con.prepareStatement(CUtils.INSERT_CANDIDATE);
		pStmt.setInt(1, candidate.getCandidate_id());
		pStmt.setString(2, candidate.getFirst_name());
		pStmt.setString(3, candidate.getLast_name());
		pStmt.setString(4, candidate.getState());
		pStmt.setString(5, candidate.getCity());
		pStmt.setInt(6, candidate.getAge());
		pStmt.setString(7, candidate.getParty_name());
		pStmt.setInt(8, candidate.getVoteCount());

		return pStmt.executeUpdate();
	}

	public int updateCandidate(Candidate candidate) throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		PreparedStatement pStmt = con.prepareStatement(CUtils.UPDATE_CANDIDATE);

		pStmt.setInt(1, candidate.getAge());
		pStmt.setString(2, candidate.getState());
		pStmt.setString(3, candidate.getCity());
		pStmt.setInt(4, candidate.getCandidate_id());

		return pStmt.executeUpdate();

	}

	public Candidate getCandidate(int Candidate_id) throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		PreparedStatement pStmt = con.prepareStatement(CUtils.GET_CANDIDATE);

		pStmt.setInt(1, Candidate_id);
		ResultSet rSet = pStmt.executeQuery();

		Candidate candidate = new Candidate();

		if (rSet.next()) {

			int C_id = rSet.getInt("Candidate_id");
			String First_name = rSet.getString("First_name");
			String Last_name = rSet.getString("Last_name");
			String State = rSet.getString("State");
			String City = rSet.getString("City");
			int Age = rSet.getInt("Age");
			String Party_name = rSet.getString("Party_name");

			candidate.setCandidate_id(C_id);
			candidate.setFirst_name(First_name);
			candidate.setLast_name(Last_name);
			candidate.setState(State);
			candidate.setCity(City);
			candidate.setAge(Age);
			candidate.setParty_name(Party_name);

		}

		return candidate;
	}

	public List<Candidate> getAllCandidates() throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		Statement stmt = con.createStatement();
		ResultSet rSet = stmt.executeQuery(CUtils.GET_ALL_CANDIDATES);

		List<Candidate> candidates = new ArrayList<Candidate>();

		while (rSet.next()) {
			int Candidate_id = rSet.getInt("Candidate_id");
			String First_name = rSet.getString("First_name");
			String Last_name = rSet.getString("Last_name");
			String State = rSet.getString("State");
			String City = rSet.getString("City");
			int Age = rSet.getInt("Age");
			String Party_name = rSet.getString("Party_name");
			int voteCount = rSet.getInt("voteCount");

			Candidate candidate = new Candidate();

			candidate.setCandidate_id(Candidate_id);
			candidate.setFirst_name(First_name);
			candidate.setLast_name(Last_name);
			candidate.setState(State);
			candidate.setCity(City);
			candidate.setAge(Age);
			candidate.setParty_name(Party_name);
			candidate.setVoteCount(voteCount);

			candidates.add(candidate);
		}

		return candidates;
	}
	
	
	public List<Candidate> getAllCandidatesSortedByVoteCount() throws ClassNotFoundException, SQLException {
	    Connection con = getConnection();
	    Statement stmt = con.createStatement();
	    ResultSet rSet = stmt.executeQuery(CUtils.GET_ALL_CANDIDATES_SORTED_BY_VOTE_COUNT);

	    List<Candidate> candidates = new ArrayList<>();
	    while (rSet.next()) {
	        int candidate_id = rSet.getInt("Candidate_id");
	        String first_name = rSet.getString("First_name");
	        String last_name = rSet.getString("Last_name");
	        String state = rSet.getString("State");
	        String city = rSet.getString("City");
	        int age = rSet.getInt("Age");
	        String party_name = rSet.getString("Party_name");
	        int voteCount = rSet.getInt("voteCount");

	        Candidate candidate = new Candidate();
	        candidate.setCandidate_id(candidate_id);
	        candidate.setFirst_name(first_name);
	        candidate.setLast_name(last_name);
	        candidate.setState(state);
	        candidate.setCity(city);
	        candidate.setAge(age);
	        candidate.setParty_name(party_name);
	        candidate.setVoteCount(voteCount);

	        candidates.add(candidate);
	    }

	    // Close resources
	    rSet.close();
	    stmt.close();
	    con.close();

	    return candidates;
	}
	
//	max count
	
	 public List<Candidate> getCandidatesWithMaxVoteCount() throws ClassNotFoundException, SQLException {
	        Connection con = getConnection();
	        Statement stmt = con.createStatement();
	        ResultSet rSet = stmt.executeQuery(CUtils.GET_CANDIDATES_WITH_MAX_VOTE_COUNT);

	        List<Candidate> candidates = new ArrayList<>();
	        while (rSet.next()) {
	            int candidate_id = rSet.getInt("Candidate_id");
	            String first_name = rSet.getString("First_name");
	            String last_name = rSet.getString("Last_name");
	            String state = rSet.getString("State");
	            String city = rSet.getString("City");
	            int age = rSet.getInt("Age");
	            String party_name = rSet.getString("Party_name");
	            int voteCount = rSet.getInt("voteCount");

	            Candidate candidate = new Candidate();
	            candidate.setCandidate_id(candidate_id);
	            candidate.setFirst_name(first_name);
	            candidate.setLast_name(last_name);
	            candidate.setState(state);
	            candidate.setCity(city);
	            candidate.setAge(age);
	            candidate.setParty_name(party_name);
	            candidate.setVoteCount(voteCount);

	            candidates.add(candidate);
	        }

	        // Close resources
	        rSet.close();
	        stmt.close();
	        con.close();

	        return candidates;
	    }



	public int deleteCandidate(int Candidate_id) throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		PreparedStatement pStmt = con.prepareStatement(CUtils.DELETE_CANDIDATE);
		pStmt.setInt(1, Candidate_id);
		return pStmt.executeUpdate();
	}

	public int incrementVoteCount(int Candidate_id) throws ClassNotFoundException, SQLException {
		Connection con = getConnection();
		PreparedStatement pStmt = con.prepareStatement(CUtils.INCREMENT_VOTE_COUNT);
		pStmt.setInt(1, Candidate_id);
		return pStmt.executeUpdate();
	}

}
