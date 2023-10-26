package com.gathergrid.gathergridtesting.security.authentication;

import com.gathergrid.gathergridtesting.entities.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Persistence;

import java.util.Optional;

public class AccountRepository {
    private final EntityManagerFactory entityManagerFactory;
    public AccountRepository() {
        entityManagerFactory = Persistence.createEntityManagerFactory("persistence.gather_grid");
    }

    public User save(User user) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(user);
        entityManager.getTransaction().commit();
        entityManager.close();
        return user;
    }

    public Optional<User> findByUsername(String username) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            User user = entityManager.createQuery("SELECT u FROM User u WHERE u.username = :username", User.class)
                    .setParameter("username", username)
                    .getSingleResult();
            entityManager.close();
            return Optional.ofNullable(user);
        } catch (NoResultException e) {
            return Optional.empty();
        }
    }

    public Optional<User> findByEmail(String email) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            User user = entityManager.createQuery("SELECT u FROM User u WHERE u.email = :email", User.class)
                        .setParameter("email", email)
                        .getSingleResult();
            return Optional.ofNullable(user);
        }catch (NoResultException e) {
            return Optional.empty();
        }
    }
}
