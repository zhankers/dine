package com.dine.repository;

import com.dine.entity.ProductInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

/**
 *
 */
public interface ProductInfoRepository extends JpaRepository<ProductInfo, String>, JpaSpecificationExecutor<ProductInfo> {

    List<ProductInfo> findByProductStatus(Integer productStatus);

//    @Query(value = "select * from product_info where if(?1 !='',x1=?1,1=1) and if(?2 !='',x2=?2,1=1)" +
//            "and if(?3 !='',x3=?3,1=1)  ",nativeQuery = true)
//    List<ProductInfo> findList(Integer productStatus);
}
