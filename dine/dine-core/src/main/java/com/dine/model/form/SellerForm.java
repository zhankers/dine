package com.dine.model.form;

import lombok.Data;


@Data
public class SellerForm {

    private String username;
    private String password;
    private String phone;
    private Integer sellerId;
}
