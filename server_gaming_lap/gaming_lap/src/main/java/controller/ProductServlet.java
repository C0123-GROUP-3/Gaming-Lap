package controller;

import model.Product;
import model.TypeProduct;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/Product")
public class ProductServlet extends HttpServlet {
    static IProductService productService = new ProductService();
    static List<TypeProduct> typeProductList = productService.getTypeProductList();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                request.setAttribute("typeProductList",typeProductList);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/product/create.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "edit":
                editProductGet(request, response);

                break;
            case "delete":
                break;
            case "search":
                break;
            case "sortByPrice":

                break;
            default:
                showList(productService.getList(), request, response);
        }


    }

    private static void editProductGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.getList();
        int id = Integer.parseInt(request.getParameter("id"));
        for (int i = 0; i < productList.size() ; i++) {
            if (id == productList.get(i).getId()){
                 request.setAttribute("id",id);
                 request.setAttribute("name",productList.get(i).getName());
                 request.setAttribute("description",productList.get(i).getDescription());
                 request.setAttribute("price",productList.get(i).getPrice());
                 request.setAttribute("brand",productList.get(i).getBrand());
                 request.setAttribute("typeProduct",productList.get(i).getTypeProduct());
                 request.setAttribute("image",productList.get(i).getImage());
                 request.setAttribute("typeProductList",typeProductList);
                 request.getRequestDispatcher("/view/product/edit.jsp").forward(request, response);
            }
        }
    }

    private static void showList(List<Product> productService, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService;
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("/view/product/productList.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":

                createProductPost(request, response);
                break;
            case "delete":

                break;
            case "edit":
                editProductPost(request, response);
                break;
            case "search":
                break;
            case "sortByPrice":

                break;
        }

    }

    private static void editProductPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String brand = request.getParameter("brand");
        int typeProductId = Integer.parseInt(request.getParameter("typeProduct"));
        TypeProduct typeProduct = new TypeProduct(typeProductId);
        String image = request.getParameter("image");
        Product product = new Product(id,name,description,price,brand,typeProduct,image);
        boolean check = productService.editProduct(product);
        request.setAttribute("check",check);
        request.setAttribute("typeProductList",typeProductList);
        request.getRequestDispatcher("/view/product/edit.jsp").forward(request, response);
    }

    private static void createProductPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String brand = request.getParameter("brand");
        int typeId = Integer.parseInt(request.getParameter("typeProduct"));
        TypeProduct typeProduct = new TypeProduct(typeId);
        String image = request.getParameter("image");
        Product product = new Product(name,description,price,brand, typeProduct,image);
        boolean check = productService.saveProduct(product);

        request.setAttribute("typeProductList",typeProductList);
        request.setAttribute("check",check);
        request.getRequestDispatcher("/view/product/create.jsp").forward(request, response);
    }
}

