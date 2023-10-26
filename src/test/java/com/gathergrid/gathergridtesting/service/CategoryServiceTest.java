package com.gathergrid.gathergridtesting.service;

import com.gathergrid.gathergridtesting.entities.Category;
import com.gathergrid.gathergridtesting.repository.CategoryRepository;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import static org.junit.jupiter.api.Assertions.*;

class CategoryServiceTest {
    CategoryRepository categoryRepository;
    CategoryService categoryService;

    @BeforeEach
    void setup() {
        categoryRepository = Mockito.mock(CategoryRepository.class);
        CategoryService categoryService = new CategoryService();
    }

    @Test
    void givenCategory_whenCreateCategory_thenReturnCategory() {
        Category category1 = new Category();
        category1.setName("Test Category");
        category1.setDescription("Test Description");
        category1.setCreatedAt(null);

        Category category2 = new Category();
        category2.setName("Test Category");
        category2.setDescription("Test Description");

        Mockito.when(categoryRepository.save(category1)).thenReturn(category2);
        assertThrows(IllegalArgumentException.class,() -> categoryService.createCategory(category1), "Event does not exist");
    }

    @Test
    void givenCategory_whenCreateCategoryWithoutDate_thenReturnCategory() {
        Category category1 = new Category();
        category1.setName("Test Category");
        category1.setDescription("Test Description");

        Category category2 = new Category();
        category2.setName("Test Category");
        category2.setDescription("Test Description");

        Mockito.when(categoryRepository.save(category1)).thenReturn(category2);
        assertThrows(IllegalArgumentException.class,() -> categoryService.createCategory(category1), "Event does not exist");
    }
    @Test
    void givenCategory_whenCreateCategoryWithBlankTitle_thenReturnCategory() {
        Category category1 = new Category();
        category1.setName("");
        category1.setDescription("Test Description");

        Category category2 = new Category();
        category2.setName("Test Category");
        category2.setDescription("Test Description");

        Mockito.when(categoryRepository.save(category1)).thenReturn(category2);
        assertThrows(IllegalArgumentException.class,() -> categoryService.createCategory(category1), "Event does not exist");
    }


}