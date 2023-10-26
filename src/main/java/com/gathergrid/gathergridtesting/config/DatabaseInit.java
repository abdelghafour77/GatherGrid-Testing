package com.gathergrid.gathergridtesting.config;

import com.gathergrid.gathergridtesting.entities.Role;
import com.gathergrid.gathergridtesting.entities.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import org.mindrot.jbcrypt.BCrypt;

import java.util.List;

@WebServlet(value = "/db_init", loadOnStartup = 1)
public class DatabaseInit extends HttpServlet {
    @Override
    public void init() {
        this.initializeDatabase();
    }

    public void initializeDatabase() {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("persistence.gather_grid");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        Role rAdmin = new Role("ROLE_ADMIN");
        Role rOrganizer = new Role("ROLE_ORGANIZER");
        Role rUser = new Role("ROLE_USER");
        entityManager.persist(rAdmin);
        entityManager.persist(rOrganizer);
        entityManager.persist(rUser);

        User admin = new User("admin",
                BCrypt.hashpw("admin", BCrypt.gensalt()),
                "admin", "admin","admin@gmail.com",
                List.of(rAdmin, rOrganizer, rUser));

        entityManager.persist(admin);
        entityManager.getTransaction().commit();
    }
}
