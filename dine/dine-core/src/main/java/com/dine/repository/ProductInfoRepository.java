package com.dine.repository;

import com.dine.repository.entity.ProductInfo;
import com.dine.repository.support.LambdaJpaRepository;

import java.util.List;

/**
 *
 */
public interface ProductInfoRepository extends LambdaJpaRepository<ProductInfo, String> {

    List<ProductInfo> findByProductStatus(Integer productStatus);

//    @Query(value = "select * from product_info where if(?1 !='',x1=?1,1=1) and if(?2 !='',x2=?2,1=1)" +
//            "and if(?3 !='',x3=?3,1=1)  ",nativeQuery = true)
//    List<ProductInfo> findList(Integer productStatus);
}
