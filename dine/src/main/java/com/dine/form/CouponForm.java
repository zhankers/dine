package com.dine.form;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.math.BigDecimal;
import java.util.Date;

@Data
public class CouponForm {
    private String couponName;
    private Integer couponSendType;
    private Integer couponSettingType;
    private BigDecimal couponMoney;
    private Integer couponNumber;

    private Date couponStartTime;
    private Date couponEndTime;
    private Date couponStartPeriod;
    private Date couponEndPeriod;
    private String couponRemarks;
    @NotBlank
    private String leafClassId;
}
