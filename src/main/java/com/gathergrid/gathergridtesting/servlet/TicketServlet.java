package com.gathergrid.gathergridtesting.servlet;

import com.gathergrid.gathergridtesting.entities.Event;
import com.gathergrid.gathergridtesting.entities.Ticket;
import com.gathergrid.gathergridtesting.entities.enums.TicketType;
import com.gathergrid.gathergridtesting.service.EventService;
import com.gathergrid.gathergridtesting.service.TicketService;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/tickets")
public class TicketServlet extends HttpServlet {

    @Inject
    private TicketService ticketService = new TicketService();

    @Inject
    private EventService eventService = new EventService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            List<Ticket> tickets = ticketService.getAllTickets();
            request.setAttribute("tickets", tickets);
            request.getRequestDispatcher("/list-tickets.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            Long ticketId = Long.parseLong(request.getParameter("id"));
            Ticket ticket = ticketService.getTicketById(ticketId);
            request.setAttribute("ticket", ticket);
            request.getRequestDispatcher("/ticket-form.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            Long ticketId = Long.parseLong(request.getParameter("id"));
            ticketService.deleteTicket(ticketId);
            response.sendRedirect(request.getContextPath() + "/tickets");
        } else if (action.equals("add")) {
            request.getRequestDispatcher("/ticket-form.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");

        if ("create".equals(action)) {
            Ticket newTicket = createTicketFromRequest(request);
            ticketService.createTicket(newTicket);
        } else if ("update".equals(action)) {
            String ticketIdParam = request.getParameter("ticketId");
            Long ticketId = (ticketIdParam != null && !ticketIdParam.isEmpty()) ? Long.parseLong(ticketIdParam) : null;


            if (ticketId != null) {
                Ticket existingTicket = ticketService.getTicketById(ticketId);

                if (existingTicket != null) {
                    Ticket updatedTicket = createTicketFromRequest(request);
                    updatedTicket.setId(existingTicket.getId());
                    ticketService.updateTicket(updatedTicket);
                }
            }
        }

        response.sendRedirect(request.getContextPath() + "/tickets");
    }

    private Ticket createTicketFromRequest(HttpServletRequest request) {
        Ticket ticket = new Ticket();
        ticket.setPrice(Double.parseDouble(request.getParameter("ticketPrix")));
//        ticket.setQuantityAvailable(Integer.parseInt(request.getParameter("ticketQuantite")));
        String ticketTypeStr = request.getParameter("ticketType");

        if (ticketTypeStr != null && !ticketTypeStr.isEmpty()) {
            TicketType ticketType = TicketType.valueOf(ticketTypeStr);
            ticket.setTicketType(ticketType);
        }

        Long eventId = Long.parseLong(request.getParameter("eventId"));
        Event event = eventService.getEventById(eventId);
        ticket.setEvent(event);

        return ticket;
    }
}
