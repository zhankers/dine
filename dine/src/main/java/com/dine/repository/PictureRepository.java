package com.dine.repository;

import com.dine.entiry.Picture;

import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 */
public interface PictureRepository extends JpaRepository<Picture, Integer> {
    Picture findByPicId(Integer picId);
}
