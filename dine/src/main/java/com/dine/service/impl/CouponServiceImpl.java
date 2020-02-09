package com.dine.service.impl;

import com.dine.form.CouponForm;
import com.dine.repository.CouponLogsRepository;
import com.dine.repository.CouponReceiveRepository;
import com.dine.repository.CouponRepository;
import com.dine.service.CouponService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class CouponServiceImpl implements CouponService {

    @Autowired
    private CouponRepository couponRepository;
    @Autowired
    private CouponReceiveRepository couponReceiveRepository;
    @Autowired
    private CouponLogsRepository couponLogsRepository;

    @Override
    public Integer addCoupon(CouponForm couponForm) {

        return 0;
    }
}
