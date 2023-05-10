package controller;

import model.Account;
import service.ILoginService;
import service.impl.LoginService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private static ILoginService iLoginService = new LoginService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        duy trì đănng nhập
        Cookie[] cookies=request.getCookies();
        if (cookies!=null){

        }
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
//            case "checkLogin":
//                checkLoginExit(request, response);
//                break;
//        }


        }

    }


    private static void getLoginCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        Account login = iLoginService.checkLogin(user, pass);
        if (login == null) {
            request.setAttribute("error", "Incorrect Account or Password ?");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
//        else if ((user.equals(login.getUser()))==(user.equals("heeyeon@gmail.com"))){
//            request.getRequestDispatcher("/view/customer/list_product_customer.jsp").forward(request,response);
//        }
        else {
            HttpSession session = request.getSession();
            session.setAttribute("user", login);
            response.sendRedirect("/customer");
        }
    }

    private static void getSignInCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String re_pass = request.getParameter("repass");
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
