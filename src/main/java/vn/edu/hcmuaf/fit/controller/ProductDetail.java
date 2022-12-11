package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductDetail", value = "/detail")
public class ProductDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if(id != null) {
            Product product = ProductService.getProductById(id);
            request.setAttribute("product",product);
            request.getRequestDispatcher("detail.jsp").forward(request,response);
        }else
            response.sendError(404,"Product not found");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
