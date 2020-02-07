package com.dine.utils;

import com.dine.vo.RestResponse;


public class ResultVOUtil {

    public static RestResponse success(Object object) {
        RestResponse restResponse = new RestResponse();
        restResponse.setData(object);
        restResponse.setCode(0);
        restResponse.setMsg("成功");
        return restResponse;
    }

    public static RestResponse success() {
        return success(null);
    }

    public static RestResponse error(Integer code, String msg) {
        RestResponse restResponse = new RestResponse();
        restResponse.setCode(code);
        restResponse.setMsg(msg);
        return restResponse;
    }
}
