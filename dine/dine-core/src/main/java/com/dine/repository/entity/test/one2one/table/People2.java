package com.dine.repository.entity.test.one2one.table;

import com.dine.repository.entity.test.one2one.Address2;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import java.sql.Timestamp;

@Entity
@Table(name = "tbl_people2")
public class People2 {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;//id
    @Column(name = "name", nullable = true, length = 20)
    private String name;//姓名
    @Column(name = "sex", nullable = true, length = 1)
    private String sex;//性别
    @Column(name = "birthday", nullable = true)
    private Timestamp birthday;//出生日期
    @OneToOne(cascade= CascadeType.ALL)//People是关系的维护端
    @JoinTable(name = "people_address",
            joinColumns = @JoinColumn(name="people_id"),
            inverseJoinColumns = @JoinColumn(name = "address_id"))//通过关联表保存一对一的关系
    private Address2 address;//地址
}