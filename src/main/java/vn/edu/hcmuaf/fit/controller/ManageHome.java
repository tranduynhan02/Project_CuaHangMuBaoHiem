package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.SlideShow;
import vn.edu.hcmuaf.fit.service.SlideShowService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ManageHome", value = "/ManageHome")
public class ManageHome extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<SlideShow> img1 = SlideShowService.getInstance().getImgSlideShowAll();
        request.setAttribute("img1",img1);

        List<SlideShow> img2 = SlideShowService.getInstance().getImgBannerAll();
        request.setAttribute("img2",img2);

        List<SlideShow> img3 = SlideShowService.getInstance().getImgLogoAll();
        request.setAttribute("img3",img3);

        request.getRequestDispatcher("ManageHome.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
