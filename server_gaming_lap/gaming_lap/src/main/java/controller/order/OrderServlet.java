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
                createGet(request, response);
                break;
            case "edit":
                break;
            case "search":
                break;
            default:
                showList(request, response);
        }
    }

    private void createGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Order> order = orderService.getOrder();
        List<Customer> customerList = orderService.getCustomerById(id);
        List<Product> productList = orderService.getProductList();
        request.setAttribute("order",order);
        request.setAttribute("customerList", customerList);
        request.setAttribute("productList", productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/order/createOrderDetail.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> orderList = orderService.getAllOrder();
        request.setAttribute("orderList", orderList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/order/list.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showListOrderByDate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> orderList = orderService.getAllOrderOrderByDate();
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
                createPost(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "sort":
                showListOrderByDate(request, response);
                break;
            case "createOrderDetail":
                createOrderDetail(request, response);
                break;
        }
    }

    private void createOrderDetail(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantityProduct = Integer.parseInt(request.getParameter("quantity"));
        boolean check = orderService.saveOrderDetail(orderId, productId, quantityProduct);
        try {
            response.sendRedirect("/OrderServlet?action=create&id=" + customerId);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
//        request.setAttribute("check", check);
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/order/createOrderDetail.jsp");
//        requestDispatcher.forward(request, response);

    }

    //     try {
//        response.sendRedirect("/OrderServlet?action=create&id="+id);
//    } catch (IOException e) {
//        throw new RuntimeException(e);
//    }
    private void createPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        this.orderService.saveOrder(id);
        response.sendRedirect("/OrderServlet?action=create&id=" + id);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        this.orderService.deleteOrder(id);
        response.sendRedirect("/OrderServlet");
    }
}
