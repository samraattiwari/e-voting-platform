package cand.mgmt.entities;

import java.sql.Date;

public class Voter {
	

	private int voterId;
	private String firstName;
	private String lastName;
	private long aadharNo;
	private int age;
	private String state;
	private String city;
	private boolean hasVoted;
	private Date dob;
	private String password;

	public Voter() {
		super();
	}

	public void markVoted() {
	    this.hasVoted = true;
	}

	

	public Voter(int voterId, String name, String lastName, long aadharNo, int age, String state, String city) {
		super();
		this.voterId = voterId;
		this.firstName = name;
		this.lastName = lastName;
		this.aadharNo = aadharNo;
		this.age = age;
		this.state = state;
		this.city = city;
	}

	public Voter(int voterId, String firstName, String lastName, long aadharNo, int age, String state, String city,
			boolean hasVoted, Date dob, String password) {
		super();
		this.voterId = voterId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.aadharNo = aadharNo;
		this.age = age;
		this.state = state;
		this.city = city;
		this.hasVoted = hasVoted;
		this.dob = dob;
		this.password = password;
	}
	
	public Voter(String firstName, String lastName, long aadharNo, int age, String state, String city) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.aadharNo = aadharNo;
		this.age = age;
		this.state = state;
		this.city = city;
	}

	public Voter(String firstName, String lastName, long aadharNo, int age, String state, String city, boolean hasVoted,
			String password) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.aadharNo = aadharNo;
		this.age = age;
		this.state = state;
		this.city = city;
		this.hasVoted = hasVoted;
		this.password = password;
	}
	
	public Voter(String firstName, String lastName, long aadharNo, int age, String state, String city, Date dob,
			String password) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.aadharNo = aadharNo;
		this.age = age;
		this.state = state;
		this.city = city;
		this.dob = dob;
		this.password = password;
	}

	public Date getDob() {
		return dob;
	}



	public void setDob(Date dob) {
		this.dob = dob;
	}



	public int getVoterId() {
		return voterId;
	}

	public void setVoterId(int voterId) {
		this.voterId = voterId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public long getAadharNo() {
		return aadharNo;
	}

	public void setAadharNo(long aadharNo) {
		this.aadharNo = aadharNo;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public boolean isHasVoted() {
		return hasVoted;
	}

	public void setHasVoted(boolean hasVoted) {
		this.hasVoted = hasVoted;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	
	public String toString() {
		return "\nVoter [voterId=" + voterId + ", firstName=" + firstName + ", lastName=" + lastName + ", aadharNo="
				+ aadharNo + ", age=" + age + ", state=" + state + ", city=" + city + ", hasVoted=" + hasVoted
				+ ", password=" + password + "]";
	}

}
