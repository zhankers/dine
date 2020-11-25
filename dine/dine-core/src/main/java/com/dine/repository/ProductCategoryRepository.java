package com.dine.repository;

import com.dine.repository.entity.ProductCategory;
import com.dine.repository.support.LambdaJpaRepository;

import java.util.List;

/**
 *
 */
public interface ProductCategoryRepository extends LambdaJpaRepository<ProductCategory, Integer> {

    List<ProductCategory> findByCategoryTypeIn(List<Integer> categoryTypeList);
}
