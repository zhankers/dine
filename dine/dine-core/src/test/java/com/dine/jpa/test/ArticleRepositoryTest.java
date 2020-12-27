package com.dine.jpa.test;

import com.dine.repository.entity.test.ArticleRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ArticleRepositoryTest {
    @Autowired
    private ArticleRepository articleRepository;

    @Test
    public void testFind() {
//        List<Article> allByAuthor = articleRepository.findAllByAuthor(1L);
//        System.out.println(allByAuthor);
    }
}
