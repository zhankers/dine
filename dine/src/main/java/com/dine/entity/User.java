package com.dine.entity;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.Data;

/**
 *
 * 用户信息表
 */
@Data
@Entity
@DynamicUpdate
@DynamicInsert
public class User {

    @Id
    @GeneratedValue
    private int id;
    private String username;
    private String password;
    private String phone;
    private String openid;

    private String token;
    private String avatarUrl;
    private String zhuohao;
    private String renshu;

    private String city;
    private Integer gender;
    private String province;
    private String country;

    private Date createTime;
    private Date updateTime;
}
