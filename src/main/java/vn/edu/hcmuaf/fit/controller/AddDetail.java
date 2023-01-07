package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Cart;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AddDetail", value = "/AddDetail")
public class AddDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String size = request.getParameter("size");
        String color = request.getParameter("color");
        String quantity = request.getParameter("quantity");
        Product p = null;
        try {
            p = ProductService.getDetailProduct(id,size,color);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        p.setQuantity(Integer.parseInt(quantity));
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        cart.putQuantity(p);
        request.getSession().setAttribute("cart",cart);
        response.sendRedirect("/Project_CuaHangMuBaoHiem_war/detail?id=" +id);
//        response.sendRedirect("/Project_CuaHangMuBaoHiem_war/ListProductInCart");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
