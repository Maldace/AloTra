package alotra.controllers;

import java.io.IOException;

import alotra.services.CategoriesService;
import alotra.services.impl.CategoriesServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DelectCategoryController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String categoryName = req.getParameter("categoryName");
		CategoriesService categoriesService = new CategoriesServiceImpl();
		categoriesService.deleteCategory(categoryName);
	}
}
