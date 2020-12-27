package com.dine.controller.test;

import com.dine.repository.entity.test.ArticleRepository;
import com.dine.repository.entity.test.AuthorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.HandlerMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class TestController {

    @Autowired
    private ArticleRepository articleRepository;
    @Autowired
    private AuthorRepository authorRepository;



    @GetMapping("/{serviceName}/**")
    public ResponseEntity test(@PathVariable String serviceName, HttpServletRequest request) {

        Object attribute = request.getAttribute(HandlerMapping.BEST_MATCHING_HANDLER_ATTRIBUTE);
        String urlMapping = (String)request.getAttribute(HandlerMapping.BEST_MATCHING_PATTERN_ATTRIBUTE);
        // Author one = authorRepository.getOne(1L);
        String requestURI = request.getRequestURI();

        // System.out.println(one);


        return ResponseEntity.ok(serviceName);
    }

    public static void main(String[] args) {
        AntPathMatcher matcher = new AntPathMatcher();
        String requestPath = "/v1/dine/{uuid}/aa/{id}/bb";
        System.out.println(matcher.match(requestPath, "/v1/dine/123445/aa/77777/bb"));
        Map<String, String> result = matcher.extractUriTemplateVariables(requestPath, "/v1/dine/123445/aa/77777/bb");
        System.out.println(result);
    }

}
