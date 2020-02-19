package com.dine.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 商品详情
 */
@Data
public class ProductInfoVO {

    @JsonProperty("id")
    private String productId;

    @JsonProperty("name")
    private String productName;

    @JsonProperty("price")
    private BigDecimal productPrice;

    /** 库存. */
    @JsonProperty("stock")
    private Integer productStock;

    @JsonProperty("desc")
    private String productDescription;

    @JsonProperty("icon")
    private String productIcon;

    @JsonProperty("taste")
    private Integer taste;

    @JsonProperty("sales")
    private Integer sales;


}
