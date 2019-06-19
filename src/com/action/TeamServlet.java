package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import com.db.QueryHelper;
import com.model.Team;
import com.util.Constant;
import com.util.DateUtils;

@WebServlet("/team")
public class TeamServlet extends BaseServlet {

    private static final long serialVersionUID = -4145633972148380729L;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType(Constant.CONTENTTYPE);
        request.setCharacterEncoding(Constant.CHARACTERENCODING);
        HttpSession session = request.getSession();
        String method = request.getParameter("method");
        if (method.equals("list")) {
            String keyword = getParam(request, "keyword");
            String sql = "select * from team where 1=1";
            if (StringUtils.isNotBlank(keyword)) {
                sql += " and (name like '%$_$%' or hnum like '%$_$%' or phone like '%$_$%')";
                sql = sql.replace("$_$", keyword);
            }
            sql += " order by regtime desc";
            List<Team> teams = QueryHelper.query(Team.class, sql);
            request.setAttribute("keyword", keyword);
            request.setAttribute("DATAS", teams);
            
            request.getRequestDispatcher("admin/team/index.jsp").forward(request, response);
        } else if (method.equals("add")) {
        	String hnum = request.getParameter("hnum");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String role = request.getParameter("role");

            String str = QueryHelper.read(String.class, "select hnum from team where hnum=?", hnum);
            if (str == null) {
                Object[] params = new Object[] { password, name, role, phone,
                        DateUtils.toCurrentDateStandardString(), hnum };
                int flag = QueryHelper.execute(
                        "insert into team(password,name,role,phone,regtime,hnum) "
                                + "values(?,?,?,?,?,?)", params);
                if (flag == Constant.SUCCESS) {
                    request.setAttribute("message", "操作成功！");
                } else {
                    request.setAttribute("message", "操作失败！");
                }
                request.getRequestDispatcher("admin/team/add.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "该参赛编号已存在！");
                request.getRequestDispatcher("admin/team/add.jsp").forward(request, response);
            }
        } else if (method.equals("info")) {
            String id = request.getParameter("id");
            String sql = "select * from team where id = ?";
            Team a = QueryHelper.read(Team.class, sql, id);
            request.setAttribute("DATA", a);
            request.getRequestDispatcher("admin/team/update.jsp").forward(request, response);
        } else if (method.equals("updateinfo")) {
            String id = (String) request.getParameter("id");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            Object[] params = new Object[] { password, name, phone, id };
            int flag = QueryHelper.execute("update team set password=?, name=?,phone=? where id=?", params);
            if (flag == Constant.SUCCESS) {
                request.setAttribute("message", "操作成功！");
            } else {
                request.setAttribute("message", "操作失败！");
            }
            request.getRequestDispatcher("/team?method=list").forward(request, response);
        } else if (method.equals("minfo")) {
            Team mbr = getTeam(request);
            String sql = "select * from team where id = ?";
            Team a = QueryHelper.read(Team.class, sql, mbr.getId());
            request.setAttribute("DATA", a);
            request.getRequestDispatcher("team/info/index.jsp").forward(request, response);
        } else if (method.equals("mupdateinfo")) { // 用户修改注册资料
            Team m = getTeam(request);
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            Object[] params = new Object[] { name, phone, m.getId() };
            int flag = QueryHelper.execute("update team set name=?,phone=? where id=?", params);
            if (flag == Constant.SUCCESS) {
                request.setAttribute("message", "操作成功！");
            } else {
                request.setAttribute("message", "操作失败！");
            }
            request.getRequestDispatcher("/team?method=minfo").forward(request, response);
        } else if (method.equals("teamexit")) { // 退出登录
        	session.removeAttribute("team");
            session.removeAttribute("judge");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (method.equals("muppwd")) {// 用户修改密码
            Team m = getTeam(request);
            String oldpwd = request.getParameter("oldpwd");
            String newpwd = request.getParameter("newpwd");
            Integer mb = QueryHelper.read(Integer.class, "select id from team where hnum=? and  password=?",
                    m.getHnum(), oldpwd);
            if (mb == null) {
                request.setAttribute("message", "原始密码信息错误！");
                request.getRequestDispatcher("team/info/editpwd.jsp").forward(request, response);
            } else {
                int flag = QueryHelper.execute("update team set password=? where id=?", newpwd, m.getId());
                if (flag == Constant.SUCCESS) {
                    request.setAttribute("message", "操作成功！");
                } else {
                    request.setAttribute("message", "操作失败！");
                }
                request.getRequestDispatcher("team/info/editpwd.jsp").forward(request, response);
            }
        } else if (method.equals("delm")) {// 删除用户
            String id = request.getParameter("id");
            int flag = QueryHelper.execute("delete from team where id=?", id);
            if (flag == Constant.SUCCESS) {
                request.setAttribute("message", "操作成功！");
            } else {
                request.setAttribute("message", "操作失败！");
            }
            request.getRequestDispatcher("/team?method=list").forward(request, response);
        }
    }
}
