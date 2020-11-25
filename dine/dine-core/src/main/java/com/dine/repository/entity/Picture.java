package com.dine.repository.entity;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.Data;

/**
 *
 */
@Data
@Entity
@DynamicUpdate
@DynamicInsert
public class Picture {

    @Id
    @GeneratedValue
    private Integer picId;
    private String picUrl;
    private String picMessage;

    private Date createTime;
    private Date updateTime;
}
