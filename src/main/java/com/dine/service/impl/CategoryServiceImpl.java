package com.dine.service.impl;

import com.dine.entiry.ProductCategory;
import com.dine.repository.ProductCategoryRepository;
import com.dine.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * 类目
 *
 */
@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private ProductCategoryRepository repository;

    @Override
    public Optional<ProductCategory> findOne(Integer categoryId) {
        ProductCategory productCategory = new ProductCategory();
        productCategory.setCategoryId(categoryId);
        return repository.findOne(Example.of(productCategory));
    }

    @Override
    public List<ProductCategory> findAll() {
        return repository.findAll();
    }

    @Override
    public List<ProductCategory> findByCategoryTypeIn(List<Integer> categoryTypeList) {
        return repository.findByCategoryTypeIn(categoryTypeList);
    }

    @Override
    public ProductCategory save(ProductCategory productCategory) {
        return repository.save(productCategory);
    }
}
