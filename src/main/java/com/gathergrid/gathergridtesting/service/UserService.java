package com.gathergrid.gathergridtesting.service;

import com.gathergrid.gathergridtesting.entities.User;
import com.gathergrid.gathergridtesting.repository.UserRepository;

import java.util.List;

public class UserService {
    private final UserRepository userRepository;

    public UserService() {
        userRepository = new UserRepository();
    }

    public List<User> findAll() {
        return userRepository.findAll();
    }
}
