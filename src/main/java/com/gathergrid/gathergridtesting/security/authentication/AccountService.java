package com.gathergrid.gathergridtesting.security.authentication;

import com.gathergrid.gathergridtesting.entities.User;
import com.gathergrid.gathergridtesting.exception.EmailAlreadyExistException;
import org.mindrot.jbcrypt.BCrypt;

import java.util.Optional;

public class AccountService {
    private final AccountRepository accountRepository;
    public AccountService() {
        accountRepository = new AccountRepository();
    }

    public void registerUser(User user) throws EmailAlreadyExistException {
        validateUserDetails(user);
        user.setPassword(hashPassword(user.getPassword()));
        accountRepository.save(user);
    }

    private void validateUserDetails(User user) throws EmailAlreadyExistException {
        if (user.getUsername() == null || user.getUsername().isEmpty() || user.getUsername().isBlank()
                || user.getEmail().isBlank() || user.getEmail().isEmpty()
                || user.getPassword().isBlank() || user.getPassword().isEmpty() || user.getPassword().length() < 6
        )
            throw new IllegalArgumentException("Invalid user data");

        if (accountRepository.findByEmail(user.getEmail()).isPresent())
            throw new EmailAlreadyExistException("Email already exists");

    }


    private String hashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }

    public Optional<User> login(String email, String password) {
        Optional<User> user = accountRepository.findByEmail(email);
        if(user.isPresent()) {
            if(BCrypt.checkpw(password, user.get().getPassword())) {
                return user;
            }
        }
        return Optional.empty();
    }
}
