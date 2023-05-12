<%@ page import="model.Account" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: uthoa
  Date: 05/11/23
  Time: 7:31 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
<header>
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
                        <a class="nav-link active" aria-current="page" href="#">Gaming Lap Management</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/Product">Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/OrderServlet">Orders</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/customer">Customers</a>
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
<%--                    <div class="dropdown-content" style="margin-left: -90%">--%>
<%--                        <a class="dropdown-item" href="" style="font-size: 20px">--%>
<%--                            <i class="fa-solid fa-user fa-beat-fade"></i> My Account</a>--%>
<%--                        <%=session.getAttribute("user") == null ?(""):("<a href='/logout'><i class=\"fa-solid fa-right-from-bracket fa-beat-fade\"></i> Log out</a>")%>--%>
<%--                    </div>--%>
                </div>


            </div>
        </div>
    </nav>
</header>
<div style="position: sticky; top:0;z-index: 2">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <!-- Container wrapper -->
        <div class="container-fluid">
            <!-- Toggle button -->
            <button
                    class="navbar-toggler"
                    type="button"
                    data-mdb-toggle="collapse"
                    data-mdb-target="#navbarCenteredExample"
                    aria-controls="navbarCenteredExample"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
            >
                <i class="fas fa-bars"></i>
            </button>

            <!-- Collapsible wrapper -->
            <div
                    class="collapse navbar-collapse justify-content-center"
                    id="navbarCenteredExample"
            >
                <!-- Left links -->
                <ul class="navbar-nav mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/Product?action=laptopList">Laptop</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/Product?action=keyboardList">Keyboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page"
                           href="/Product?action=headphoneList">Headphone</a>
                    </li>
                    <!-- Navbar dropdown -->

                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/Product?action=mouseList">Mouse</a>
                    </li>
                </ul>
                <!-- Left links -->
            </div>
            <!-- Collapsible wrapper -->
        </div>
        <!-- Container wrapper -->
    </nav>
</div>
<h3  style="color:red;text-align: center">${order}Successful purchase</h3>
<div class="row" style="margin-top: 5%;">
    <div class="col-sm-6">
        <div class="" style="margin-left: 20%">
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="">
                            <div class="card-body">
                                <div ><img width="100%"  src="https://i.dell.com/is/image/DellContent/content/dam/documents-and-videos/dv2/csbg/en/product-launch/alienware/alienware-x14-r2-gaming-notebook-intel/site-banners/cs2304g0003-616598-gl-cs-co-fy24q2-site-banner-aw-x14-r2-laptop-800x620-right.png?fmt=png-alpha&wid=800&hei=620" class="rounded float-start" alt="..."></div>

                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6" style="">
                        <div class=" ">
                            <div class="card-body">
                                <div style="height: 100px" class="row">
                                    <h2>${name}</h2>
                                </div>
                                <div style="height: auto" class="row">
                                    <table class="table table-borderless">
                                        <tr>
                                            <td>ID</td>
                                            <td>${id}</td>
                                        </tr>
                                        <tr>
                                            <td>Brand</td>
                                            <td>${brand}</td>
                                        </tr>
                                        <tr>
                                            <td>Create time</td>
                                            <td>${createTime}</td>
                                        </tr>
                                        <tr>
                                            <td>Update time</td>
                                            <td>${updateTime}</td>
                                        </tr>
                                        <tr>
                                            <td>Price</td>
                                            <td>$${price}</td>
                                        </tr>

                                    </table>
                                    <div class="form-outline mb-4">
                                        <input type="number" id="quantity" name="quantity" min="1" max="100" class="form-control form-control-lg" />
                                        <label class="form-label">Quantity</label>
                                    </div>
                                    <%--                    <ul>--%>
                                    <%--                        <li>ID: ${id}</li>--%>
                                    <%--                        <li>Brand: ${brand}</li>--%>
                                    <%--                        <li>Create time: ${createTime}</li>--%>
                                    <%--                        <li>Update on: ${updateTime}</li>--%>
                                    <%--                        <li>Price: ${price}</li>--%>
                                    <%--                    </ul>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-6" style="width: 30%;margin-left: 10%;margin-top: -5%">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title" style="text-align: center">Special title treatment</h5>
                <form action="/customer?action=create" method="post" class="text_left">
                    <div class="form-outline mb-4">
                        <input required oninput="checkName()" type="text" id="form6Example3" name="name"
                               class="form-control "/>
                        <small style="color: red" id="checkName"></small>
                        <label class="form-label" for="form6Example3">Name</label>
                    </div>
                    <div class="form-outline mb-4">
                        <input required oninput="checkPhone()" type="text" id="form6Example4" name="phone"
                               class="form-control"/>
                        <small style="color: red" id="checkPhone"></small>
                        <label class="form-label" for="form6Example4">Phone Number</label>
                    </div>
                    <div class="form-outline mb-4">
                        <input required type="text" id="form6Example5" name="address" class="form-control"/>
                        <label class="form-label" for="form6Example5">Address</label>
                    </div>
                    <div class="form-outline mb-4">
                        <input required oninput="checkEmail()" type="text" id="form6Example6" name="email"
                               class="form-control"/>
                        <small style="color: red" id="checkEmail"></small>
                        <label class="form-label" for="form6Example6">Email</label>
                    </div>
                    <div class="form-outline mb-4">
                        <input   type="text" id="product" name="product"
                               class="form-control"/>
<%--                        <small style="color: red" id="checkEmail"></small>--%>
                        <label class="form-label" for="product">ID Product</label>
                    </div>
                    <div class="form-outline mb-4">
                        <input   type="text" id="quantity1" name="quantity1"
                                 class="form-control"/>
                        <%--                        <small style="color: red" id="checkEmail"></small>--%>
                        <label class="form-label" for="quantity1">Quantity</label>
                    </div>
                    <%--        <div class="form-outline mb-4">--%>
                    <%--            <input  required type="text" id="form6Example7" name="user" class="form-control"/>--%>
                    <%--            <small style="color: red" id="checkUser"></small>--%>
                    <%--            <label class="form-label" for="form6Example7">Account </label>--%>
                    <%--        </div>--%>
                    <%--        <div class="form-outline mb-4">--%>
                    <%--            <input  required oninput="checkPass()" type="text" id="form6Example8" name="pass" class="form-control"/>--%>
                    <%--            <small style="color: red" id="checkPass"></small>--%>
                    <%--            <label class="form-label" for="form6Example8">PassWord</label>--%>
                    <%--        </div>--%>
                    <button type="submit" class="btn btn-success btn-block mb-4">ORDER</button>
                </form>
            </div>
            <button type="button " onclick="window.location.href='/Product?action=allProductList'" class="btn btn-dark btn-block mb-4">BACK</button>

        </div>
    </div>
</div>
<%--<div class="card">--%>
<%--    <div class="card-header" style="text-align: center">Description</div>--%>
<%--    <div class="card-body">--%>
<%--        <blockquote class="blockquote mb-0">--%>
<%--            <p> ${description}</p>--%>
<%--        </blockquote>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<c:forEach var="product" items="${allProductList}">--%>

<%--</c:forEach>--%>
<jsp:include page="/footer_admin.jsp"></jsp:include>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"
></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>