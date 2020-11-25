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
public class CouponReceive {

    @Id
    @GeneratedValue
    private Long id;

    private String buyerId;
    /**
     * 优惠券编号
     */
    private Long couponId;
    /**
     * 券额
     */
    private BigDecimal couponMoney;
    /**
     * 领取时间
     */
    private Date createTime;
    /**
     * 金额满
     */
    private BigDecimal fullMoney;
    /**
     * 状态，1为已使用，0为已领取未使用，-1为已过期
     */
    private Integer status;
}
