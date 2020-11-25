package com.dine.repository.entity;


import lombok.Data;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Data
@DynamicUpdate
@DynamicInsert
public class CouponLogs {

    @Id
    @GeneratedValue
    private Long id;

    private Long buyerId;
    /**
     * 优惠券id
     */
    private Long couponReceiveId;
    /**
     * 订单号
     */
    private String orderNumber;
    /**
     * 原订单金额
     */
    private BigDecimal orderOriginalAmount;
    /**
     * 优惠券的金额
     */
    private BigDecimal couponAmount;
    /**
     * 抵扣优惠券之后的订单金额
     */
    private BigDecimal orderFinalAmount;
    /**
     * 领取时间
     */
    private Date createTime;
    /**
     * 日志状态: 默认为0，支付回调成功后为1
     */
    private Integer status;
}
