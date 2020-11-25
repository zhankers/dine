package com.dine.repository;

import com.dine.repository.entity.OrderMaster;
import com.dine.repository.support.LambdaJpaRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 *
 */
public interface OrderMasterRepository extends LambdaJpaRepository<OrderMaster, String> {

    Page<OrderMaster> findByBuyerOpenid(String buyerOpenid, Pageable pageable);

    List<OrderMaster> findByBuyerOpenidAndOrderStatus(String buyerOpenid, Integer orderStatus);
}
