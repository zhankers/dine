package com.dine.repository;

import com.dine.repository.entity.CouponReceive;
import com.dine.repository.support.LambdaJpaRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CouponReceiveRepository extends LambdaJpaRepository<CouponReceive, Long> {

    Page<CouponReceive> findByCouponIdAndStatus(Long couponId, Integer status, Pageable pageable);

    CouponReceive findByCouponIdAndBuyerId(Long couponId, String userId);

    List<CouponReceive> findByBuyerIdAndStatus(String userId, Integer status);
}
