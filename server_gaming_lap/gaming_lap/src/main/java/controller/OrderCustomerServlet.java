package controller;

import model.Customer;
import service.order.IOrderCustomerService;
import service.order.impl.OrderCustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderCustomerServlet", value = "/OrderCustomerServlet")
public class OrderCustomerServlet extends HttpServlet {
    private final IOrderCustomerService customerService = new OrderCustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "search":
                break;
            default:
                showCustomerListToSelect(request, response);

        }
    }

    private void showCustomerListToSelect(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = this.customerService.getAllCustomer();
        request.setAttribute("customerList", customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/order/orderCustomerList.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "search":
                searchCustomer(request, response);
                break;
            default:
                showCustomerListToSelect(request, response);
        }
    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        List<Customer> customerList = customerService.searchCustomer(name, phone);
        request.setAttribute("name", name);
        request.setAttribute("phone", phone);
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("/view/order/orderCustomerList.jsp").forward(request, response);
    }
}