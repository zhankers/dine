package com.dine.service;

import com.dine.entity.ProductCategory;

import java.util.List;
import java.util.Optional;

/**
 * 类目
 *
 */
public interface CategoryService {

    Optional<ProductCategory> findOne(Integer categoryId);

    List<ProductCategory> findAll();

    List<ProductCategory> findByCategoryTypeIn(List<Integer> categoryTypeList);

    ProductCategory save(ProductCategory productCategory);
}
