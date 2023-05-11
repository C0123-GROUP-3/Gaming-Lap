package controller;

import model.Account;
import model.Customer;
import service.ICustomerService;
import service.ILoginService;
import service.impl.CustomerService;
import service.impl.LoginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static ICustomerService iCustomerService = new CustomerService();
    private static ILoginService iLoginService = new LoginService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                request.getRequestDispatcher("/view/customer/create.jsp").forward(request, response);
                break;
            }
            case "sign": {
                request.getRequestDispatcher("/sign.jsp").forward(request, response);
                break;
            }
            case "edit": {
                goEditCustomer(request, response);
                int id = Integer.parseInt(request.getParameter("id"));
                List<Account> loginList = iLoginService.getCheckRolesAccount();
                for (int y = 0; y < loginList.size(); y++) {
                    if (id == loginList.get(y).getId()) {
                        request.setAttribute("id", loginList.get(y).getId());
                        request.setAttribute("user", loginList.get(y).getUser());
                        request.setAttribute("pass", loginList.get(y).getPass());
                        request.getRequestDispatcher("/view/customer/edit.jsp").forward(request, response);
                        break;
                    }
                }
                break;
            }
            default: {
                showList(request, response);
                break;
            }
        }
    }

    private static void goEditCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Customer> customerList = iCustomerService.getAll();
        for (int i = 0; i < customerList.size(); i++) {
            if (id == customerList.get(i).getId()) {
                request.setAttribute("id", customerList.get(i).getId());
                request.setAttribute("name", customerList.get(i).getName());
                request.setAttribute("phone", customerList.get(i).getPhone());
                request.setAttribute("address", customerList.get(i).getAddress());
                request.setAttribute("email", customerList.get(i).getEmail());
                request.getRequestDispatcher("/view/customer/edit.jsp").forward(request, response);
                break;
            }
        }

    }

    public void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int deleteId = Integer.parseInt(request.getParameter("deleteId"));
        iCustomerService.deleteCustomer(deleteId);
        try {
            response.sendRedirect("/customer");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    private static void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = iCustomerService.getAll();
        if (customerList == null) {
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        } else {
            request.setAttribute("customerList", customerList);
            request.getRequestDispatcher("/view/customer/list.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                createCustomer(request, response);
                break;
            }
            case "edit": {
                editCustomer(request, response);
                break;
            }
            case "delete": {
                deleteCustomer(request, response);
                break;
            }
            case "search": {
                searchCustomer(request, response);
                break;
            }

        }
    }


    private static void createCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        Customer customer = new Customer(name, phone, address, email);
        boolean check = iCustomerService.saveCustomer(customer);
        request.setAttribute("check", check);
        request.getRequestDispatcher("/view/customer/create.jsp").forward(request, response);
//        request.getRequestDispatcher("/customer/create.jsp").forward(request,response);
//        response.sendRedirect("/customer");
    }

    private static void editCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        Customer customer = new Customer(id, name, phone, address, email);
        Account login = new Account(id, user, pass);
        boolean check = iCustomerService.editCustomer(customer);
        iLoginService.editLogin(login);
        request.setAttribute("check", check);
        response.sendRedirect("/customer");

    }

    private static void searchCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        List<Customer> customerList = iCustomerService.searchCustomer(name, phone);
        request.setAttribute("name", name);
        request.setAttribute("phone", phone);
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("/view/customer/list.jsp").forward(request, response);
    }

}
