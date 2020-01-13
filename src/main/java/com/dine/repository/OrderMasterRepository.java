package com.dine.repository;

import com.dine.entiry.OrderMaster;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 *
 */
public interface OrderMasterRepository extends JpaRepository<OrderMaster, String> {

    Page<OrderMaster> findByBuyerOpenid(String buyerOpenid, Pageable pageable);

    List<OrderMaster> findByBuyerOpenidAndOrderStatus(String buyerOpenid, Integer orderStatus);
}
