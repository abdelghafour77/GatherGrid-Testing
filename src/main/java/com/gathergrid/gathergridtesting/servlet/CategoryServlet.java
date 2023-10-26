package com.gathergrid.gathergridtesting.servlet;

import com.gathergrid.gathergridtesting.entities.Category;
import com.gathergrid.gathergridtesting.service.CategoryService;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/categories")
public class CategoryServlet extends HttpServlet {
    @Inject
    private CategoryService categoryService = new CategoryService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            List<Category> categories = categoryService.getAllCategories();
            // Forward to a JSP to display the categories
            request.setAttribute("categories", categories);
            request.getRequestDispatcher("/WEB-INF/views/dashboard/list-categories.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            // Retrieve the category by ID and display an edit form
            Long categoryId = Long.parseLong(request.getParameter("id"));
            Category category = categoryService.getCategoryById(categoryId);
            request.setAttribute("category", category);
            request.getRequestDispatcher("/WEB-INF/views/dashboard/category-form.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            // Delete the category by ID
            Long categoryId = Long.parseLong(request.getParameter("id"));
            categoryService.deleteCategory(categoryId);
            response.sendRedirect(request.getContextPath() + "/categories");
        }else if (action.equals("add")) {
            request.getRequestDispatcher("/WEB-INF/views/dashboard/category-form.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");
        if ("create".equals(action)) {
            // Create a new category
            String categoryName = request.getParameter("categoryName");
            String categoryDescription = request.getParameter("categoryDescription");
            Category newCategory = new Category(categoryName,categoryDescription);
            categoryService.createCategory(newCategory);
        } else if ("update".equals(action)) {
            // Update an existing category
            Long categoryId = Long.parseLong(request.getParameter("categoryId"));
            Category category = categoryService.getCategoryById(categoryId);
            String categoryName = request.getParameter("categoryName");
            String categoryDescription = request.getParameter("categoryDescription");
            category.setName(categoryName);
            category.setDescription(categoryDescription);
            categoryService.updateCategory(category);
        }
        response.sendRedirect(request.getContextPath() + "/categories");
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPut(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp);
    }
}
