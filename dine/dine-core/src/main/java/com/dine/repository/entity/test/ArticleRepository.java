package com.dine.repository.entity.test;

import com.dine.repository.entity.test.one2many.Article;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ArticleRepository extends JpaRepository<Article, Long> {
}
