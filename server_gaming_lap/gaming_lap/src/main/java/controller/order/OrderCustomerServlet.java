package controller.order;

import model.Customer;
import service.order.ICustomerService;
import service.order.impl.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderCustomerServlet", value = "/OrderCustomerServlet")
public class OrderCustomerServlet extends HttpServlet {
    public final ICustomerService customerService = new CustomerService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            default:
                List<Customer> customerList = this.customerService.getAllCustomer();
                request.setAttribute("customerList", customerList);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/customerList.jsp");
                requestDispatcher.forward(request, response);
            case "crate":
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
    }
}
