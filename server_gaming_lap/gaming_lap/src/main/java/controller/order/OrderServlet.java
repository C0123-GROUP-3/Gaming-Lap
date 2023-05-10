package controller.order;

import model.Customer;
import model.Order;
import model.Product;
import service.order.IOrderService;
import service.order.impl.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderServlet", value = "/OrderServlet")
public class OrderServlet extends HttpServlet {
    private final IOrderService orderService = new OrderService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                this.createGet(request, response);
            case "edit":
            case "search":
                break;
            default:
                this.showList(request, response);
        }

    }

    private void createGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = this.orderService.getCustomerList();
        List<Product> productList = this.orderService.getProductList();
        request.setAttribute("customerList", customerList);
        request.setAttribute("productList", productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/order/create.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> orderList = this.orderService.getAllOrder();
        request.setAttribute("orderList", orderList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/order/list.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showListOrderByDate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> orderList = this.orderService.getAllOrderOrderByDate();
        request.setAttribute("orderList", orderList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/order/list.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                this.createPost(request, response);
                break;
            case "delete":
                this.delete(request, response);
                break;
            case "sort":
                this.showListOrderByDate(request, response);
        }
    }
    private void createPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        this.orderService.deleteOrder(id);
        response.sendRedirect("/OrderServlet");
    }
}
