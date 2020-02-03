package com.dine.repository;

import com.dine.entity.User;

import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 */
public interface UserRepository extends JpaRepository<User, String> {
    User findByOpenid(String openid);
}
