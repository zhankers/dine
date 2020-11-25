package com.dine.controller;

import com.dine.repository.entity.CouponReceive;
import com.dine.repository.entity.ProductCategory;
import com.dine.repository.entity.ProductInfo;
import com.dine.enums.ResultEnum;
import com.dine.exception.SellException;
import com.dine.repository.CouponReceiveRepository;
import com.dine.service.CategoryService;
import com.dine.service.CouponService;
import com.dine.service.ProductService;
import com.dine.utils.JwtUtil;
import com.dine.model.vo.ProductInfoVO;
import com.dine.model.vo.ProductVO;
import com.dine.model.vo.RestResponse;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 买家商品
 *
 */
@RestController
@RequestMapping("/buyer/product")
public class BuyerProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;
    @Autowired
    private CouponReceiveRepository receiveRepository;

    @Autowired
    private CouponService couponService;

    @GetMapping("/list")
    public RestResponse list(@RequestParam(name = "productName", required = false) String productName,
                             @RequestParam(name = "productPrice", required = false) String productPrice,
                             @RequestParam(name = "taste", required = false) Integer taste,
                             @RequestParam(name = "categoryType", required = false) Integer categoryType) {
        //1. 查询所有的上架商品
        List<ProductInfo> productInfoList = productService.findUpAllByConditions(productName, productPrice, taste, categoryType);

        //2. 查询类目(一次性查询)
//        List<Integer> categoryTypeList = new ArrayList<>();
        //传统方法
//        for (ProductInfo productInfo : productInfoList) {
//            categoryTypeList.add(productInfo.getCategoryType());
//        }
        //精简方法(java8, lambda)
        List<Integer> categoryTypeList = productInfoList.stream()
                .map(e -> e.getCategoryType())
                .collect(Collectors.toList());
        List<ProductCategory> productCategoryList = categoryService.findByCategoryTypeIn(categoryTypeList);

        //3. 数据拼装



        List<ProductVO> productVOList = new ArrayList<>();
        for (ProductCategory productCategory: productCategoryList) {
            ProductVO productVO = new ProductVO();
            productVO.setCategoryType(productCategory.getCategoryType());
            productVO.setCategoryName(productCategory.getCategoryName());

            List<ProductInfoVO> productInfoVOList = new ArrayList<>();
            for (ProductInfo productInfo: productInfoList) {
                if (productInfo.getCategoryType().equals(productCategory.getCategoryType())) {
                    ProductInfoVO productInfoVO = new ProductInfoVO();
                    BeanUtils.copyProperties(productInfo, productInfoVO);
                    productInfoVOList.add(productInfoVO);
                }
            }
            productInfoVOList.sort(Comparator.comparing(ProductInfoVO::getSales).reversed());
            productVO.setProductInfoVOList(productInfoVOList);
            productVOList.add(productVO);
        }

        return RestResponse.success(productVOList);
    }

    @GetMapping("/coupon/list")
    public RestResponse getCoupons() {
        return RestResponse.success(couponService.findCoupons());
    }

    @PostMapping("/coupon/receive")
    public RestResponse receiveCoupon(Long couponId, @RequestHeader("token") String token) {
        Map<String, Object> map = new HashMap<>();
        if (StringUtils.isEmpty(token)) {
            throw new SellException(ResultEnum.TOKEN_ILLEGAL);
        }
        String openid = JwtUtil.getUserId(token);
        CouponReceive couponReceive = receiveRepository.findByCouponIdAndBuyerId(couponId, openid);
        if (couponReceive != null) {
            return RestResponse.failure(2, "购物券已经领取");
        }
        Long id = couponService.receiveCoupon(couponId, openid);
        map.put("id", id);
        return RestResponse.success(map);
    }

    @GetMapping("/mine-coupon/list")
    public RestResponse getMineCoupons(@RequestHeader("token") String token) {
        if (StringUtils.isEmpty(token)) {
            throw new SellException(ResultEnum.TOKEN_ILLEGAL);
        }
        String openid = JwtUtil.getUserId(token);
        return RestResponse.success(couponService.findMineCoupon(openid));
    }
}
