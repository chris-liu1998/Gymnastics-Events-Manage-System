package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.db.QueryHelper;
import com.model.Sport;
import com.util.Constant;

@WebServlet("/sport")
public class SportServlet extends BaseServlet {

    private static final long serialVersionUID = -4145633972148380729L;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType(Constant.CONTENTTYPE);
        request.setCharacterEncoding(Constant.CHARACTERENCODING);
        String method = request.getParameter("method");
        if (method.equals("list")) {
            list(request, response);
        } else if (method.equals("add")) {
            add(request, response);
        } else if (method.equals("toupdate")) {
            toupdate(request, response);
        } else if (method.equals("update")) {
            update(request, response);
        } else if (method.equals("del")) {
            delete(request, response);
        }
    }

    private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = getParam(request, "keyword");
        String sql = "select * from sport where 1=1";
        if (StringUtils.isNotBlank(keyword)) {
            sql += " and (name like '%$_$%')";
            sql = sql.replace("$_$", keyword);
        }
        sql += " order by id desc";
        List<Sport> datas = QueryHelper.query(Sport.class, sql);
        request.setAttribute("keyword", keyword);
        request.setAttribute("DATAS", datas);
        request.getRequestDispatcher("admin/sport/list.jsp").forward(request, response);
    }

    private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");

        Object[] params = new Object[] { name, "进行中" };
        int flag = QueryHelper.execute("insert into sport(name, status) values(?,?)", params);
        if (flag == Constant.SUCCESS) {
            request.setAttribute("message", "操作成功！");
        } else {
            request.setAttribute("message", "操作失败！");
        }
        request.getRequestDispatcher("/sport?method=list").forward(request, response);
    }

    private void toupdate(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        String id = (String) request.getParameter("id");
        Sport sport = QueryHelper.read(Sport.class, "select * from sport where id = ?", id);
        request.setAttribute("DATA", sport);

        request.getRequestDispatcher("admin/sport/update.jsp").forward(request, response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = (String) request.getParameter("id");
        String name = request.getParameter("name");
        String status = request.getParameter("status");
        Object[] params = new Object[] { name, status, id };
        int flag = QueryHelper.execute("update sport set name=?, status=? where id=?", params);
        if (flag == Constant.SUCCESS) {
            request.setAttribute("message", "操作成功！");
        } else {
            request.setAttribute("message", "操作失败！");
        }
        request.getRequestDispatcher("/sport?method=list").forward(request, response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int flag = QueryHelper.execute("delete from sport where id=?", id);
        if (flag == Constant.SUCCESS) {
            request.setAttribute("message", "操作成功！");
        } else {
            request.setAttribute("message", "操作失败！");
        }
        request.getRequestDispatcher("/sport?method=list").forward(request, response);
    }
}
