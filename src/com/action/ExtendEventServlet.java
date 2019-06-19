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
import com.model.ExtendEvent;
import com.model.Member;
import com.model.Sport;
import com.model.Team;
import com.util.Constant;

@WebServlet("/extend_event")
public class ExtendEventServlet extends BaseServlet {

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
        } else if (method.equals("adminlist")) {
            adminlist(request, response);
        } else if (method.equals("judgelist")) {
        	judgelist(request, response);
        } else if (method.equals("toadd")) {
            toadd(request, response);
        } else if (method.equals("add")) {
            add(request, response);
        } else if (method.equals("verify")) {
            verify(request, response);
        } else if (method.equals("del")) {
            delete(request, response);
        }
    }
    
    private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Team team = getTeam(request);
        String keyword = getParam(request, "keyword");
        String sql = "select * from extend_event where teamid = ?";
        if (StringUtils.isNotBlank(keyword)) {
            sql += " and (event_name like '%$_$%' or mname like '%$_$%' or mnum like '%$_$%')";
            sql = sql.replace("$_$", keyword);
        }
        sql += " order by id desc";
        List<ExtendEvent> datas = QueryHelper.query(ExtendEvent.class, sql, team.getId());
        request.setAttribute("keyword", keyword);
        request.setAttribute("DATAS", datas);
        request.getRequestDispatcher("team/extend_event/list.jsp").forward(request, response);
    }

    private void adminlist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Sport sport = QueryHelper.read(Sport.class, "select * from sport where status = '进行中'");
        if (sport == null) {
            request.setAttribute("message", "请先添加赛事");
            request.getRequestDispatcher("admin/sport/add.jsp").forward(request, response);
        } else {
            request.setAttribute("sport", sport);
            
            String qsql = "select * from event where sport = ? order by id desc";
            List<Event> qdatas = QueryHelper.query(Event.class, qsql, sport.getId());
            request.setAttribute("QDATAS", qdatas);
            
            String keyword = getParam(request, "keyword");
            String event = request.getParameter("event");
            String sql = "select * from extend_event where 1 = 1";
            if (StringUtils.isNotBlank(keyword)) {
                sql += " and (mname like '%$_$%' or event_name like '%$_$%' or mname like '%$_$%' or mnum like '%$_$%')";
                sql = sql.replace("$_$", keyword);
            }
            if (StringUtils.isNotBlank(event)) {
                sql += " and event_id = " + event;
            }
            sql += " order by id desc";
            List<ExtendEvent> datas = QueryHelper.query(ExtendEvent.class, sql);
            request.setAttribute("keyword", keyword);
            request.setAttribute("event", event);
            request.setAttribute("DATAS", datas);
            request.getRequestDispatcher("admin/extend_event/list.jsp").forward(request, response);
        }
    }
    
    private void judgelist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Sport sport = QueryHelper.read(Sport.class, "select * from sport where status = '进行中'");
    	if (sport != null) {
    		request.setAttribute("sport", sport);
    		
    		String qsql = "select * from event where sport = ? order by id desc";
    		List<Event> qdatas = QueryHelper.query(Event.class, qsql, sport.getId());
    		request.setAttribute("QDATAS", qdatas);
    		
    		String keyword = getParam(request, "keyword");
    		String event = request.getParameter("event");
    		String sql = "select * from extend_event where status = '已通过'";
    		if (StringUtils.isNotBlank(keyword)) {
    			sql += " and (mname like '%$_$%' or event_name like '%$_$%' or mname like '%$_$%' or mnum like '%$_$%')";
    			sql = sql.replace("$_$", keyword);
    		}
    		if (StringUtils.isNotBlank(event)) {
    			sql += " and event_id = " + event;
    		}
    		sql += " order by id desc";
    		List<ExtendEvent> datas = QueryHelper.query(ExtendEvent.class, sql);
    		request.setAttribute("keyword", keyword);
    		request.setAttribute("event", event);
    		request.setAttribute("DATAS", datas);
    		request.getRequestDispatcher("judge/extend_event/list.jsp").forward(request, response);
    	}
    }
    
    private void toadd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Sport sport = QueryHelper.read(Sport.class, "select * from sport where status = '进行中'");
        request.setAttribute("sport", sport);
        
        String sql = "select * from event where sport = ? order by id desc";
        List<Event> datas = QueryHelper.query(Event.class, sql, sport.getId());
        request.setAttribute("DATAS", datas);
        
        String sql2 = "select * from member where teamid = ?";
        List<Member> mbrs = QueryHelper.query(Member.class, sql2, getTeam(request).getId());
        request.setAttribute("MBRS", mbrs);
        
        request.getRequestDispatcher("team/extend_event/add.jsp").forward(request, response);
    }

    private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eventId = request.getParameter("event");
        String mid = request.getParameter("mid");
       
        // 判断是否已经报名了
        String esql = "select count(*) from extend_event where mid = ? and event_id = ?";
        long ecount = QueryHelper.count(esql, mid, eventId);
        if (ecount > 0) {
            request.setAttribute("message", "此队员已经报名过此项目了");
            request.getRequestDispatcher("/extend_event?method=toadd").forward(request, response);
        } else {
            String sql = "select e.*,s.name as sport_name, s.id as sport_id from event e " +
                    " join sport s on s.id = e.sport where e.id = ?";
            Event event = QueryHelper.read(Event.class, sql, eventId);
            
            String msql = "select * from member where id = ?";
            Member mbr = QueryHelper.read(Member.class, msql, mid);
            
            Team team = getTeam(request);
            
            Object[] params = new Object[] { event.getSportName(), event.getId(), event.getName(), event.getCtime(), event.getAddress(),
                    event.getUnit(), mbr.getId(), mbr.getRealname(), mbr.getHnum(), mbr.getTeamid(), team.getName()};
            int flag = QueryHelper.execute("INSERT INTO extend_event (sport_name, event_id, event_name, event_ctime, event_address, " +
            		"event_unit, mid, mname, mnum, teamid, teamname) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", params);
            if (flag == Constant.SUCCESS) {
                request.setAttribute("message", "操作成功！");
            } else {
                request.setAttribute("message", "操作失败！");
            }
            request.getRequestDispatcher("/extend_event?method=list").forward(request, response);
        }
    }

    private void verify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int flag = QueryHelper.execute("update extend_event set status = ? where id=?", "已通过", id);
        if (flag == Constant.SUCCESS) {
            request.setAttribute("message", "操作成功！");
        } else {
            request.setAttribute("message", "操作失败！");
        }
        request.getRequestDispatcher("/extend_event?method=adminlist").forward(request, response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int flag = QueryHelper.execute("delete from extend_event where id=?", id);
        if (flag == Constant.SUCCESS) {
            request.setAttribute("message", "操作成功！");
        } else {
            request.setAttribute("message", "操作失败！");
        }
        request.getRequestDispatcher("/extend_event?method=list").forward(request, response);
    }
}
