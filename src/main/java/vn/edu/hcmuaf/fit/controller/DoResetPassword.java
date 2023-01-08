package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.CustomerService;
import vn.edu.hcmuaf.fit.service.MailService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DoResetPassword", value = "/DoResetPassword")
public class DoResetPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email").trim();
        try {
            if (CustomerService.checkEmail(email)==false){
                request.setAttribute("error", "Email chưa được sử dụng để đăng ký tài khoản.");
                request.getRequestDispatcher("forgot-password.jsp").forward(request,response);
            } else {
                request.setAttribute("success","Đặt lại mật khẩu hành công! Vui lòng kiểm tra email!");
                CustomerService.resetPassword(email);
                request.getRequestDispatcher("forgot-password.jsp").forward(request,response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
