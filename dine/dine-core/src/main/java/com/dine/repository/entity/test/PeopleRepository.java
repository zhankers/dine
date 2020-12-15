package com.dine.repository.entity.test;

import com.dine.repository.entity.test.one2one.People;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PeopleRepository extends JpaRepository<People, Long> {
}
