package com.dine.repository;

import com.dine.repository.entity.OrderDetail;
import com.dine.repository.support.LambdaJpaRepository;

import java.util.List;


public interface OrderDetailRepository extends LambdaJpaRepository<OrderDetail, String> {

    List<OrderDetail> findByOrderId(String orderId);
}
