package controller;

import model.Product;
import model.TypeProduct;
import service.product.IProductService;
import service.product.impl.ProductService;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/Product")
public class ProductServlet extends HttpServlet {
    private static IProductService productService = new ProductService();
    private static List<TypeProduct> typeProductList = productService.getTypeProductList();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "buy":
                buy(request, response);
                break;
            case "create":
                request.setAttribute("typeProductList", typeProductList);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/product/create.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "edit":
                editProductGet(request, response);
                break;
            case "detail":
                List<Product> productList = productService.getList();
                int id1 = Integer.parseInt(request.getParameter("id"));
                for (int i = 0; i < productList.size(); i++) {
                    if (id1 == productList.get(i).getId()) {
                        request.setAttribute("id", id1);
                        request.setAttribute("name", productList.get(i).getName());
                        request.setAttribute("description", productList.get(i).getDescription());
                        request.setAttribute("price", productList.get(i).getPrice());
                        request.setAttribute("brand", productList.get(i).getBrand());
                        request.setAttribute("typeProduct", productList.get(i).getTypeProduct().getTypeName());
                        request.setAttribute("image", productList.get(i).getImage());
                        request.setAttribute("createTime", productList.get(i).getCreateTime());
                        request.setAttribute("updateTime", productList.get(i).getUpdateTime());
                        request.getRequestDispatcher("/view/product/detail.jsp").forward(request, response);
                    }
                }
                break;
            case "laptopList":
                laptopList(request, response);
                break;
            case "keyboardList":
                keyboardList(request, response);
                break;
            case "headphoneList":
                headphoneList(request, response);
                break;
            case "mouseList":

                mouseList(request, response);
                break;
            case "allProductList":
                List<Product> allProductList = productService.getList();
                int typeId = 5;
                request.setAttribute("typeId", typeId);

                request.setAttribute("allProductList", allProductList);
                request.getRequestDispatcher("/view/product/allProductList.jsp").forward(request, response);
                break;
            default:

