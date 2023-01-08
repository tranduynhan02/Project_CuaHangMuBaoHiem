package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.SlideShowService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateBanner", value = "/UpdateBanner")
public class UpdateBanner extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String allow = request.getParameter("allow");
        String discount = request.getParameter("discount");
        String content = request.getParameter("content");
        SlideShowService.getInstance().updateBanner(id,allow,discount,content);
        response.sendRedirect("/Project_CuaHangMuBaoHiem_war/ManageHome");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
