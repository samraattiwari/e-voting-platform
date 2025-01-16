package cand.mgmt.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/CandidateData";
        String dbUser = "root";
        String dbPassword = "1234";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            String sql = "SELECT * FROM Admin WHERE Username = ? AND Password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("adminUsername", username);
                response.sendRedirect("adminDashboard.jsp");
            } else {
                response.sendRedirect("adminLogin.jsp?error=Invalid username or password");
            }

            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminLogin.jsp?error=An error occurred");
        }
    }
}
