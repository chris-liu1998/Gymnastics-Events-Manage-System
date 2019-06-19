package com.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.db.QueryHelper;
import com.model.Event;
import com.model.ExtendEvent;
import com.model.Sport;
import com.model.Team;
import com.util.Constant;

@WebServlet("/score")
public class ScoreServlet extends BaseServlet {

	private static final long serialVersionUID = -4145633972148380729L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType(Constant.CONTENTTYPE);
		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		String method = request.getParameter("method");
		if (method.equals("toinput")) {
			toinput(request, response);
		} else if (method.equals("input")) {
			input(request, response);
		} else if (method.equals("adminsort")) {
			adminsort(request, response);
		} else if (method.equals("teamsort")) {
			teamsort(request, response);
		}
	}

	private void toinput(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		ExtendEvent ee = QueryHelper.read(ExtendEvent.class, "select * from extend_event where id = ?", id);
		request.setAttribute("DATA", ee);

		request.getRequestDispatcher("judge/score/input.jsp").forward(request, response);
	}

	private void teamsort(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Sport sport = QueryHelper.read(Sport.class, "select * from sport where status = '进行中'");
		if (sport == null) {
			request.setAttribute("message", "请先添加运动会");
			request.getRequestDispatcher("admin/sport/add.jsp").forward(request, response);
		} else {
			request.setAttribute("sport", sport);

			String qsql = "select * from event where sport = ? order by id desc";
			List<Event> qdatas = QueryHelper.query(Event.class, qsql, sport.getId());
			request.setAttribute("QDATAS", qdatas);

			String eventId = request.getParameter("event");
			if (StringUtils.isBlank(eventId)) {
				request.setAttribute("DATAS", new ArrayList<ExtendEvent>());
			} else {
				String sql = "select e.* from event e where e.id = ?";
				Event event = QueryHelper.read(Event.class, sql, eventId);
				request.setAttribute("EVENT", event);

				Team team = getTeam(request);
				sql = "select * from extend_event where teamid = ? and event_id = ? order by event_score " + event.getUsort();
				List<ExtendEvent> ees = QueryHelper.query(ExtendEvent.class, sql, team.getId(), eventId);
				request.setAttribute("DATAS", ees);
			}
		}
		request.getRequestDispatcher("team/score/sort.jsp").forward(request, response);
	}

	private void adminsort(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Sport sport = QueryHelper.read(Sport.class, "select * from sport where status = '进行中'");
		if (sport == null) {
			request.setAttribute("message", "请先添加运动会");
			request.getRequestDispatcher("admin/sport/add.jsp").forward(request, response);
		} else {
			request.setAttribute("sport", sport);

			String qsql = "select * from event where sport = ? order by id desc";
			List<Event> qdatas = QueryHelper.query(Event.class, qsql, sport.getId());
			request.setAttribute("QDATAS", qdatas);

			String eventId = request.getParameter("event");
			if (StringUtils.isBlank(eventId)) {
				request.setAttribute("DATAS", new ArrayList<ExtendEvent>());
			} else {
				String sql = "select e.* from event e where e.id = ?";
				Event event = QueryHelper.read(Event.class, sql, eventId);
				request.setAttribute("EVENT", event);

				sql = "select * from extend_event where event_id = ? order by event_score " + event.getUsort();
				List<ExtendEvent> ees = QueryHelper.query(ExtendEvent.class, sql, eventId);
				request.setAttribute("DATAS", ees);
			}
		}
		request.getRequestDispatcher("admin/score/sort.jsp").forward(request, response);
	}

	private void input(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String score = request.getParameter("score");
		Float fscore = 0.0f;
		try {
			fscore = Float.parseFloat(score);
		} catch (NumberFormatException e) {
			request.setAttribute("message", "成绩录入错误,请录入合法的成绩");
			request.getRequestDispatcher("/score?method=toinput&id=" + id).forward(request, response);
			return;
		}
		Object[] params = new Object[] { fscore, id };
		int flag = QueryHelper.execute("update extend_event set event_score=? where id=?", params);
		if (flag == Constant.SUCCESS) {
			request.setAttribute("message", "操作成功！");
		} else {
			request.setAttribute("message", "操作失败！");
		}
		request.getRequestDispatcher("/extend_event?method=judgelist").forward(request, response);
	}
}
