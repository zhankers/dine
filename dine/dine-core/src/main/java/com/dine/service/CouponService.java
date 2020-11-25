package com.dine.service;


import com.dine.repository.entity.Coupon;
import com.dine.model.form.CouponForm;

import java.util.List;

public interface CouponService {

    Long addCoupon(CouponForm couponForm);

    List<Coupon> findCoupons();

    List<Coupon> findMineCoupon(String userId);

    Long receiveCoupon(Long couponId, String userId);

    Long usesedCoupon(Long couponId, String userId);
}
