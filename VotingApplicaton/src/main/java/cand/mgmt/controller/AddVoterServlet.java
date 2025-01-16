package cand.mgmt.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cand.mgmt.dao.*;
import cand.mgmt.entities.*;

@WebServlet("/AddVoter")
public class AddVoterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String aadharNo = request.getParameter("aadharNo");
//		String age = request.getParameter("age");
		String state = request.getParameter("state");
		String city = request.getParameter("city");
		String dob = request.getParameter("dob");
		String password = request.getParameter("password");

		System.out.println(firstName);
		System.out.println(lastName);
		System.out.println(aadharNo);
//		System.out.println(age);
		System.out.println(state);
		System.out.println(city);
		System.out.println(dob);
		System.out.println(password);

//		if (firstName == null || lastName == null || aadharNo == null || age == null || state == null || city == null) {
//            response.sendRedirect("voter.jsp?message=Please provide all required details.");
//            return;
//        }
		long Aadhar = Long.parseLong(aadharNo);
//		int Age = Integer.parseInt(age);

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date utilDateOfBirth = null;

		try {
			utilDateOfBirth = dateFormat.parse(dob);
		} catch (ParseException e) {
			e.printStackTrace();
			response.sendRedirect("add_voter.jsp?message=Invalid date format. Please use yyyy-MM-dd.");
			return;
		}

		int Age = calculateAge(utilDateOfBirth);

		if (Age < 18) {
			response.sendRedirect("add_voter.jsp?message=You must be at least 18 years old to register.");
			return;
		}

		java.sql.Date dateOfBirth = new java.sql.Date(utilDateOfBirth.getTime());

		Voter voter = new Voter(firstName, lastName, Aadhar, Age, state, city, dateOfBirth, password);

		VoterInt voterDao = new VoterImpl();

		try {
			int r = voterDao.insertDetails(voter);

			if (r > 0) {
				int voterId = voter.getVoterId();

				// Set voterId in session
				HttpSession session = request.getSession();
				session.setAttribute("voterId", voterId);
				response.sendRedirect("RegistrationSuccess.jsp?voterId=" + voterId);
			} else
				response.sendRedirect("welcome.jsp?message=Sorry. Unable to add Data.");

//			System.out.println("Data added Successfully.");
//			System.out.println("Your VoterID is: " + voter.getVoterId());

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			System.out.println("Failure.");
		}

	}

	private int calculateAge(Date dob) {
		Calendar birth = Calendar.getInstance();
		birth.setTime(dob);
		Calendar today = Calendar.getInstance();
		int age = today.get(Calendar.YEAR) - birth.get(Calendar.YEAR);
		if (today.get(Calendar.DAY_OF_YEAR) < birth.get(Calendar.DAY_OF_YEAR)) {
			age--;
		}
		return age;
	}

}
