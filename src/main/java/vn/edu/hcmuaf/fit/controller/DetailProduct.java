package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DetailProduct", value = "/DetailProduct")
public class DetailProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String id = request.getParameter("id");
        String pages = request.getParameter("pages");
        if(id != null) {
            Product product = null;
            try {
                product = ProductService.getProductFullImage(id);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            request.setAttribute("product",product);
            request.setAttribute("pages",pages);
            request.getRequestDispatcher("detailProduct.jsp").forward(request,response);
        }else
            response.sendError(404,"Product not found");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
