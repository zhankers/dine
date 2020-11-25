package com.dine.model.form;

import lombok.Data;

import javax.validation.constraints.NotEmpty;

@Data
public class AddressForm {

    private String userId;
    @NotEmpty
    private String userName;
    @NotEmpty
    private String telNumber;

    private String nationalCode;
    private String postalCode;
    @NotEmpty
    private String provinceName;
    @NotEmpty
    private String cityName;
    @NotEmpty
    private String countyName;
    @NotEmpty
    private String detailInfo;
}
