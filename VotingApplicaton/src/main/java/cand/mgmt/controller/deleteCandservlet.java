package cand.mgmt.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cand.mgmt.dao.CandInterface;
import cand.mgmt.dao.CandidateImp;



@WebServlet("/deleteCandidate")
public class deleteCandservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");

		int i = Integer.parseInt(id);
		
		

		String message = "Candidate can't be deleted";

		try {

			CandInterface e3 = new CandidateImp();

			int result = e3.deleteCandidate(i);

			if (result > 0) {
				message = "Candidate deleted successfully";
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		response.sendRedirect("CandidateList.jsp?message=" + message);

	}

}
