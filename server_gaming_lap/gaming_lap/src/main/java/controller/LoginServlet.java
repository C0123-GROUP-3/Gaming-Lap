package controller;

import model.Account;
import model.Role;
import repository.ILoginRepository;
import repository.impl.LoginRepository;
import service.ILoginService;
import service.impl.LoginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private static ILoginRepository iLoginRepository = new LoginRepository();
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
        List<Account> accounts = iLoginRepository.getCheckRolesAccount();
        Account account = null;
        for (Account s : accounts) {
            if (s.getUser().equals(user) && s.getPass().equals(pass)) {
                account = s;
                break;
            }
        }
        if (account == null) {
            request.setAttribute("error", "Incorrect Account or Password ?");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
//            response.sendRedirect("/view/customer/list_product_customer.jsp");
//            if (memorize) {
//                Cookie cookie = new Cookie("cookieUser", login.getUser());
//                cookie.setMaxAge(300);
//                Cookie cookie1 = new Cookie("cookiePass", login.getPass());
//                cookie1.setMaxAge(300);
//                response.addCookie(cookie);
//                response.addCookie(cookie1);
//        }
        } else {
            if (account.getRoleId() == 1) {
                HttpSession session = request.getSession();
////            session tồn tại trong thời gian là 300s
                session.setMaxInactiveInterval(300);
                session.setAttribute("user", account);
                response.sendRedirect("/customer");
            } else {
                HttpSession session = request.getSession();
////            session tồn tại trong thời gian là 300s
                session.setMaxInactiveInterval(300);
                session.setAttribute("user", account);
                response.sendRedirect("index.jsp");
            }
//            HttpSession session = request.getSession();
//////            session tồn tại trong thời gian là 300s
//            session.setMaxInactiveInterval(300);
//            session.setAttribute("user", account);
//            response.sendRedirect("/customer");
        }

    }

    private static void getSignInCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String re_pass = request.getParameter("repass");
//        int role= Integer.parseInt(request.getParameter("role"));
        Account login = new Account(user, pass);
        if (!pass.equals(re_pass)) {
            request.setAttribute("mess","Passwords don't match");
            request.getRequestDispatcher("/sign.jsp").forward(request, response);
        } else {
            boolean checkSign = iLoginService.saveLogin(login);
            login = iLoginService.checkLoginExit(user);
//            request.setAttribute("checkSign", "sai");
            if (login == null) {
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            } else {
                request.setAttribute("checkSign", checkSign);
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        }
    }
}
