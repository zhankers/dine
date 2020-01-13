package com.dine.service.impl;

import com.dine.entiry.SellerInfo;
import com.dine.repository.SellerInfoRepository;
import com.dine.service.SellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 */
@Service
public class SellerServiceImpl implements SellerService {

    @Autowired
    private SellerInfoRepository repository;

    @Override
    public SellerInfo findSellerInfoByPhone(String phone) {
        return repository.findByPhone(phone);
    }
}
