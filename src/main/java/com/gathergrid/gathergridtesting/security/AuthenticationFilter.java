package com.gathergrid.gathergridtesting.security;

import com.gathergrid.gathergridtesting.entities.User;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;


//@WebFilter("/*")
public class AuthenticationFilter implements Filter {

    private HttpServletRequest httpRequest;
    private HttpServletResponse httpResponse;

    private final List<String> reachablePathsWithoutAuthentication = Arrays.asList("/auth/login.php",
            "assets/" , "/auth/logup.php");

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        httpRequest = (HttpServletRequest) request;
        httpResponse = (HttpServletResponse) response;

        HttpSession httpSession = httpRequest.getSession(true);

        User loggedUser = (User) httpSession.getAttribute("user");

        if (loggedUser != null && reachablePathWithoutLogging()) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/home");
            return;
        }

        // This Condition Is For Not Accesseding Other Pages Without Logging In
        if (loggedUser == null && !reachablePathWithoutLogging()) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/auth/login.php");
            return;
        }

        chain.doFilter(request, response);
    }

    public boolean reachablePathWithoutLogging() {
        return reachablePathsWithoutAuthentication.stream()
                .anyMatch(httpRequest.getRequestURL().toString()::contains);
    }

}
