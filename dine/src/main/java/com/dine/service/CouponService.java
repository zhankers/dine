package com.dine.service;


import com.dine.entity.Coupon;
import com.dine.form.CouponForm;

import java.util.List;

public interface CouponService {

    Long addCoupon(CouponForm couponForm);

    List<Coupon> findCoupons();

    List<Coupon> findMineCoupon(String userId);

    Long receiveCoupon(Long couponId, String userId);

    Long usesedCoupon(Long couponId, String userId);
}
