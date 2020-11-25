package com.dine.service.impl;

import com.dine.repository.entity.User;
import com.dine.repository.UserRepository;
import com.dine.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository repository;

    @Override
    public User findByOpenid(String openid) {
        return repository.findByOpenid(openid);
    }
}
