package com.dine.controller.test;

import com.dine.repository.entity.test.ArticleRepository;
import com.dine.repository.entity.test.AuthorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.HandlerMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
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

    @GetMapping("/{service{Name/v1/{id}")
    public ResponseEntity test2(@PathVariable String id, HttpServletRequest request) {

        // System.out.println(one);

        return ResponseEntity.ok("service{Name: " + id);
    }

    public static void main(String[] args) {
        AMatcher matcher = new AMatcher();
        String requestPath = "/v1/dine/{uuid}/aa/{id}/bb/{uuid}";
        String realPath = "/v1/dine/123445/aa/77777/bb/1";

        String[] strings = matcher.tokenizePattern(requestPath);
        System.out.println(Arrays.toString(strings));

        System.out.println(matcher.match(requestPath, realPath));
        Map<String, String> result = matcher.extractUriTemplateVariables(requestPath, realPath);
        System.out.println(result);
        String replace = requestPath;
        for (Map.Entry<String, String> entry : result.entrySet()) {
            replace = replace.replace("{" + entry.getKey() + "}", ".*");
        }
        System.out.println(replace);



        String requestPath2 = "/v1/dine/{uuid}/aa/{id}/bb";
        String requestPath3 = "/v1/{di{ne/{page}/aa/{id}/bb";
        String s = requestPath2.replaceAll("/\\{.*?}/", "/.*/");
        System.out.println(s);
        String s2 = requestPath3.replaceAll("/\\{.*?[^/]}/", "/.*/");
        System.out.println(s2);
        System.out.println(s.equals(s2));

        String s1 = "\\\\[([^\\\\[\\\\]]+)\\\\]";


    }

}
