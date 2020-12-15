package com.dine.repository.entity.test;

import com.dine.repository.entity.test.one2many.Author;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthorRepository extends JpaRepository<Author, Long> {
}
