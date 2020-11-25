package com.dine.repository;

import com.dine.repository.entity.Picture;
import com.dine.repository.support.LambdaJpaRepository;

/**
 *
 */
public interface PictureRepository extends LambdaJpaRepository<Picture, Integer> {
    Picture findByPicId(Integer picId);
}
