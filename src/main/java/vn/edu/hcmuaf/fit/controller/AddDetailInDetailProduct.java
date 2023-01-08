package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddDetailInDetailProduct", value = "/AddDetailInDetailProduct")
public class AddDetailInDetailProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String size = request.getParameter("size");
        String color = request.getParameter("color");
        String quantity = request.getParameter("quantity");
        String iddp=null;
        if(ProductService.checkDBContainSizeColor(id,size,color)){
            iddp = ProductService.getIdDetailProductByCS(id,size,color);
            ProductService.updateSizeColorById(iddp,quantity);
        }else {
            ProductService.insertDetailProduct(id,size,color,quantity);
        }
        response.sendRedirect("/Project_CuaHangMuBaoHiem_war/DetailProduct?id="+id);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
