package com.vo;

import com.alibaba.fastjson.annotation.JSONField;

public class Message {

    @JSONField(name = "success")
    private Boolean isSuccess;
    @JSONField(name = "msg")
    private Object message;

    public Message() {
    }

    public Message(Boolean isSuccess, Object message) {
        this.isSuccess = isSuccess;
        this.message = message;
    }

    public static Message fail(Object message) {
        return new Message(false, message);
    }

    public static Message success(Object message) {
        return new Message(true, message);
    }

    public Boolean getIsSuccess() {
        return isSuccess;
    }

    public void setIsSuccess(Boolean isSuccess) {
        this.isSuccess = isSuccess;
    }

    public Object getMessage() {
        return message;
    }

    public void setMessage(Object message) {
        this.message = message;
    }

}
