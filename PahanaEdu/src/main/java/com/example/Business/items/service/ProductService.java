package com.example.Business.items.service;


import com.example.Business.items.dto.ProductDTO;
import com.example.Business.items.mapper.ProductMapper;
import com.example.persistence.dao.ProductDAO;
import com.example.persistence.model.Product;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

    public List<ProductDTO> getAllProductViews() {
        try {
            List<Product> products = productDAO.getAllProductViews();
            List<ProductDTO> productDTOs = new ArrayList<>();
            for (Product product : products) {
                productDTOs.add(ProductMapper.toDTO(product));
            }
            return productDTOs;
        } catch (SQLException e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    public ProductDTO getProductById(int id) {
        try {
            Product product = productDAO.getProductById(id);
            return product != null ? ProductMapper.toDTO(product) : null;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean updateProduct(ProductDTO dto, int id) {
        try {
            Product product = ProductMapper.toEntity(dto);
            product.setId(id);
            return productDAO.updateProduct(product);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteProduct(int id) {
        try {
            return productDAO.deleteProduct(id);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}