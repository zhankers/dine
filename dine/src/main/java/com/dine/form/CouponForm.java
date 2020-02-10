package com.dine.form;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class CouponForm {
    private String couponName;
    private Integer couponSendType;
    private Integer couponSettingType;
    private BigDecimal couponMoney;
    private BigDecimal fullMoney;
    private Integer couponNumber;

//    @JsonDeserialize(using=DateJsonDeserializer.class)
//    @JsonSerialize(using = Date2StringSerializer.class)
    private String couponStartTime;
//    @JsonDeserialize(using=DateJsonDeserializer.class)
//    @JsonSerialize(using = Date2StringSerializer.class)
    private String couponEndTime;

    private String couponRemarks;

}
