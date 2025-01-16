package cand.mgmt.entities;

public class Candidate {

	private int Candidate_id;
	private String First_name;
	private String Last_name;
	private String State;
	private String City;
	private int Age;
	private String Party_name;
	private int voteCount;

	public Candidate() {
		super();

	}

	public int getVoteCount() {
		return voteCount;
	}

	public void setVoteCount(int voteCount) {
		this.voteCount = voteCount;
	}
	
	

	public Candidate(String first_name, String last_name, String state, String city, int age, String party_name,
			int voteCount) {
		super();
		First_name = first_name;
		Last_name = last_name;
		State = state;
		City = city;
		Age = age;
		Party_name = party_name;
		this.voteCount = voteCount;
	}

	public Candidate(int candidate_id, String first_name, String last_name, String state, String city, int age,
			String party_name, int voteCount) {
		super();
		Candidate_id = candidate_id;
		First_name = first_name;
		Last_name = last_name;
		State = state;
		City = city;
		Age = age;
		Party_name = party_name;
		this.voteCount = voteCount;
	}

	public Candidate(String first_name, String last_name, String state, String city, int age, String party_name) {
		super();
		First_name = first_name;
		Last_name = last_name;
		State = state;
		City = city;
		Age = age;
		Party_name = party_name;
	}

	public Candidate(int candidate_id, String first_name, String last_name, String state, String city, int age,
			String party_name) {
		super();
		Candidate_id = candidate_id;
		First_name = first_name;
		Last_name = last_name;
		State = state;
		City = city;
		Age = age;
		Party_name = party_name;
	}

	@Override
	public String toString() {
		return "Candidate [Candidate_id=" + Candidate_id + ", First_name=" + First_name + ", Last_name=" + Last_name
				+ ", State=" + State + ", City=" + City + ", Age=" + Age + ", Party_name=" + Party_name + ", voteCount="
				+ voteCount + "]";
	}
	
	

	public String getParty_name() {
		return Party_name;
	}

	public void setParty_name(String party_name) {
		Party_name = party_name;
	}

	public int getCandidate_id() {
		return Candidate_id;
	}

	public void setCandidate_id(int candidate_id) {
		Candidate_id = candidate_id;
	}

	public String getFirst_name() {
		return First_name;
	}

	public void setFirst_name(String first_name) {
		First_name = first_name;
	}

	public String getLast_name() {
		return Last_name;
	}

	public void setLast_name(String last_name) {
		Last_name = last_name;
	}

	public String getState() {
		return State;
	}

	public void setState(String state) {
		State = state;
	}

	public String getCity() {
		return City;
	}

	public void setCity(String city) {
		City = city;
	}

	public int getAge() {
		return Age;
	}

	public void setAge(int age) {
		Age = age;
	}

}
