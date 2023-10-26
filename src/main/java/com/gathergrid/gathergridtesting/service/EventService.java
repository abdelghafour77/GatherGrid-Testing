package com.gathergrid.gathergridtesting.service;


import com.gathergrid.gathergridtesting.entities.Event;
import com.gathergrid.gathergridtesting.entities.Ticket;
import com.gathergrid.gathergridtesting.repository.EventRepository;

import java.util.Collections;
import java.util.List;

public class EventService {
    private final EventRepository eventRepository;

    public EventService() {
        eventRepository = new EventRepository();
    }

    public Event createEvent(Event event) {
        return eventRepository.save(event);
    }

    public Event getEventById(Long id) {
        return eventRepository.getById(id);
    }

    public List<Event> getAllEvents() {
        return eventRepository.getAll();
    }
    public List<Ticket> getTicketsByEventId(Long eventId) {
        Event event = eventRepository.getById(eventId);
        if (event != null) {
            return event.getTickets();
        }
        return Collections.emptyList();
    }

    public void updateEvent(Event event) {
        eventRepository.update(event);
    }

    public void deleteEvent(Long id) {
        eventRepository.delete(id);
    }
}
