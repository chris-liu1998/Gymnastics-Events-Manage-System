package com.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.db.QueryHelper;
import com.model.Event;
import com.model.Sport;
import com.util.Constant;

@WebServlet("/event")
public class EventServlet extends BaseServlet {

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
        } else if (method.equals("toadd")) {
            toadd(request, response);
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
        String sql = "select e.*,s.name as sport_name from event e join sport s on s.id = e.sport" +
        		" where 1=1";
        if (StringUtils.isNotBlank(keyword)) {
            sql += " and (e.name like '%$_$%')";
            sql = sql.replace("$_$", keyword);
        }
        sql += " order by e.id desc";
        List<Event> datas = QueryHelper.query(Event.class, sql);
        request.setAttribute("keyword", keyword);
        request.setAttribute("DATAS", datas);
        request.getRequestDispatcher("admin/event/list.jsp").forward(request, response);
    }
    
    private void toadd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Sport sport = QueryHelper.read(Sport.class, "select * from sport where status = '进行中'");
        request.setAttribute("sport", sport);
        request.getRequestDispatcher("admin/event/add.jsp").forward(request, response);
    }

    private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sport = request.getParameter("sport");
        String name = request.getParameter("name");
        String ctime = request.getParameter("ctime");
        String address = request.getParameter("address");
        String unit = request.getParameter("unit");
        String usort = request.getParameter("usort");
        String stime = request.getParameter("stime");
        String etime = request.getParameter("etime");
        
        String sql = "select count(*) from event where sport = ? and name = ?";
        long count = QueryHelper.count(sql, sport, name);
        if (count > 0) {
            request.setAttribute("message", "此项目已经存在,请不要重复添加");
            request.getRequestDispatcher("/event?method=toadd").forward(request, response);
        } else {
            Object[] params = new Object[] { sport, name, ctime, address, unit, usort, stime, etime };
            int flag = QueryHelper.execute("insert into event(sport, name, ctime, address, unit, usort, stime, etime) values(?,?,?,?,?,?,?,?)", params);
            if (flag == Constant.SUCCESS) {
                request.setAttribute("message", "操作成功！");
            } else {
                request.setAttribute("message", "操作失败！");
            }
            request.getRequestDispatcher("/event?method=list").forward(request, response);
        }
    }

    private void toupdate(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        String id = (String) request.getParameter("id");
        String sql = "select e.*,s.name as sport_name, s.id as sport_id from event e " +
        		" join sport s on s.id = e.sport where e.id = ?";
        Event event = QueryHelper.read(Event.class, sql, id);
        request.setAttribute("DATA", event);

        request.getRequestDispatcher("admin/event/update.jsp").forward(request, response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = (String) request.getParameter("id");
        String sport = request.getParameter("sport");
        String name = request.getParameter("name");
        String ctime = request.getParameter("ctime");
        String address = request.getParameter("address");
        String unit = request.getParameter("unit");
        String usort = request.getParameter("usort");
        String stime = request.getParameter("stime");
        String etime = request.getParameter("etime");

        Object[] params = new Object[] { sport, name, ctime, address, unit, usort, stime, etime, id };
        int flag = QueryHelper.execute("update event set sport = ?,name=?, ctime=?, address=?, unit=?, usort=?, stime=?, etime=? where id=?", params);
        if (flag == Constant.SUCCESS) {
            request.setAttribute("message", "操作成功！");
        } else {
            request.setAttribute("message", "操作失败！");
        }
        request.getRequestDispatcher("/event?method=list").forward(request, response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int flag = QueryHelper.execute("delete from event where id=?", id);
        if (flag == Constant.SUCCESS) {
            request.setAttribute("message", "操作成功！");
        } else {
            request.setAttribute("message", "操作失败！");
        }
        request.getRequestDispatcher("/event?method=list").forward(request, response);
    }
}
