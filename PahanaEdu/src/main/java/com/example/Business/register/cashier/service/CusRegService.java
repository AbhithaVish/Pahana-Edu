package com.example.Business.register.cashier.service;

import com.example.Business.register.cashier.dto.CusRegDTO;
import com.example.Business.register.cashier.mapper.CusRegMapper;
import com.example.persistence.dao.UserDAO;
import com.example.persistence.model.User;

import java.sql.SQLException;

public class CusRegService {

    private final UserDAO userDAO = new UserDAO();

    public boolean registerCustomer(CusRegDTO dto) throws SQLException {
        User user = CusRegMapper.toUser(dto);
        return userDAO.saveUser(user);
    }
}
