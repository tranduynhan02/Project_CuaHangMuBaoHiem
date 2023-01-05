package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "doLogin", value = "/doLogin")
public class doLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = UserService.getInstance().checkLogin(username,password);
        response.getWriter().println(username);
        if (user == null) {
            request.setAttribute("error", "Tài khoản hoặc mật khẩu không chính xác.");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        } else {
            response.sendRedirect("index.jsp");
        }
    }
}
