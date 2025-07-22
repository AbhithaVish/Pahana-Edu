package com.example.Business.user.service;



import com.example.Business.user.dto.UserDTO;
import com.example.persistence.dao.LoginDAO;


import java.sql.SQLException;

public class LoginService {
    private final LoginDAO loginDAO;

    public LoginService() {
        this.loginDAO = new LoginDAO();
    }

    public UserDTO authenticate(String username, String password) throws SQLException {
        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            return null;
        }
        return loginDAO.authenticateUser(username, password);
    }
}