package com.lhm.common;

import lombok.Data;

import java.io.Serializable;

@Data
public class Result implements Serializable {
    private int status;     //0 成功 -1失败
    private String message; //返回信息
    private Object data;   //返回数据

    public static Result success(String msg, Object data) {
        Result result = new Result();
        result.status = 0;
        result.message = msg;
        result.data = data;
        return result;
    }

    public static Result fail(String msg) {
        Result result = new Result();
        result.status = -1;
        result.message = msg;
        result.data = null;
        return result;
    }
}
