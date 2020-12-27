package com.dine.repository.entity.test.one2many;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Data
@Entity
@Table(name = "tbl_author")
public class Author {
    @Id // 主键
    @GeneratedValue(strategy = GenerationType.IDENTITY) // 自增长策略
    private Long id; //id

    @Size(min=2, max=20)
    @Column(nullable = false, length = 20)
    private String name;//姓名
    // @OneToMany(mappedBy = "author",cascade= CascadeType.ALL,fetch= FetchType.LAZY)
    //级联保存、更新、删除、刷新;延迟加载。当删除用户，会级联删除该用户的所有文章
    //拥有mappedBy注解的实体类为关系被维护端
     //mappedBy="author"中的author是Article中的author属性
    // private List<Article> articleList;//文章列表
}