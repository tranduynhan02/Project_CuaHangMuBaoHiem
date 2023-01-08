package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.service.SlideShowService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateImage", value = "/UpdateImage")
public class UpdateImage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id_img = request.getParameter("id_img");
        String id_pd = request.getParameter("id");
        String allow = request.getParameter("allow");
        ProductService.updateImage(id_img,allow);
        response.sendRedirect("/Project_CuaHangMuBaoHiem_war/DetailProduct?id="+id_pd);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
