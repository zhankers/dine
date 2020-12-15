package com.dine.repository.entity.test;

import com.dine.repository.entity.test.many2many.Authority;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthorityRepository extends JpaRepository<Authority, Long> {
}
