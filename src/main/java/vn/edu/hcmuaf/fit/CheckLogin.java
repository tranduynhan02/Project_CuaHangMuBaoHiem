package vn.edu.hcmuaf.fit;

import vn.edu.hcmuaf.fit.model.User;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "CheckLogin", urlPatterns = "/manage/*")
public class CheckLogin implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
        if ((session.getAttribute("auth") == null) || ((User)session.getAttribute("auth")).getRole() != 1){
            req.getRequestDispatcher("login.jsp").forward(request,response);
        } else{

            chain.doFilter(request, response);
        }
    }
}
