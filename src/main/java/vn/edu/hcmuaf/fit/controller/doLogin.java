package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DoLogin", value = "/doLogin")
public class DoLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username").toLowerCase();
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        try {
            if (username == null || username == "" || password == null || password == "") {
                request.setAttribute("error", "Người dùng không được để trống Tên đăng nhập hoặc Mật khẩu.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else if (CustomerService.checkLogin(username, CustomerService.toMD5(password))) {
                session.setAttribute("tendangnhap", username);
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("error", "Người dùng nhập không đúng Tên đăng nhập hoặc Mật khẩu.");
                request.getRequestDispatcher("login.jsp").forward(request, response);

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
}
