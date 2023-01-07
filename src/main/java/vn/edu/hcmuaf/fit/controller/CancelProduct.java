package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "cancel-product", value = "/cancel-product")
public class CancelProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id_bill = request.getParameter("id_bill");
        try {
            if(ProductService.getBill(id_bill).getStatus().equals("Đã Nhận")) response.sendRedirect("notification2.html");
            ProductService.updateStatus(id_bill,"Đã hủy");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("notification1.html");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
