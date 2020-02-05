package com.dine.repository;

import com.dine.entity.User;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;


/**
 *
 */
public interface UserRepository extends JpaRepository<User, String> {
    User findByOpenid(String openid);

    User findByPhoneAndPassword(String phone, String password);

    @Transactional
    @Modifying
    @Query(value = "update user set token = :token where openid = :openid", nativeQuery = true)
    Integer updateTokenByOpenid(@Param("openid") String openid, @Param("token") String token);

}
