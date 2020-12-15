package com.dine.repository.entity.test.one2one;


import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_address")
public class Address2 {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;//id
    @Column(name = "phone", nullable = true, length = 11)
    private String phone;//手机
    @Column(name = "zipcode", nullable = true, length = 6)
    private String zipcode;//邮政编码
    @Column(name = "address", nullable = true, length = 100)
    private String address;//地址
    //如果不需要根据Address级联查询People，可以注释掉
    @OneToOne(mappedBy = "address", cascade = {CascadeType.MERGE, CascadeType.REFRESH}, optional = false)
    private People people;
}