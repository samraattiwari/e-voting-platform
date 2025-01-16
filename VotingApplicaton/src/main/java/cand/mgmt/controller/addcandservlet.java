package cand.mgmt.controller;

import java.io.IOException;
import java.sql.SQLException;
import cand.mgmt.*;
import cand.mgmt.dao.CandidateImp;
import cand.mgmt.entities.Candidate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addcandidate")
public class addcandservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String Fname = request.getParameter("first-name");
		String lname = request.getParameter("last-name");
		String age = request.getParameter("age");
		String C_id = request.getParameter("candidate-id");
		String party = request.getParameter("party-name");
		String state = request.getParameter("state");
		String city = request.getParameter("city");
		
		

		System.out.println(Fname);
		System.out.println(lname);
		System.out.println(age);
		System.out.println(C_id);
		System.out.println(party);
		System.out.println(state);
		System.out.println(city);
		

		int A = Integer.parseInt(age);
		int C = Integer.parseInt(C_id);

		Candidate e2 = new Candidate(Fname, lname, state, city, A, party, 0);

		CandidateImp e3 = new CandidateImp();

		try {

			int result = e3.insertCandidate(e2);
			if (result > 0) {
				response.sendRedirect("adminDashboard.jsp?message=CANDIDATE REGISTERED SUCCESFULLY");
				System.out.println("\n Success");
			} else {
				response.sendRedirect("AddCandidate.jsp?message=CANDIDATE NOT REGISTERED, TRY AGAIN");
				System.out.println("\nFailure");
			}
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("\n");
			e.printStackTrace();
		}
	}

}
