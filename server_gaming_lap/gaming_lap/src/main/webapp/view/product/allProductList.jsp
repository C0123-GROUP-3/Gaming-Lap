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
<head>
    <title>laptops</title>
</head>
<body>


<jsp:include page="/header_home.jsp"></jsp:include>
<div style="position: sticky; top:0">
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
                        <a class="nav-link active" aria-current="page" href="/Product?action=headphoneList">Headphone</a>
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

<c:forEach var="product" items="${allProductList}">
<div style="width: 100%;  height: 800px; margin-top: 30px"  class="row">
    <div class="col-lg-2 col-md-1 col-sm"></div>
    <div  class="col-lg-8 col-md-10 col-sm-12">




        <div style="width: 100%; height: auto" class="row">
            <div class="col-lg-6 col-md-12"><img width="100%" ; src="${product.image}" class="rounded float-start" alt="..."></div>
            <div  class="col-lg-6 col-md-12">
                <div style="height: 100px" class="row">
                    <h2>${product.name}</h2>
                </div>
                <div style="height: auto" class="row">
                    <table class="table table-borderless">
                        <tr>
                            <td>ID</td>
                            <td>${product.id}</td>
                        </tr>
                        <tr>
                            <td>Brand</td>
                            <td>${product.brand}</td>
                        </tr>

                        <tr>
                            <td>Update time</td>
                            <td>${product.updateTime}</td>
                        </tr>
                        <tr>
                            <td>Price</td>
                            <td style="font-size: 30px; color: black"><b>$${product.price}</b></td>
                        </tr>
                    </table>
                    <%--                    <ul>--%>
                    <%--                        <li>ID: ${id}</li>--%>
                    <%--                        <li>Brand: ${brand}</li>--%>
                    <%--                        <li>Create time: ${createTime}</li>--%>
                    <%--                        <li>Update on: ${updateTime}</li>--%>
                    <%--                        <li>Price: ${price}</li>--%>
                    <%--                    </ul>--%>
                </div>
                <div class="row" style="height: auto">
                    <h3>Description</h3>
                    <p> ${product.description}</p></div>
                <a href="/view/product/shopProduct.jsp"><button  type="button" class="btn btn-dark">Buy now</button></a>
            </div>
        </div>






    </div>
    <div class="col-lg-2 col-md-1 col-sm"></div>
</div>
</c:forEach>
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