package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Customer;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "history-bill", value = "/history-bill")
public class HistoryBill extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Customer Customer = (Customer) request.getSession().getAttribute("tendangnhap");
        String id_cus = "2";
        request.setAttribute("list", ProductService.getListBillByIdCustomer(id_cus));
        request.setAttribute("id_cus",id_cus);
        request.getRequestDispatcher("history_bill.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
