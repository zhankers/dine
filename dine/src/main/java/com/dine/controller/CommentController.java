package com.dine.controller;

import com.dine.vo.ResultVO;
import com.dine.entiry.Comment;
import com.dine.entiry.OrderMaster;
import com.dine.dto.OrderDTO;
import com.dine.enums.OrderStatusEnum;
import com.dine.enums.ResultEnum;
import com.dine.exception.SellException;
import com.dine.repository.CommentRepository;
import com.dine.repository.OrderMasterRepository;
import com.dine.service.OrderService;
import com.dine.utils.ResultVOUtil;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * desc:评论相关
 */
@RestController
public class CommentController {

    @Autowired
    private CommentRepository repository;
    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderMasterRepository masterRepository;

    /**
     * 订单详情
     * @param openid
     * @param orderId
     * @param name
     * @param avatarUrl
     * @param content
     * @return
     */
    @PostMapping("/comment")
    public ResultVO<Comment> detail(@RequestParam("openid") String openid,
                                    @RequestParam("orderId") String orderId,
                                    @RequestParam("name") String name,
                                    @RequestParam("avatarUrl") String avatarUrl,
                                    @RequestParam("content") String content) {
        if (StringUtils.isEmpty(openid) || StringUtils.isEmpty(orderId)) {
            throw new SellException(ResultEnum.PARAM_ERROR);
        }
        //提交评论
        Comment comment = new Comment();
        comment.setName(name);
        comment.setAvatarUrl(avatarUrl);
        comment.setOpenid(openid);
        comment.setContent(content);
        Comment save = repository.save(comment);

        //修改订单状态
        OrderDTO orderDTO = orderService.findOne(orderId);
        orderDTO.setOrderStatus(OrderStatusEnum.COMMENT.getCode());
        OrderMaster orderMaster = new OrderMaster();
        BeanUtils.copyProperties(orderDTO, orderMaster);
        OrderMaster updateResult = masterRepository.save(orderMaster);
        return ResultVOUtil.success(save);
    }

    /**
     * 所有评论
     *
     * @return
     */
    @GetMapping("/commentList")
    public ResultVO<List<Comment>> commentList() {
        List<Comment> all = repository.findAll();
        return ResultVOUtil.success(all);
    }

    /**
     * 单个用户的所有评论
     *
     * @param openid
     * @return
     */
    @GetMapping("/userCommentList")
    public ResultVO<List<Comment>> userCommentList(@RequestParam("openid") String openid) {
        List<Comment> all = repository.findAllByOpenid(openid);
        return ResultVOUtil.success(all);
    }
}
