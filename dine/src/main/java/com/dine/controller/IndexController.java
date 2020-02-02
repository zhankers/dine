package com.dine.controller;

import org.springframework.beans.factory.annotation.Value;
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
        return new ModelAndView("common/nav");
    }

    @GetMapping("/test2")
    public ModelAndView test2() {
        return new ModelAndView("order/detail");
    }
}
