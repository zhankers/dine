package com.dine.repository;

import com.dine.repository.entity.Comment;
import com.dine.repository.support.LambdaJpaRepository;

import java.util.List;

public interface CommentRepository extends LambdaJpaRepository<Comment, Integer> {
    List<Comment> findAllByOpenid(String openid);
}
