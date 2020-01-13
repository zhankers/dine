package com.dine.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * desc:验证项目能不能运行起来
 */
@RestController
public class HelloController {

    @GetMapping("/")
    public String hello() {
        return "项目可以正常的跑起来了";
    }
}
