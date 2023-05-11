<%@ page import="model.Account" %><%--
  Created by IntelliJ IDEA.
  User: uthoa
  Date: 05/06/23
  Time: 1:43 p.m.
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="index.css">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
          rel="stylesheet"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
          rel="stylesheet"/>
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css"
          rel="stylesheet"/>
    <link rel="stylesheet" href="dropdown.css">
</head>
<header style="top:0;left: 0;right: 0;z-index: 2 ">
    <nav style="background-color: black" class="navbar navbar-expand-lg navbar-dark ">
        <div class="container-fluid">
            <a class="navbar-brand" href="/index.jsp"><img style="height: 70px" width="55px"
                                                  src="https://www.nicepng.com/png/full/187-1876780_alienware-icon-rtm-notebookreview-alienware-start-button-png.png"
                                                  class="rounded mx-auto d-block" alt="..."></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText"
                    aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarText">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Gaming Lap</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/Product?action=allProductList">Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Deals</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Support</a>
                    </li>
                </ul>

                <div class="dropdown" >
                    <button style="color: white; font-size: 15px;margin-left: -50% " type="button" class="btn  "
                            data-bs-toggle="dropdown" aria-expanded="false" >
                        <div class="ml-5">
                            <span class=" text-white">
                                 <%=session.getAttribute("user") != null ? ((Account) session.getAttribute("user")).getUser() :""%>
                            </span>
                        </div>
                    </button>
                    <div class="dropdown-content" style="margin-left: -40%">
                        <a class="dropdown-item" href="" style="font-size: 20px">
                            <i class="fa-solid fa-user fa-beat-fade"></i> My Account</a>
                        <%=session.getAttribute("user") == null ?(""):("<a href='/logout'><i class=\"fa-solid fa-right-from-bracket fa-beat-fade\"></i> Log out</a>")%>
                    </div>
                </div>
            </div>
            <span class="text-white">
                                            <%=session.getAttribute("user") == null ? (" <div class=\"dropdown\">\n" +
                                                    "                        <button style=\"color: white; font-size: 15px\" type=\"button\" class=\"btn  \" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\n" +
                                                    "                         LOGIN / SIGN IN </button>\n" +
                                                    "                        <div class=\"dropdown-content\" >\n" +
                                                    "                            <a class=\"dropdown-item\" href=\"/login.jsp\" style=\"font-size: 20px\">\n" +
                                                    "                                <i class=\"fa-solid fa-circle-user fa-spin\"></i> Login</a>\n" +
                                                    "                            <a class=\"dropdown-item\" href=\"/sign.jsp\" style=\"font-size: 20px\">\n" +
                                                    "                                <i class=\"fa-solid fa-user-plus fa-flip-horizontal\"></i> Sign In</a>\n" +
                                                    "                        </div>\n" +
                                                    "                    </div>") : ("<a href='/logout'></a>")%>
                                        </span>
            <%--                <span class=" text-white"><%=session.getAttribute("user") != null ? ((Login) session.getAttribute("user")).getUser() : ""%></span>--%>
        </div>
    </nav>
</header>