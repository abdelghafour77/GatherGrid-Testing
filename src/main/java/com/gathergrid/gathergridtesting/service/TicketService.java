package com.gathergrid.gathergridtesting.service;

import com.gathergrid.gathergridtesting.entities.Ticket;
import com.gathergrid.gathergridtesting.repository.TicketRepository;

import java.util.List;

public class TicketService {
    private final TicketRepository ticketRepository;

    public TicketService() {
        ticketRepository = new TicketRepository();
    }

    public void createTicket(Ticket ticket) {
        ticketRepository.save(ticket);
    }

    public Ticket getTicketById(Long id) {
        return ticketRepository.getById(id);
    }

    public List<Ticket> getAllTickets() {
        return ticketRepository.getAll();
    }

    public List<Ticket> getTicketsByEventId(Long eventId) {
        return ticketRepository.getTicketsByEventId(eventId);
    }

    public void updateTicket(Ticket ticket) {
        ticketRepository.update(ticket);
    }

    public void deleteTicket(Long id) {
        ticketRepository.delete(id);
    }
}
