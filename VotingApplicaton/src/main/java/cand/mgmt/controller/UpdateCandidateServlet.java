package cand.mgmt.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cand.mgmt.dao.CandidateImp;
import cand.mgmt.entities.Candidate;


@WebServlet("/updateCandidate")
public class UpdateCandidateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//			getting data from the front end
			String id = request.getParameter("id");
			String Age = request.getParameter("age");
			String State = request.getParameter("state");
			String City = request.getParameter("city");
			
//			validating data
			System.out.println(id);
			System.out.println(Age);
			System.out.println(State);
			System.out.println(City);
			
//			data conversion
			int i = Integer.parseInt(id);
			int a = Integer.parseInt(Age);
			
			Candidate e2= new Candidate(i,null, null, State, City, a, null);
			
			CandidateImp e3=new CandidateImp();
			
			try {

				int result = e3.updateCandidate(e2);
				if (result > 0)
					response.sendRedirect("CandidateList.jsp?message=CANDIDATE UPDATED SUCCESSFULLY.");
				else
					response.sendRedirect("UpdateCandidate.jsp?message=EMPLOYEE CAN'T ADDED SUCCESSFULLY.TRY AGAIN");
			} catch (ClassNotFoundException | SQLException e) {
				System.out.println("\n DATA updation failed");
				e.printStackTrace();
			}
			
		}

}
