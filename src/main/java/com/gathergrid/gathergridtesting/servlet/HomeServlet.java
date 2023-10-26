package com.gathergrid.gathergridtesting.servlet;


import com.gathergrid.gathergridtesting.entities.Category;
import com.gathergrid.gathergridtesting.entities.Event;
import com.gathergrid.gathergridtesting.service.CategoryService;
import com.gathergrid.gathergridtesting.service.EventService;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    @Inject
    private EventService eventService = new EventService();
    @Inject
    private CategoryService categoryService = new CategoryService();
    @Override
    public void init() {
        getServletContext().setAttribute("authenticated", false);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Event> events = eventService.getAllEvents();
        List<Category> categories   = categoryService.getAllCategories();
        req.setAttribute("events", events);
        req.setAttribute("categories", categories);
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}
