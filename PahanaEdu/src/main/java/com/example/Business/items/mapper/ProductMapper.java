package com.example.Business.items.mapper;

import com.example.Business.items.dto.ProductDTO;
import com.example.persistence.model.Product;

public class ProductMapper {
    
    public static Product toEntity(ProductDTO dto) {
        return new Product(dto.getName(), dto.getDescription(), dto.getPrice());
    }

    public static ProductDTO toDTO(Product entity) {
        return new ProductDTO(entity.getName(), entity.getDescription(), entity.getPrice());
    }
}