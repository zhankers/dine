package com.dine.controller;

import com.dine.repository.entity.Coupon;
import com.dine.model.form.CouponForm;
import com.dine.repository.CouponRepository;
import com.dine.service.CouponService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Map;


/**
 * 优惠券模板表
 *
 * @author administrator
 */
@Controller
@RequestMapping("/seller/coupon")
public class SellerCouponController {
 
    private static final Logger logger = LoggerFactory.getLogger(SellerCouponController.class);
 
    @Autowired
    private CouponService couponService;

    @Autowired
    private CouponRepository couponRepository;
 
    /**
     * 新增优惠券
     */
    @PostMapping(value = "/save")
    public ModelAndView toAddCoupon(@Valid CouponForm couponForm, BindingResult bindingResult,
                                    Map<String, Object> map,
                                    HttpServletRequest request) {
        if (bindingResult.hasErrors()) {
            map.put("msg", bindingResult.getFieldError().getDefaultMessage());
            map.put("url", request.getContextPath()+"/seller/coupon/index");
            return new ModelAndView("common/error", map);
        }
        couponService.addCoupon(couponForm);
        map.put("url", request.getContextPath()+"/seller/coupon/list");
        return new ModelAndView("common/success", map);
    }
 
    /**
     * 分页查询优惠卷,可以根据优惠卷名称和有效期进行筛选
     * @param couponName
     * @param couponStartPeriod
     * @param couponEndPeriod
     * @param pageNum
     * @param pageSize
     * @return RestResponse
     */
    @GetMapping("/list")
    public ModelAndView pagedQueryByCoupon(@RequestParam(required = false) String couponName,
                                  @RequestParam(required = false) String couponStartPeriod,
                                  @RequestParam(required = false) String couponEndPeriod,
                                  Map<String, Object> map,
                                  @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                  @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize) {

        PageRequest request = PageRequest.of(pageNum - 1, pageSize);
        Page<Coupon> couponsPage = couponRepository.findAll(request);
        map.put("couponPage", couponsPage);
        map.put("currentPage", pageNum);
        map.put("size", pageSize);
        return new ModelAndView("coupon/list", map);
    }
 


    /**
     * 根据优惠卷id 查询表头信息
     */
    @RequestMapping("/index")
    public ModelAndView index(@RequestParam(required = false) Long couponId, Map<String, Object> map) {
        if (couponId != null) {
            Coupon coupon = couponRepository.findById(couponId).orElse(null);
            map.put("coupon", coupon);
        }

        return new ModelAndView("coupon/index", map);
    }

 
}