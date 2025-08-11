package com.example.Business.items.mapper;

import com.example.Business.items.dto.ProductDTO;
import com.example.persistence.model.Product;

public class ProductMapper {

    public static Product toEntity(ProductDTO dto) {
        Product product = new Product();
        product.setName(dto.getName());
        product.setDescription(dto.getDescription());
        product.setCategory(dto.getCategory());  // NEW
        product.setQuantity(dto.getQuantity());  // NEW
        product.setPrice(dto.getPrice());
        return product;
    }

    public static ProductDTO toDTO(Product entity) {
        return new ProductDTO(
                entity.getName(),
                entity.getDescription(),
                entity.getCategory(),   // NEW
                entity.getQuantity(),   // NEW
                entity.getPrice()
        );
    }
}
