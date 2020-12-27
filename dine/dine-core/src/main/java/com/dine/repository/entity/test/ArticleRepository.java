package com.dine.repository.entity.test;

import com.dine.repository.entity.test.one2many.Article;
import com.dine.repository.entity.test.one2many.Author;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ArticleRepository extends JpaRepository<Article, Long> {
    List<Article> findAllByAuthor(Author authorId);
}
