package alotra.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Set the content type of response to "text/html"
		resp.setContentType("text/html");

        // Get the print writer object to write into the response
        PrintWriter out = resp.getWriter();

        // Get the session object
        HttpSession session = req.getSession();

        // Get User entered details from the request using request parameter.
        String user = req.getParameter("name");
        String password = req.getParameter("pass");

        // set the user in this session and redirect to welcome page
        if (password.equals("123") && (user.equals("phuc"))) {
            session.setAttribute("user", user);
            resp.sendRedirect("welcome.jsp?name=" + user);
        }
        // If the password is wrong, display the error message on the login page.
        else {
            RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
            out.println("<font color=red>Password is wrong.</font>");
            rd.include(req, resp);
        }
        // Close the print writer object.
        out.close();
	}

}
