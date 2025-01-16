package cand.mgmt.utils;

public class CUtils {

	public final static String DRIVER = "com.mysql.cj.jdbc.Driver";

	public final static String DB_BASE = "jdbc:mysql://localhost:3306";
	public final static String DB_URL = "jdbc:mysql://localhost:3306/CandidateData";
	public final static String USERNAME = "root";
	public final static String PASSWORD = "1234";

	public final static String CREATE_SCHEMA = "create schema CandidateData";
	public final static String CREATE_TABLE = "CREATE TABLE Candidate(\r\n"
			+ " Candidate_id INT AUTO_INCREMENT PRIMARY KEY,\r\n" + " First_name VARCHAR(20) NOT NULL,\r\n"
			+ " Last_name VARCHAR(20) NOT NULL,\r\n" + " State VARCHAR(20) NOT NULL,\r\n"
			+ " City VARCHAR(20) NOT NULL,\r\n" + " Age INT NOT NULL,\r\n" + " Party_name VARCHAR(20) NOT NULL,\r\n"
			+ " voteCount INT DEFAULT 0\r\n" + ");\r\n" + "";

	public final static String INSERT_CANDIDATE = "INSERT INTO Candidate(Candidate_id,First_name,Last_name,State,City,Age,Party_name, voteCount) VALUES (?,?,?,?,?,?,?,?)";

	public final static String UPDATE_CANDIDATE = "UPDATE Candidate SET Age = ?, State = ?, City = ? WHERE Candidate_id = ?";

	public final static String GET_CANDIDATE = "SELECT * FROM Candidate WHERE Candidate_id = ?";

	public final static String GET_ALL_CANDIDATES = "SELECT * FROM Candidate";

	public final static String DELETE_CANDIDATE = "DELETE FROM Candidate WHERE Candidate_id = ?";

	public static final String INCREMENT_VOTE_COUNT = "UPDATE Candidate SET voteCount = voteCount + 1 WHERE Candidate_id = ?";

	// New constant for fetching all candidates sorted by voteCount descending
	public final static String GET_ALL_CANDIDATES_SORTED_BY_VOTE_COUNT = "SELECT * FROM Candidate ORDER BY voteCount DESC";

	public static final String GET_CANDIDATES_WITH_MAX_VOTE_COUNT = "SELECT * FROM Candidate WHERE voteCount = (SELECT MAX(voteCount) FROM Candidate)";
}
