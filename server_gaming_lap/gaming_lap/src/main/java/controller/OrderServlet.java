package controller;

import model.Customer;
import model.Order;
import model.OrderDetail;
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
            case "detail":
                getInfoOrder(request, response);
                break;
            default:
                showList(request, response);
        }
    }

    private void getInfoOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Order> totalPrice = orderService.getTotalPrice(id);
        List<Order> orderList = orderService.getInfoOrderById(id);
        List<OrderDetail> orderDetailList = orderService.getInfoOrderDetail(id);
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("orderDetailList", orderDetailList);
        request.setAttribute("orderList", orderList);
        try {
            request.getRequestDispatcher("/view/order/detail.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void createGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String check = request.getParameter("check");
        List<Order> order = orderService.getOrder();
        List<Customer> customerList = orderService.getCustomerById(id);
        List<Product> productList = orderService.getProductList();
        request.setAttribute("check", check);
        request.setAttribute("order", order);
        request.setAttribute("customerList", customerList);
        request.setAttribute("productList", productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/order/createOrderDetail.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> orderList = orderService.getAllOrder();
        request.setAttribute("orderList", orderList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/order/list.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showListOrderByDate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> orderList = orderService.getAllOrderOrderByDate();
        request.setAttribute("orderList", orderList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/order/list.jsp");
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
            case "search":
                search(request, response);
                break;
            default:
                showList(request, response);
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        this.orderService.deleteOrder(id);
        response.sendRedirect("/OrderServlet");
    }


    private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
//                String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        List<Order> orderList = orderService.searchOrder(id, phone);
        request.setAttribute("id", id);
//                request.setAttribute("name", name);
        request.setAttribute("phone", phone);
        request.setAttribute("orderList", orderList);
        request.getRequestDispatcher("/view/order/list.jsp").forward(request, response);


    }

    private void createOrderDetail(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantityProduct = Integer.parseInt(request.getParameter("quantity"));
        boolean check = orderService.saveOrderDetail(orderId, productId, quantityProduct);
        try {
            response.sendRedirect("/OrderServlet?action=create&id=" + customerId + "&check=" + check);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void createPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        this.orderService.saveOrder(id);
        response.sendRedirect("/OrderServlet?action=create&id=" + id);
    }


}
