package com.dine.service;

import com.dine.entity.User;

/**
 * 用户端
 *
 */
public interface UserService {

    /**
     * 通过openid查询用户信息
     *
     * @param openid
     * @return
     */
    User findByOpenid(String openid);
}
