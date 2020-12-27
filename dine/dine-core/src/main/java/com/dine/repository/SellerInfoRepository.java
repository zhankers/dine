package com.dine.repository;

import com.dine.repository.entity.SellerInfo;
import com.dine.repository.support.LambdaJpaRepository;


public interface SellerInfoRepository extends LambdaJpaRepository<SellerInfo, Long> {
    SellerInfo findByPhone(String phone);

    SellerInfo findBySellerId(Long sellerId);
}
