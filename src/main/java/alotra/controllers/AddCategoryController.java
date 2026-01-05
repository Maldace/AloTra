package alotra.controllers;

import java.io.IOException;

import alotra.models.CategoriesModel;
import alotra.services.CategoriesService;
import alotra.services.impl.CategoriesServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddCategoryController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String categoryName = req.getParameter("categoryName");
		CategoriesModel category = new CategoriesModel();
		category.setName(categoryName);
		CategoriesService categoriesService = new CategoriesServiceImpl();
		categoriesService.addCategory(category);
	}
}
