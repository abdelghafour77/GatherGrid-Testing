package com.gathergrid.gathergridtesting.repository;

import com.gathergrid.gathergridtesting.entities.Event;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.util.List;
import java.util.stream.Collectors;

public class EventRepository {
    private final EntityManagerFactory entityManagerFactory;

    public EventRepository() {
        entityManagerFactory = Persistence.createEntityManagerFactory("persistence.gather_grid");
    }

    public Event save(Event event) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(event);
            entityManager.getTransaction().commit();
            return event;
        } finally {
            entityManager.close();
        }
    }

    public Event getById(Long id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Event event = entityManager.find(Event.class, id);
            entityManager.getTransaction().commit();
            return event;
        } finally {
            entityManager.close();
        }
    }

    public List<Event> getAll() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        List<Event> selectEFromEventE = entityManager.createQuery("SELECT e FROM Event e", Event.class)
                .getResultStream().collect(Collectors.toList());
        entityManager.getTransaction().commit();
        return selectEFromEventE;

    }

    public void update(Event event) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.merge(event);
            entityManager.getTransaction().commit();
        } finally {
            entityManager.close();
        }
    }

    public void delete(Long id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Event event = entityManager.find(Event.class, id);
            if (event != null) {
                entityManager.remove(event);
            }
            entityManager.getTransaction().commit();
        } finally {
            entityManager.close();
        }
    }
}
