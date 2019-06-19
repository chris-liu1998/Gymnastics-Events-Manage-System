package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.QueryHelper;
import com.model.Admin;
import com.model.Team;
import com.util.Constant;

@WebServlet("/login")
public class LoginServlet extends BaseServlet {

    private static final long serialVersionUID = 1901444324339303807L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        response.setContentType(Constant.CONTENTTYPE);
        request.setCharacterEncoding(Constant.CHARACTERENCODING);
        try {
            String role = request.getParameter("role").trim();
            HttpSession session = request.getSession();
            if (role.equals("admin")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                Admin admin = QueryHelper.read(Admin.class,
                        "select * from admin where username= ? and password= ?", username, password);
                if (null == admin) {
                    request.setAttribute("message", "用户名密码不正确");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    session.setAttribute("user", admin);
                    request.getRequestDispatcher("admin/index.jsp").forward(request, response);
                }
            } else {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                Object[] params = new Object[] { username, password };
                Team team = QueryHelper.read(Team.class,
                        "select * from team where hnum= ? and password= ?", params);
                if (null == team) {
                    request.setAttribute("message", "用户名密码不正确");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                	session.setAttribute("team", team);
                	if (role.equals("team")) {
                		request.getRequestDispatcher("team/index.jsp").forward(request, response);
                	} else {
                		request.getRequestDispatcher("judge/index.jsp").forward(request, response);
                	}
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
