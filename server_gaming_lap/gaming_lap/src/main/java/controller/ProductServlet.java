package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "ProductServlet", value = "/Product")
public class ProductServlet extends HttpServlet {
    static IProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.getList();
        String action =request.getParameter("action");
        if (action== null){
            action = "";
        }
        switch (action){
            case "create":
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product/create.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "edit":
                String id  = request.getParameter("id");
                for (int i = 0; i < productList.size(); i++) {
                    if (Objects.equals(id, productList.get(i).getId())) {
                        request.setAttribute("id",productList.get(i).getId());
                        request.setAttribute("name",productList.get(i).getName());
                        request.setAttribute("description",productList.get(i).getDescription());
                        request.setAttribute("price",productList.get(i).getPrice());
                        request.setAttribute("brand",productList.get(i).getBrand());
                        request.setAttribute("image",productList.get(i).getImage());
                        request.getRequestDispatcher("/product/edit.jsp").forward(request,response);
                        break;
                    }
                }
                

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

        List<Product> productList = productService.getList();
        request.setAttribute("productList",productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product/productList.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action= "";
        }
        switch (action){
            case "create":
                createProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "edit":
                String id = request.getParameter("id");
                String name = request.getParameter("name");
                String description = request.getParameter("description");
                double price = Double.parseDouble(request.getParameter("price"));
                String brand = request.getParameter("brand");
                String image = request.getParameter("image");
                Product product = new Product(id,name,description,price,brand,image);
                boolean check = productService.editProduct(product);
                request.setAttribute("check",check);
                request.getRequestDispatcher("/product/edit.jsp").forward(request,response);

                break;
        }

    }

    private static void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("deleteId");
        boolean check = productService.deleteProduct(id);
        response.sendRedirect("/Product");
    }

    private static void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String brand = request.getParameter("brand");
        String image = request.getParameter("image");
        boolean check = productService.saveProduct(new Product(id,name,description,price,brand,image));
        request.setAttribute("check",check);
        request.getRequestDispatcher("/product/create.jsp").forward(request, response);
    }
}
