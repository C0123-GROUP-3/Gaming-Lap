package controller;

import model.Account;
import model.Role;
import service.ILoginService;
import service.impl.LoginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private static ILoginService iLoginService = new LoginService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        tạo cookie để liên kết với các miền ?
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("cookieUser")) {
                    request.setAttribute("user", c.getName());
                }
                if (c.getName().equals("cookiePass")) {
                    request.setAttribute("pass", c.getName());
                }
            }
        }
        request.getRequestDispatcher("/login.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "loginCustomer": {
                getLoginCustomer(request, response);
                break;
            }
            case "sign": {
                getSignInCustomer(request, response);
                break;
            }
            case "checkRoleAccount": {
                RoleAccount(request, response);
            }
        }


    }

    private static void RoleAccount(HttpServletRequest request, HttpServletResponse response) {
        String role = request.getParameter("roles_id");

    }


    private static void getLoginCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        boolean memorize = Boolean.parseBoolean(request.getParameter("memorize"));
        Account login = iLoginService.checkLogin(user, pass);


        if (login != null) {
            HttpSession session = request.getSession();
////            session tồn tại trong thời gian là 300s
            session.setMaxInactiveInterval(300);
            session.setAttribute("user", login);
            response.sendRedirect("/customer");
//            response.sendRedirect("/view/customer/list_product_customer.jsp");
            if (memorize) {
                Cookie cookie = new Cookie("cookieUser", login.getUser());
                cookie.setMaxAge(300);
                Cookie cookie1 = new Cookie("cookiePass", login.getPass());
                cookie1.setMaxAge(300);
                response.addCookie(cookie);
                response.addCookie(cookie1);
            }
        } else {
            request.setAttribute("error", "Incorrect Account or Password ?");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }

    }

    private static void getSignInCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String re_pass = request.getParameter("repass");
        String roleName = request.getParameter("role");
        Role role = new Role(roleName);
        Account login = new Account(user, pass);
        boolean checkSign = iLoginService.saveLogin(login);

        if (!pass.equals(re_pass)) {
            response.sendRedirect("/sign.jsp");
        } else {
            login = iLoginService.checkLoginExit(user);
            if (login == null) {
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            } else {
                request.setAttribute("checkSign", checkSign);
                request.getRequestDispatcher("/sign.jsp").forward(request, response);
            }
        }
    }
}
