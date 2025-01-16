package cand.mgmt.dao;

import java.sql.SQLException;
import java.util.List;

import cand.mgmt.entities.Voter;

public interface VoterInt {
	
	void createSchema() throws ClassNotFoundException, SQLException;
	
	void createTable() throws ClassNotFoundException, SQLException;
	
	int insertDetails(Voter voter) throws ClassNotFoundException, SQLException;
	
	int updateDetails(Voter voter) throws ClassNotFoundException, SQLException;

	Voter getDetails(int voterId) throws ClassNotFoundException, SQLException;
	
	List <Voter> getAllDetails() throws ClassNotFoundException, SQLException;

	int deleteDetails(int voterId) throws ClassNotFoundException, SQLException;
	
	void markVoterAsVoted(int voterId) throws ClassNotFoundException, SQLException;


}
