package com.dine.repository;

import com.dine.entity.Address;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AddressRepository extends JpaRepository<Address, Integer> {
    List<Address> findByUserId(String userId);

    Address findByUserIdAndUserNameAndTelNumberAndProvinceNameAndCityNameAndCountyNameAndDetailInfo(
            String userId, String userName, String telNumber, String proviceName, String cityName, String countyName, String detailIfo
    );

    List<Address> findByUserIdAndActive(String userId, Integer active);
}
