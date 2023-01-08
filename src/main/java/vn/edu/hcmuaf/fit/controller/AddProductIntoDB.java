package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddProductIntoDB", value = "/AddProductIntoDB")
public class AddProductIntoDB extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String type = request.getParameter("type");
        String brand = request.getParameter("brand");
        String discount = request.getParameter("discount");
        String decrispe = request.getParameter("decrispe");
        String id = ProductService.insertProduct(name,price,brand,type,discount,decrispe);
        response.sendRedirect("/Project_CuaHangMuBaoHiem_war/AddDetailProductIntoDB?id="+id);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
