package com.gathergrid.gathergridtesting.servlet;

import com.gathergrid.gathergridtesting.entities.Category;
import com.gathergrid.gathergridtesting.entities.Event;
import com.gathergrid.gathergridtesting.entities.Ticket;
import com.gathergrid.gathergridtesting.entities.enums.TicketType;
import com.gathergrid.gathergridtesting.service.CategoryService;
import com.gathergrid.gathergridtesting.service.EventService;
import com.gathergrid.gathergridtesting.service.TicketService;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet("/events")
public class EventServlet extends HttpServlet {

    @Inject
    private EventService eventService = new EventService();
    @Inject
    private CategoryService categoryService = new CategoryService();

    @Inject
    private TicketService ticketService = new TicketService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            List<Event> events = eventService.getAllEvents();
            request.setAttribute("events", events);
            request.getRequestDispatcher("/WEB-INF/views/dashboard/list-events.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            Long eventId = Long.parseLong(request.getParameter("id"));

            Event event = eventService.getEventById(eventId);
            List<Ticket> tickets = ticketService.getTicketsByEventId(eventId);
            List<Category> categories = categoryService.getAllCategories();
            TicketType[] ticketTypes = TicketType.values();

            request.setAttribute("ticketTypes",ticketTypes);
            request.setAttribute("event", event);
            request.setAttribute("tickets", tickets);
            request.setAttribute("categories", categories);
            request.getRequestDispatcher("/WEB-INF/views/dashboard/event-form.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            Long eventId = Long.parseLong(request.getParameter("id"));
            eventService.deleteEvent(eventId);
            response.sendRedirect(request.getContextPath() + "/events");
        } else if (action.equals("add")) {
            List<Category> categories = categoryService.getAllCategories();
            request.setAttribute("categories", categories);
            TicketType[] ticketTypes = TicketType.values();
            request.setAttribute("ticketTypes",ticketTypes);
            request.getRequestDispatcher("/WEB-INF/views/dashboard/event-form.jsp").forward(request, response);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");

        if ("create".equals(action)) {
            Event newEvent = createEventFromRequest(request);

            Event event = eventService.createEvent(newEvent);;

            List<Ticket> newTickets = createTicketsFromRequest(request, event);

            for (Ticket ticket : newTickets){
                ticketService.createTicket(ticket);
            }

        } else if ("update".equals(action)) {
            String eventIdParam = request.getParameter("eventId");
            Long eventId = (eventIdParam != null && !eventIdParam.isEmpty()) ? Long.parseLong(eventIdParam) : null;

            if (eventId != null) {
                Event existingEvent = eventService.getEventById(eventId);

                if (existingEvent != null) {
                    Event updatedEvent = createEventFromRequest(request);
                    updatedEvent.setId(existingEvent.getId());
                    eventService.updateEvent(updatedEvent);

                    List<Ticket> tickets = ticketService.getTicketsByEventId(eventId);
                    List<Ticket> newTickets = createTicketsFromRequest(request, existingEvent);

                    for (int i = 0; i < tickets.size(); i++) {
                        Ticket existingTicket = tickets.get(i);
                        Ticket newTicket = newTickets.get(i);
                        newTicket.setId(existingTicket.getId());
                        ticketService.updateTicket(newTicket);
                    }
                }
            }
        }

        response.sendRedirect(request.getContextPath() + "/events");
    }

    private Event createEventFromRequest(HttpServletRequest request) {
        Event event = new Event();
        String name = request.getParameter("eventName");
        String dateStr = request.getParameter("eventDate");
        String time = request.getParameter("eventTime");
        String location = request.getParameter("eventLocation");
        String description = request.getParameter("eventDescription");
        Long categoryId = Long.parseLong(request.getParameter("categoryId"));

        // Set the event attributes
        event.setName(name);
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = dateFormat.parse(dateStr);
            event.setDate(date);
        } catch (ParseException e) {

        }
        event.setTime(time);
        event.setLocation(location);
        event.setDescription(description);
        Category category = categoryService.getCategoryById(categoryId);
        event.setCategory(category);
        event.setCreatedAt(new Date());

        return event;
    }
    private List<Ticket> createTicketsFromRequest(HttpServletRequest request, Event event) {
        List<Ticket> tickets = new ArrayList<>();
        String[] ticketPrices = request.getParameterValues("ticketPrice");
        String[] ticketQuantities = request.getParameterValues("ticketQuantity");
        String[] ticketTypes = request.getParameterValues("ticketType");

        if (ticketPrices != null && ticketQuantities != null && ticketTypes != null) {
            for (int i = 0; i < ticketPrices.length; i++) {
                Ticket ticket = new Ticket();
                ticket.setPrice(Double.parseDouble(ticketPrices[i]));
//                ticket.setQuantityAvailable(Integer.parseInt(ticketQuantities[i]));
                if (ticketTypes[i] != null && !ticketTypes[i].isEmpty()) {
                    TicketType ticketType = TicketType.valueOf(ticketTypes[i]);
                    ticket.setTicketType(ticketType);
                }
                ticket.setEvent(event);
                ticket.setCreatedAt(new Date());
                tickets.add(ticket);
            }
        }

        return tickets;
    }
}
