package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Customer;
import vn.edu.hcmuaf.fit.service.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DoRegister", value = "/doRegister")
public class DoRegister extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String username = request.getParameter("username").toLowerCase();
        String password = request.getParameter("password");
        String confirm_pw = request.getParameter("confirm_pw");
        try {
            if (name == null || name == "" || email == null || email == "" || username == null || username == "" || password == null || password == "" || confirm_pw == null || confirm_pw == "") {
                request.setAttribute("error", "Nguười dùng phải nhập đầy đủ thông tin đăng ký.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else if (CustomerService.emailValidate(email) == false) {
                request.setAttribute("error", "Người dùng nhập email không hợp lệ!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else if (CustomerService.pwValidate(password, confirm_pw) == false) {
                request.setAttribute("error", "Mật khẩu xác nhận không trùng với mật khẩu!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else if (CustomerService.checkEmail(email) == true) {
                request.setAttribute("error", "Email đã có người sử dụng!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else if (CustomerService.checkUsername(username) == true) {
                request.setAttribute("error", "Tên đăng nhập đã có người sử dụng!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else {
                CustomerService.addCustomer(username, CustomerService.toMD5(password), name, email);
                request.setAttribute("success", "Đăng ký thành công.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
