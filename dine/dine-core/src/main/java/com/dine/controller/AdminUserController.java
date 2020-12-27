package com.dine.controller;

import com.dine.config.ProjectUrlConfig;
import com.dine.constant.CookieConstant;
import com.dine.constant.RedisConstant;
import com.dine.enums.ResultEnum;
import com.dine.exception.SellException;
import com.dine.model.form.SellerForm;
import com.dine.repository.SellerInfoRepository;
import com.dine.repository.entity.SellerInfo;
import com.dine.utils.CookieUtil;
import com.dine.utils.JwtUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/admin")
@Slf4j
@RequiredArgsConstructor
public class AdminUserController {

    final SellerInfoRepository repository;

    final ProjectUrlConfig projectUrlConfig;

    @PostMapping("/loginAdmin")
    public String loginAdmin(@RequestParam("phone") String phone,
                             @RequestParam("password") String password,
                             HttpServletRequest request,
                             HttpServletResponse response) throws IOException {
        SellerInfo sellerInfo = repository.findByPhone(phone);
        log.info("商家信息={}", sellerInfo);
        if (sellerInfo != null && sellerInfo.getPassword().equals(password)) {
            String token = JwtUtil.sign(String.valueOf(sellerInfo.getSellerId()));

            log.info("登录成功的token={}", token);
            Integer expire = RedisConstant.EXPIRE;
            //3. 设置token至cookie
            CookieUtil.set(response, CookieConstant.TOKEN, token, expire);
            response.sendRedirect(request.getContextPath() + "/seller/order/list");
            return "LOGIN SUCCESS";
        } else {
            throw new SellException(ResultEnum.LOGIN_FAIL);
        }
    }

    @GetMapping("/regAdmin")
    public String registerAdmin(@RequestParam("phone") String phone,
                                @RequestParam("username") String username,
                                @RequestParam("password") String password,
                                @RequestParam("repassword") String confirmPwd,
                                HttpServletRequest request,
                                HttpServletResponse response) {

        SellerInfo sellerInfo = repository.findByPhone(phone);
        log.info("商家信息={}", sellerInfo);
        if (sellerInfo != null || password == null || !password.equals(confirmPwd)) {
            throw new SellException(ResultEnum.REG_FAIL);
        } else {
            sellerInfo = new SellerInfo();
            sellerInfo.setPhone(phone);
            sellerInfo.setPassword(password);
            sellerInfo.setUsername(username);
            sellerInfo.setCreateTime(new Date());

            SellerInfo result = repository.save(sellerInfo);

            // request.getSession().setAttribute("ADMIN_USER_ID", result.getSellerId());

            return "注册成功";
        }
    }

    @GetMapping("/logout")
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, Map<String, Object> map) {
        //1. 从cookie里查询
        Cookie cookie = CookieUtil.get(request, CookieConstant.TOKEN);
        if (cookie != null) {
            //2. 清除cookie
            CookieUtil.set(response, CookieConstant.TOKEN, null, 0);
        }
        map.put("msg", ResultEnum.LOGOUT_SUCCESS.getMessage());
        map.put("url", projectUrlConfig.getContextPath()+ "/seller/order/list");
        return new ModelAndView("common/success", map);
    }

    /**
     * 页面相关
     */
    @GetMapping("/list")
    public ModelAndView list(Map<String, Object> map) {
        List<SellerInfo> categoryList = repository.findAll();
        map.put("categoryList", categoryList);
        return new ModelAndView("admin/list", map);
    }

    @GetMapping("/index")
    public ModelAndView index(@RequestParam(value = "sellerId", required = false) Long sellerId, Map<String, Object> map) {
        SellerInfo sellerInfo = repository.findBySellerId(sellerId);
        map.put("category", sellerInfo);

        return new ModelAndView("admin/index", map);
    }

    /**
     * 保存/更新
     */
    @PostMapping("/save")
    public ModelAndView save(@Valid SellerForm form, BindingResult bindingResult, Map<String, Object> map) {
        log.info("SellerForm={}", form);
        if (bindingResult.hasErrors()) {
            map.put("msg", bindingResult.getFieldError().getDefaultMessage());
            map.put("url", projectUrlConfig.getContextPath()+"/admin/index");
            return new ModelAndView("common/error", map);
        }
        SellerInfo sellerInfo = new SellerInfo();
        try {
            if (form.getSellerId() != null) {
                sellerInfo = repository.findBySellerId(form.getSellerId());
            }
            BeanUtils.copyProperties(form, sellerInfo);
            repository.save(sellerInfo);
        } catch (SellException e) {
            map.put("msg", e.getMessage());
            map.put("url", projectUrlConfig.getContextPath()+"/admin/index");
            return new ModelAndView("common/error", map);
        }

        map.put("url", projectUrlConfig.getContextPath()+"/admin/list");
        return new ModelAndView("common/success", map);
    }
}