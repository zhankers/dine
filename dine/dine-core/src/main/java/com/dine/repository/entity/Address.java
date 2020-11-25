package com.dine.repository.entity;


import lombok.Data;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
@Data
@DynamicUpdate
@DynamicInsert
public class Address {

    @Id
    @GeneratedValue
    private Integer id;
    private String userId;
    @Column(name = "username")
    private String userName;
    private String telNumber;
    private String nationalCode;
    private String postalCode;
    private String provinceName;
    private String cityName;
    private String countyName;
    private String detailInfo;
    private Integer active;

}
