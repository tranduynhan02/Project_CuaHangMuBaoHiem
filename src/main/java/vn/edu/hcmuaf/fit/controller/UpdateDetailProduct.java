package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.service.SlideShowService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateDetailProduct", value = "/UpdateDetailProduct")
public class UpdateDetailProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id_product = request.getParameter("id");
        String id_dp = request.getParameter("id_dp");
        String quantity = request.getParameter("quantity");
        ProductService.updateDetailPQuantity(id_dp,quantity);
        response.sendRedirect("/Project_CuaHangMuBaoHiem_war/DetailProduct?id=" + id_product);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
