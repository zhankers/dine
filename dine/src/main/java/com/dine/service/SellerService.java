package com.dine.service;

import com.dine.entity.SellerInfo;

/**
 * 卖家端
 *
 */
public interface SellerService {

    /**
     * 通过openid查询卖家端信息
     * @return
     */
    SellerInfo findSellerInfoByPhone(String phone);
}
