package com.dine.model.form;


import lombok.Data;

import javax.validation.constraints.NotEmpty;


@Data
public class UserForm {


    /**
     * 买家姓名
     */
    @NotEmpty(message = "姓名必填")
    private String username;

    /**
     * 买家手机号
     */
    private String phone;


    /**
     * 买家微信openid
     */
    // @NotEmpty(message = "openid必填")
    private String openid;

    private String token;
    private String avatarUrl;
    private String city;
    private Integer gender;
    private String province;
    private String country;

    private String zhuohao;
    private String renshu;

    private String code;
    private String appId;
    private String secret;
}
