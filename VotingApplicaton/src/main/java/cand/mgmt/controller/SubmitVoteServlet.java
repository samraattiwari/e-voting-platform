package cand.mgmt.controller;

import java.io.IOException;
import cand.mgmt.dao.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SubmitVote")
public class SubmitVoteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get the candidateId from the form submission
            String candidateIdParam = request.getParameter("candidateId");
            if (candidateIdParam != null && !candidateIdParam.isEmpty()) {
                int candidateId = Integer.parseInt(candidateIdParam);

                // Increment the vote count for the selected candidate
                CandInterface candidateDao = new CandidateImp();
                candidateDao.incrementVoteCount(candidateId);

                // Mark the voter as voted
                HttpSession session = request.getSession();
                Object voterIdObj = session.getAttribute("voterId");
                if (voterIdObj != null) {
                    int voterId = Integer.parseInt(voterIdObj.toString());
                    VoterInt voterDao = new VoterImpl();
                    voterDao.markVoterAsVoted(voterId);

                    // Redirect back to the voting page with success message
                    response.sendRedirect("Success.jsp?success=true");
                } else {
                    throw new ServletException("Session attribute 'voterId' is null");
                }
            } else {
                // No candidate selected, redirect back with failure message
                response.sendRedirect("Voting.jsp?success=false");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Log the exception
            getServletContext().log("Exception occurred in SubmitVoteServlet", e);
            // Redirect back to the voting page with failure message
            response.sendRedirect("Voting.jsp?success=false");
        }
    }
}
