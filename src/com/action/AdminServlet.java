package com.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.QueryHelper;
import com.model.Admin;
import com.util.Constant;

@WebServlet("/admin")
public class AdminServlet extends BaseServlet {

    private static final long serialVersionUID = 835333692488017693L;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType(Constant.CONTENTTYPE);
        request.setCharacterEncoding(Constant.CHARACTERENCODING);
        try {
            String method = request.getParameter("method").trim();
            HttpSession session = request.getSession();
            if (method.equals("uppwd")) {// 修改密码
                Admin admin = getAdmin(request);
                String oldpwd = request.getParameter("oldpwd");
                String newpwd = request.getParameter("newpwd");
                Admin a = QueryHelper.read(Admin.class, "select * from admin where username= ? and  password= ?",
                        admin.getUsername(), oldpwd);
                if (a == null) {
                    request.setAttribute("message", "原始密码信息错误！");
                    request.getRequestDispatcher("admin/system/editpwd.jsp").forward(request, response);
                } else {
                    int flag = QueryHelper.execute("update admin set password= ? where id= ?", newpwd, a.getId());
                    if (flag == Constant.SUCCESS) {
                        request.setAttribute("message", "操作成功！");
                        request.getRequestDispatcher("admin/system/editpwd.jsp").forward(request, response);
                    } else {
                        request.setAttribute("message", "操作失败！");
                        request.getRequestDispatcher("admin/system/editpwd.jsp").forward(request, response);
                    }
                }
            } else if (method.equals("adminexit")) {// 退出登录
                session.removeAttribute("user");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else if (method.equals("info")) {
                Admin admin = getAdmin(request);
                String sql = "select * from admin where id = ?";
                Admin a = QueryHelper.read(Admin.class, sql, admin.getId());
                request.setAttribute("DATA", a);
                request.getRequestDispatcher("admin/system/info.jsp").forward(request, response);
            } else if (method.equals("updateinfo")) {
                String realname = request.getParameter("realname");
                String phone = request.getParameter("phone");

                Admin admin = getAdmin(request);
                String sql = "update admin set realname = ?, phone = ? where id = ?";
                QueryHelper.execute(sql, realname, phone, admin.getId());
                request.setAttribute("message", "操作成功！");
                request.getRequestDispatcher("/admin?method=info").forward(request, response);
            } else {// 无参数传入转到错误页面
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

}
