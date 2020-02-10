package com.dine.service.impl;

import com.dine.entity.Coupon;
import com.dine.entity.CouponReceive;
import com.dine.form.CouponForm;
import com.dine.repository.CouponLogsRepository;
import com.dine.repository.CouponReceiveRepository;
import com.dine.repository.CouponRepository;
import com.dine.service.CouponService;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

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
    public Long addCoupon(CouponForm couponForm) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Coupon coupon = new Coupon();
        coupon.setCreateTime(new Date());
        try {
            coupon.setEndTime(simpleDateFormat.parse(couponForm.getCouponEndTime()));
            coupon.setStartTime(simpleDateFormat.parse(couponForm.getCouponStartTime()));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        coupon.setFullMoney(couponForm.getFullMoney());
        coupon.setMoney(couponForm.getCouponMoney());
        coupon.setName(couponForm.getCouponName());
        coupon.setNumber(couponForm.getCouponNumber());
        coupon.setStatus(1);
        Coupon save = couponRepository.save(coupon);
        return save.getId();
    }

    @Override
    public List<Coupon> findCoupons() {
        return couponRepository.findByStatusAndEndTimeAfter(1, new Date());
    }


    @Override
    public List<Coupon> findMineCoupon(String userId) {
        List<CouponReceive> couponsRev = couponReceiveRepository.findByBuyerIdAndStatus(userId, 0);
        if (CollectionUtils.isEmpty(couponsRev)) {
            return Lists.newArrayList();
        }

        List<Coupon> coupons = new ArrayList<>();

        for (CouponReceive couponReceive : couponsRev) {
            Optional<Coupon> couponOptional = couponRepository.findById(couponReceive.getCouponId());
            couponOptional.ifPresent(coupons::add);
        }

        return coupons;
    }

    @Override
    public Long receiveCoupon(Long couponId, String userId) {
        Optional<Coupon> couponOpt = couponRepository.findById(couponId);
        if (couponOpt.isPresent()) {
            Coupon coupon = couponOpt.get();
            CouponReceive couponReceive = new CouponReceive();
            couponReceive.setBuyerId(userId);
            couponReceive.setCouponId(couponId);
            couponReceive.setCouponMoney(coupon.getMoney());
            couponReceive.setFullMoney(coupon.getFullMoney());
            couponReceive.setStatus(0);
            couponReceive.setCreateTime(new Date());
            CouponReceive save = couponReceiveRepository.save(couponReceive);
            return save.getId();
        } else {
            log.warn("coupon not exist");
            return -1L;
        }
    }
}
