package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Contact;
import vn.edu.hcmuaf.fit.service.ContactService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DetailContact", value = "/DetailContact")
public class DetailContact extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String pages= request.getParameter("pages");
        if(id != null) {
            Contact contact = ContactService.getInstance().getContact(id);
            request.setAttribute("contact",contact);
            request.setAttribute("pages",pages);
            request.getRequestDispatcher("DetailContact.jsp").forward(request,response);
        }else
            response.sendError(404,"Product not found");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
