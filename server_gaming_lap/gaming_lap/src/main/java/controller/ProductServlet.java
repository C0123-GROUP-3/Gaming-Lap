package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/ProductServlet")
public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action =request.getParameter("action");
        if (action== null){
            action = "";
        }
        switch (action){
            case "create":
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/create_");
                break;
            case "edit":
                break;
            case "delete":
                break;
            case "search":
                break;
            default:
                showProductList(request, response);
        }



    }

    private static void showProductList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IProductService productService = new ProductService();
        List<Product> productList = productService.getList();
        request.setAttribute("productList",productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/productList.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
