package com.dine.repository;


import com.dine.entity.Coupon;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Date;
import java.util.List;

public interface CouponRepository extends JpaRepository<Coupon, Long> {
    List<Coupon> findByStatusAndEndTimeAfter(Integer status, Date endtime);
}
