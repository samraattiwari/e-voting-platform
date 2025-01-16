package cand.mgmt.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cand.mgmt.dao.*;

@WebServlet("/deleteVoter")
public class DeleteVoterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int VoterId = Integer.parseInt(request.getParameter("id"));
		
		VoterInt voterDao = new VoterImpl();
		String message = "Sorry Couldn't Delete Details";
		try {
			int r = voterDao.deleteDetails(VoterId);
			if(r>0) {
				message = "Details Deleted Successfully.";
				System.out.println("All the details of VoterID: " + VoterId + " has been deleted successfully.");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			System.out.println("Data deletion failed.");
		}
		response.sendRedirect("voter_list.jsp?message="+message);

		
		
	}

}
