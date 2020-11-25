package com.dine.model.vo;

import lombok.Data;

/**
 * http请求返回的最外层对象
 */
@Data
public class RestResponse<T> {

    /** 错误码. 0 成功  2 失败*/
    private Integer code;

    /** 提示信息. */
    private String msg;

    /** 具体内容. */
    private T data;

    public static <E> RestResponse success(E object) {
        RestResponse<E> restResponse = new RestResponse<>();
        restResponse.setData(object);
        restResponse.setCode(0);
        restResponse.setMsg("SUCCESS");
        return restResponse;
    }

    public static RestResponse success() {
        return success(null);
    }

    public static RestResponse failure(Integer code, String msg) {
        RestResponse restResponse = new RestResponse();
        restResponse.setCode(code);
        restResponse.setMsg(msg);
        return restResponse;
    }

    public static RestResponse error(Integer code, String msg) {
        RestResponse restResponse = new RestResponse();
        restResponse.setCode(code);
        restResponse.setMsg(msg);
        return restResponse;
    }
}
