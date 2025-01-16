package cand.mgmt.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cand.mgmt.dao.CandidateImp;
import cand.mgmt.dao.CandInterface;
import cand.mgmt.entities.Candidate;

@WebServlet("/ResultServlet")
public class ResultServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Fetch candidates with maximum vote count
            CandInterface candidateDao = new CandidateImp();
            List<Candidate> winners = candidateDao.getCandidatesWithMaxVoteCount();

            // Set winners as request attribute
            request.setAttribute("winners", winners);

            // Forward to result.jsp
            request.getRequestDispatcher("result.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            // Redirect to an error page or handle as needed
            response.sendRedirect("error.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // doPost method is not used in this example, doGet is sufficient for fetching results
        doGet(request, response);
    }
}
