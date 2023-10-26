package com.gathergrid.gathergridtesting.repository;

import com.gathergrid.gathergridtesting.entities.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.util.List;

public class UserRepository {
    private final EntityManagerFactory entityManagerFactory;

    public UserRepository() {
        entityManagerFactory = Persistence.createEntityManagerFactory("persistence.gather_grid");
    }

    public List<User> findAll() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        return entityManager.createQuery("SELECT u FROM User u ", User.class)
                .getResultList();
    }
}
