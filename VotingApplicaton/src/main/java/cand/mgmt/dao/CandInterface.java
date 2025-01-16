package cand.mgmt.dao;

import java.sql.SQLException;
import java.util.List;

import cand.mgmt.entities.Candidate;


public interface CandInterface {

	void createSchema(String schemaName) throws ClassNotFoundException, SQLException;

	void createTable() throws ClassNotFoundException, SQLException;

	int insertCandidate(Candidate candidate) throws ClassNotFoundException, SQLException;

	int updateCandidate(Candidate candidate) throws ClassNotFoundException, SQLException;

	Candidate getCandidate(int Candidate_id) throws ClassNotFoundException, SQLException;
	
	List <Candidate> getAllCandidates()throws ClassNotFoundException, SQLException;
	
	int deleteCandidate(int Candidate_id)throws ClassNotFoundException, SQLException;
	
	 int incrementVoteCount(int Candidate_id) throws ClassNotFoundException, SQLException;
	 
	 List<Candidate> getAllCandidatesSortedByVoteCount() throws ClassNotFoundException, SQLException;
	 
	 List<Candidate> getCandidatesWithMaxVoteCount() throws ClassNotFoundException, SQLException;
 
}
