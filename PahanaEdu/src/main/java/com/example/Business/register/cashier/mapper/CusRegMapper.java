package com.example.Business.register.cashier.mapper;

import com.example.Business.register.cashier.dto.CusRegDTO;
import com.example.persistence.model.User;

public class CusRegMapper {

    public static User toUser(CusRegDTO dto) {
        return new User(dto.getName(), dto.getEmail(), dto.getUsername(), dto.getPassword());
    }
}
