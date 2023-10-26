package com.gathergrid.gathergridtesting.repository;


import com.gathergrid.gathergridtesting.entities.Category;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.util.List;

public class CategoryRepository {
    private final EntityManagerFactory entityManagerFactory;

    public CategoryRepository() {
        entityManagerFactory = Persistence.createEntityManagerFactory("persistence.gather_grid");
    }

    public void save(Category category) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(category);
            entityManager.getTransaction().commit();
        } finally {
            entityManager.close();
        }
    }

    public Category getById(Long id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Category category = entityManager.find(Category.class, id);
            entityManager.getTransaction().commit();
            return category;
        } finally {
            entityManager.close();
        }
    }

    public List<Category> getAll() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            List<Category> selectCFromCategoryC = entityManager.createQuery("SELECT c FROM Category c", Category.class).getResultList();
            entityManager.getTransaction().commit();
            return selectCFromCategoryC;
        } finally {
            entityManager.close();
        }
    }

    public void update(Category category) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.merge(category);
            entityManager.getTransaction().commit();
        } finally {
            entityManager.close();
        }
    }

    public void delete(Long id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Category category = entityManager.find(Category.class, id);
            if (category != null) {
                entityManager.remove(category);
            }
            entityManager.getTransaction().commit();
        } finally {
            entityManager.close();
        }
    }
}
