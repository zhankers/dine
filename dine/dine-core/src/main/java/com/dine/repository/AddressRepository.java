package com.dine.repository;

import com.dine.repository.entity.Address;
import com.dine.repository.support.LambdaJpaRepository;

import java.util.List;

public interface AddressRepository extends LambdaJpaRepository<Address, Integer> {
    List<Address> findByUserId(String userId);

    Address findByUserIdAndUserNameAndTelNumberAndProvinceNameAndCityNameAndCountyNameAndDetailInfo(
            String userId, String userName, String telNumber, String proviceName, String cityName, String countyName, String detailIfo
    );

    List<Address> findByUserIdAndActive(String userId, Integer active);
}
