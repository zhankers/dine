package com.dine.controller;

import com.dine.vo.RestResponse;
import com.dine.dto.OrderDTO;
import com.dine.enums.OrderStatusEnum;
import com.dine.enums.ResultEnum;
import com.dine.exception.SellException;
import com.dine.service.OrderService;
import com.dine.service.impl.PayService;
import com.dine.utils.ResultVOUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

/**
 * 支付
 */
@RestController
@RequestMapping("/pay")
@Slf4j
public class PayController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private PayService payService;

    @GetMapping("/goPay")
    public RestResponse<Boolean> goPay(@RequestParam("orderId") String orderId) {
        //1. 查询订单
        OrderDTO orderDTO = orderService.findOne(orderId);
        if (orderDTO == null) {
            throw new SellException(ResultEnum.ORDER_NOT_EXIST);
        }

        //2. 发起支付
        OrderDTO orderDTO1 = payService.goPay(orderDTO);
        if (!orderDTO.getOrderStatus().equals(OrderStatusEnum.NEW_PAYED.getCode())) {
            log.error("【取消订单】订单状态不正确,  orderStatus={}", orderDTO1.getOrderStatus());
            throw new SellException(ResultEnum.ORDER_STATUS_ERROR);
        }
        return ResultVOUtil.success(true);
    }


}
