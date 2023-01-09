package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Cart;
import vn.edu.hcmuaf.fit.model.Customer;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@WebServlet(name = "add_bill", value = "/add_bill")
public class Add_Bill extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        List<String> id_dp = new ArrayList<String>();
        for(Product p: cart.getListProduct()){
            id_dp.add(p.getDetail().get(0).getId());
        }
        if(name==""||email==""||phone==""||address==""){
            request.setAttribute("error","error");
            request.getRequestDispatcher("checkout.jsp").forward(request,response);
        }else{
            LocalDateTime date = LocalDateTime.now();
            String id_bill = date.getSecond()+"-"+date.getMinute()+"-"+date.getHour()+"-"+date.getDayOfMonth()+"-"+date.getMonth()+"-"+date.getYear();
            Customer customer = (Customer) request.getSession().getAttribute("tendangnhap");
            String id_cus = customer.getId();
            ProductService.addBill(id_bill,id_cus,"Đang gửi",id_dp,address,phone);
            cart.getCart().clear();
            cart.setTotal(0);
            cart.setQuantity(0);
            request.setAttribute("name",name);
            request.setAttribute("email",email);
            request.setAttribute("phone",phone);
            request.setAttribute("address",address);
            request.setAttribute("id_bill",id_bill);
            request.setAttribute("list",id_dp);
            request.getRequestDispatcher("detail_bill.jsp").forward(request,response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