                showList(productService.getList(), request, response);
        }


    }

    private static void buy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Product> allProductList = productService.getList();
        for (int i = 0; i < allProductList.size(); i++) {
            if (id == allProductList.get(i).getId()){
                request.setAttribute("id", id);
                request.setAttribute("name", allProductList.get(i).getName());
                request.setAttribute("description", allProductList.get(i).getDescription());
                request.setAttribute("price", allProductList.get(i).getPrice());
                request.setAttribute("brand", allProductList.get(i).getBrand());
                request.setAttribute("typeProduct", allProductList.get(i).getTypeProduct().getTypeName());
                request.setAttribute("image", allProductList.get(i).getImage());
                request.setAttribute("createTime", allProductList.get(i).getCreateTime());
                request.setAttribute("updateTime", allProductList.get(i).getUpdateTime());
                request.getRequestDispatcher("/view/product/shopProduct.jsp").forward(request, response);
            }
        }
    }

    private static void mouseList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> mouseList = productService.mouseList();
        int typeId = 3;
        request.setAttribute("typeId", typeId);
        request.setAttribute("allProductList", mouseList);
        request.getRequestDispatcher("/view/product/allProductList.jsp").forward(request, response);
    }

    private static void headphoneList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> headphoneList = productService.headphoneList();
        int typeId = 4;
        request.setAttribute("typeId", typeId);
        request.setAttribute("allProductList", headphoneList);
        request.getRequestDispatcher("/view/product/allProductList.jsp").forward(request, response);
    }

    private static void keyboardList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int typeId = 2;
        request.setAttribute("typeId", typeId);
        List<Product> keyboardList = productService.getKeyboardList();
        request.setAttribute("allProductList", keyboardList);
        request.getRequestDispatcher("/view/product/allProductList.jsp").forward(request, response);
    }

    private static void laptopList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> laptopList = productService.laptopList();
        request.setAttribute("allProductList", laptopList);
        int typeId = 1;
        request.setAttribute("typeId", typeId);

        request.getRequestDispatcher("/view/product/allProductList.jsp").forward(request, response);
    }

    private static void editProductGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.getList();
        int id = Integer.parseInt(request.getParameter("id"));
        for (int i = 0; i < productList.size(); i++) {
            if (id == productList.get(i).getId()) {
                request.setAttribute("id", id);
                request.setAttribute("name", productList.get(i).getName());
                request.setAttribute("description", productList.get(i).getDescription());
                request.setAttribute("price", productList.get(i).getPrice());
                request.setAttribute("brand", productList.get(i).getBrand());
                request.setAttribute("typeProduct", productList.get(i).getTypeProduct());
                request.setAttribute("image", productList.get(i).getImage());
                request.setAttribute("typeProductList", typeProductList);
                request.getRequestDispatcher("/view/product/edit.jsp").forward(request, response);
            }
        }
    }

    private static void showList(List<Product> productService, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService;
        request.setAttribute("productList", productList);
        request.setAttribute("typeProductList", typeProductList);
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
                int id = Integer.parseInt(request.getParameter("deleteId"));
                productService.deleteProduct(id);
                request.getRequestDispatcher("/view/product/productList.jsp").forward(request, response);
                break;
            case "edit":
                editProductPost(request, response);
                break;
            case "search":
                searchAdmin(request, response);

                break;
            case "searchProduct":
                String search = request.getParameter("search");
                int typeId = Integer.parseInt(request.getParameter("typeId"));
                if (typeId == 1) {
                    List<Product> allProductList = productService.searchList(search, typeId);
                    request.setAttribute("allProductList", allProductList);
                    request.setAttribute("search", search);
                    request.setAttribute("typeId", typeId);
                    request.getRequestDispatcher("/view/product/allProductList.jsp").forward(request, response);
                    break;
                }
                if (typeId == 2) {
                    List<Product> allProductList = productService.searchList(search, typeId);
                    request.setAttribute("allProductList", allProductList);
                    request.setAttribute("search", search);
                    request.setAttribute("typeId", typeId);
                    request.getRequestDispatcher("/view/product/allProductList.jsp").forward(request, response);
                    break;
                }
                if (typeId == 3) {
                    List<Product> allProductList = productService.searchList(search, typeId);
                    request.setAttribute("allProductList", allProductList);
                    request.setAttribute("search", search);
                    request.setAttribute("typeId", typeId);
                    request.getRequestDispatcher("/view/product/allProductList.jsp").forward(request, response);
                    break;
                }
                if (typeId == 4) {
                    List<Product> allProductList = productService.searchList(search, typeId);
                    request.setAttribute("allProductList", allProductList);
                    request.setAttribute("search", search);
                    request.setAttribute("typeId", typeId);
                    request.getRequestDispatcher("/view/product/allProductList.jsp").forward(request, response);
                    break;
                } else {
                    List<Product> allProductList = productService.searchName(search);
                    request.setAttribute("allProductList", allProductList);
                    request.setAttribute("search", search);
                    request.setAttribute("typeId", typeId);
                    request.getRequestDispatcher("/view/product/allProductList.jsp").forward(request, response);
                }

        }

    }

    private static void searchAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        int typeId = Integer.parseInt(request.getParameter("typeProduct"));
        List<Product> productList = new ArrayList<>();

        productList = productService.searchList(search, typeId);
        request.setAttribute("productList", productList);
        request.setAttribute("search", search);
        request.setAttribute("typeProductList", typeProductList);
        request.getRequestDispatcher("/view/product/productList.jsp").forward(request, response);
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
        Product product = new Product(id, name, description, price, brand, typeProduct, image);
        boolean check = productService.editProduct(product);
        request.setAttribute("check", check);


        List<Product> productList = productService.getList();
        request.setAttribute("productList", productList);
        request.setAttribute("typeProductList", typeProductList);
        request.getRequestDispatcher("/view/product/productList.jsp").forward(request, response);
    }

    private static void createProductPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String brand = request.getParameter("brand");
        int typeId = Integer.parseInt(request.getParameter("typeProduct"));
        TypeProduct typeProduct = new TypeProduct(typeId);
        String image = request.getParameter("image");
        Product product = new Product(name, description, price, brand, typeProduct, image);
        boolean check = productService.saveProduct(product);

        request.setAttribute("typeProductList", typeProductList);
        request.setAttribute("check", check);
        request.getRequestDispatcher("/view/product/create.jsp").forward(request, response);
    }
}

