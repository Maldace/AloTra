package alotra.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Get the print writer object to write into the response
        PrintWriter out = resp.getWriter();

        // Set the content type of response to "text/html"
        resp.setContentType("text/html");

        // For understanding purpose, print the session object in the console before invalidating the session.
        System.out.println("Session before invalidate: "+ req.getSession(false));

        // Invalidate the session.
        req.getSession(false).invalidate();

        // Print the session object in the console after invalidating the session.
        System.out.println("Session after invalidate: "+ req.getSession(false));

        out.println("Thank you! You are successfully logged out.");
        out.close();
	}
}
