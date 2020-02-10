package com.dine.entity;

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
@DynamicInsert
@DynamicUpdate
public class Coupon {

    @Id
    @GeneratedValue
    private Long id;
    /**
     * 所属类型,1为满减
     */
    private Integer type;
    /**
     * 优惠券名称
     */
    private String name;
    /**
     *
     */
    private Integer number;
    /**
     * 优惠券开始时间
     */
    private Date startTime;
    /**
     * 优惠券结束时间
     */
    private Date endTime;
    /**
     * 优惠券金额，用整数，固定值目前。
     */
    private BigDecimal money;
    /**
     * 状态，0表示未开始，1表示进行中，-1表示结束
     */
    private Integer status;
    /**
     * 优惠券的说明
     */
    private String remarks;

    private Date createTime;
    /**
     * 金额满
     */
    private BigDecimal fullMoney;
}
