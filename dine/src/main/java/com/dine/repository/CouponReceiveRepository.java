package com.dine.repository;

import com.dine.entity.CouponReceive;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CouponReceiveRepository extends JpaRepository<CouponReceive, Long> {

    Page<CouponReceive> findByCouponIdAndStatus(Long couponId, Integer status, Pageable pageable);

    CouponReceive findByCouponIdAndBuyerId(Long couponId, String userId);

    List<CouponReceive> findByBuyerIdAndStatus(String userId, Integer status);
}
