package com.dine.repository;


import com.dine.repository.entity.Coupon;
import com.dine.repository.support.LambdaJpaRepository;

import java.util.Date;
import java.util.List;

public interface CouponRepository extends LambdaJpaRepository<Coupon, Long> {
    List<Coupon> findByStatusAndEndTimeAfter(Integer status, Date endtime);
}
