package vn.edu.hcmuaf.fit.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Register", value = "/Register")
public class Register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String confirm_pw = request.getParameter("confirm_pw");

        if(username == null || username == "" || password == null || password == "" || fullname == null || fullname == "" ||email == null || email == "" ||confirm_pw == null || confirm_pw == ""){
            request.setAttribute("Error", "Người dùng không được để trống các thông tin.");
            request.getRequestDispatcher("register.jsp").forward(request,response);
        } else if (!password.equals(confirm_pw)){
            request.setAttribute("Error", "Mật khẩu xác nhận không giống với mật khẩu.");
            request.getRequestDispatcher("register.jsp").forward(request,response);
        }
    }
}
