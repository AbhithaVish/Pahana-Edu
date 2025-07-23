package com.example.Business.items.mapper;

import com.example.Business.items.dto.ProductDTO;
import com.example.persistence.model.Product;

import java.sql.SQLException;

public class ProductMapper {
    public static Product toEntity(Product dto) {
        return new Product(dto.getName(), dto.getDescription(), dto.getPrice());
    }

    public static ProductDTO toDTO(Product entity) {
        return new ProductDTO(entity.getName(), entity.getDescription(), entity.getPrice());
    }

    public boolean addProduct(Product productDTO) {
        Product product = ProductMapper.toEntity(productDTO);
        ProductMapper productDAO = null;
        return productDAO.addProduct(product);
    }
}