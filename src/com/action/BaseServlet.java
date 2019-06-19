package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.model.Admin;
import com.model.Judge;
import com.model.Member;
import com.model.Team;

public class BaseServlet extends HttpServlet {

    private static final long serialVersionUID = -7087912729782679556L;

    protected void rendJson(HttpServletResponse resp, Object obj) {
        resp.setHeader("Content-type", "application/json;charset=utf-8");
        PrintWriter out = null;
        try {
            out = resp.getWriter();

            out.print(JSONObject.toJSONString(obj));
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (null != out) {
                out.close();
            }
        }
    }

    protected String getParam(HttpServletRequest request, String name) {
        // try {
        // String s = request.getParameter(name);
        // if (StringUtils.isBlank(s)) {
        // return "";
        // }
        // return new String(s.getBytes("ISO-8859-1"), "utf-8");
        // } catch (UnsupportedEncodingException e) {
        // }
        return request.getParameter(name);
    }

    protected Admin getAdmin(HttpServletRequest request) {
        return (Admin) request.getSession().getAttribute("user");
    }
    
    protected Team getTeam(HttpServletRequest request) {
    	return (Team) request.getSession().getAttribute("team");
    }

}
