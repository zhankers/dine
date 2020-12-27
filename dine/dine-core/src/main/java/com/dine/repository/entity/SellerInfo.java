package com.dine.repository.entity;

import lombok.Data;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.util.Date;

/**
 *
 */
@Data
@Entity
@DynamicUpdate
@DynamicInsert
public class SellerInfo {

    @Id
    @GeneratedValue
    private Long sellerId;

    private String username;

    private String password;

    private String salt;

    private String token;

    private String phone;

    private Date createTime;

    private Date updateTime;
}
