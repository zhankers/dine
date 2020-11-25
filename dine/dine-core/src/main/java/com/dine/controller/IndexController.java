package com.dine.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class IndexController {


    @GetMapping("/")
    public ModelAndView hello() {
        return new ModelAndView("common/loginView");
    }

    @GetMapping("/test")
    public ModelAndView test() {
        return new ModelAndView("index");
    }

    @GetMapping("/test2")
    public ModelAndView test2() {
        return new ModelAndView("common/common");
    }

    @GetMapping("/test3")
    public ModelAndView test3() {
        return new ModelAndView("product/index2");
    }
}
