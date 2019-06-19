package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.db.QueryHelper;
import com.model.Member;
import com.model.Team;
import com.util.Constant;
import com.util.DateUtils;

@WebServlet("/member")
public class MemberServlet extends BaseServlet {

    private static final long serialVersionUID = -4145633972148380729L;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType(Constant.CONTENTTYPE);
        request.setCharacterEncoding(Constant.CHARACTERENCODING);
        Team team = getTeam(request);
        String method = request.getParameter("method");
        if (method.equals("list")) {
            String keyword = getParam(request, "keyword");
            String sql = "select m.*,t.name as teamname from member m join team t on m.teamid = t.id where 1=1";
            if (StringUtils.isNotBlank(keyword)) {
                sql += " and (m.realname like '%$_$%' or m.hnum like '%$_$%' or m.phone like '%$_$%')";
                sql = sql.replace("$_$", keyword);
            }
            sql += " order by m.regtime desc";
            List<Member> members = QueryHelper.query(Member.class, sql);
            request.setAttribute("keyword", keyword);
            request.setAttribute("DATAS", members);
            
            request.getRequestDispatcher("admin/member/index.jsp").forward(request, response);
        } else if (method.equals("mlist")) {
        	String keyword = getParam(request, "keyword");
            String sql = "select m.*,t.name as team_name from member m join team t on m.teamid = t.id where 1=1";
            if (StringUtils.isNotBlank(keyword)) {
                sql += " and (m.realname like '%$_$%' or m.hnum like '%$_$%' or m.phone like '%$_$%')";
                sql = sql.replace("$_$", keyword);
            }
            sql += " and m.teamid = " + team.getId();
            sql += " order by m.regtime desc";
            List<Member> members = QueryHelper.query(Member.class, sql);
            request.setAttribute("keyword", keyword);
            request.setAttribute("DATAS", members);
            
            request.getRequestDispatcher("team/member/index.jsp").forward(request, response);
        } else if (method.equals("add")) {
            String realname = request.getParameter("realname");
            String sex = request.getParameter("sex");
            String age = request.getParameter("age");
            String phone = request.getParameter("phone");
            Integer teamid = team.getId();
            
            String currentId = QueryHelper.read(String.class, "select hnum from member order by hnum desc limit 1");
            while(currentId.startsWith("0")) {
            	currentId = currentId.replaceFirst("0", "");
            }
            Integer xid = Integer.valueOf(currentId) + 1;
            if (xid % 2 == 0) {
            	if ("男".equals(sex)) {
            		xid ++;
            	}
            } else {
            	if ("女".equals(sex)) {
            		xid ++;
            	}
            }

            Object[] params = new Object[] { teamid, realname, sex, age, phone,
                    DateUtils.toCurrentDateStandardString(), StringUtils.leftPad(""+xid, 3, "0") };
            int flag = QueryHelper.execute(
                    "insert into member(teamid,realname,sex,age,phone,regtime,hnum) "
                            + "values(?,?,?,?,?,?,?)", params);
            if (flag == Constant.SUCCESS) {
                request.setAttribute("message", "操作成功！");
            } else {
                request.setAttribute("message", "操作失败！");
            }
            request.getRequestDispatcher("team/member/add.jsp").forward(request, response);
        } else if (method.equals("toupdate")) {
            String id = request.getParameter("id");
            String sql = "select * from member where id = ?";
            Member a = QueryHelper.read(Member.class, sql, id);
            request.setAttribute("DATA", a);
            request.getRequestDispatcher("team/member/update.jsp").forward(request, response);
        } else if (method.equals("update")) {
            String id = (String) request.getParameter("id");
            String realname = request.getParameter("realname");
            String sex = request.getParameter("sex");
            String age = request.getParameter("age");
            String phone = request.getParameter("phone");
            Object[] params = new Object[] { realname, sex, age, phone, id };
            int flag = QueryHelper.execute("update member set realname=?,sex=?,age=?,phone=? where id=?", params);
            if (flag == Constant.SUCCESS) {
                request.setAttribute("message", "操作成功！");
            } else {
                request.setAttribute("message", "操作失败！");
            }
            request.getRequestDispatcher("/member?method=mlist").forward(request, response);
        } else if (method.equals("del")) {// 删除用户
            String id = request.getParameter("id");
            int flag = QueryHelper.execute("delete from member where id=?", id);
            if (flag == Constant.SUCCESS) {
                request.setAttribute("message", "操作成功！");
            } else {
                request.setAttribute("message", "操作失败！");
            }
            request.getRequestDispatcher("/member?method=mlist").forward(request, response);
        }
    }
}
