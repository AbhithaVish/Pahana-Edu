package com.example.Business.items.service;


import com.example.Business.items.dto.ProductDTO;
import com.example.persistence.dao.ProductDAO;

import java.sql.SQLException;

public class ProductService {
    private final ProductDAO productDAO = new ProductDAO();

    public boolean addProduct(ProductDTO product) {
        try {
            return productDAO.addProduct(product);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}