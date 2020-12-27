//package com.dine.admin.security;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;
//import org.springframework.util.CollectionUtils;
//
//@Service("userDetailsService")
//public class UserDetailsServiceImpl implements UserDetailsService {
//
//    @Autowired
//    private UserMapper userMapper;
//
//    /***
//     * 根据账号获取用户信息
//     * @param username:
//     * @return: org.springframework.security.core.userdetails.UserDetails
//     */
//    @Override
//    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//        // 从数据库中取出用户信息
//        List<User> userList = userMapper.selectList(new EntityWrapper<User>().eq("username", username));
//        User user;
//        // 判断用户是否存在
//        if (!CollectionUtils.isEmpty(userList)){
//            user = userList.get(0);
//        } else {
//            throw new UsernameNotFoundException("用户名不存在！");
//        }
//        // 返回UserDetails实现类
//        return new SecurityUser(user);
//    }
//}