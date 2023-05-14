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
<link rel="stylesheet" href="product.css">
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
<nav style="position: sticky; top: 0 ;width: 100%" class="navbar navbar-light bg-light">
    <div style="justify-content: right" class="container-fluid">
        <form method="post" action="/Product?action=searchProduct&typeId=${typeId}"     class="d-flex">
            <input name="search" value="${search}" class="form-control me-2" type="text" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-dark" type="submit">Search</button>
        </form>
    </div>
</nav>
<c:forEach var="product" items="${allProductList}">
    <div class="container mt-5 mb-5">
        <div class="d-flex justify-content-center row">
            <div class="col-md-10">
                <div class="row p-2 bg-white border rounded">
                    <div class="col-md-3 mt-1"><img width="100%" ; src="${product.image}" class="rounded float-start" alt="..."></div>
                    <div class="col-md-6 mt-1">
                        <h2>${product.name}</h2>
                        <div class="d-flex flex-row">
                            <div class="ratings mr-2"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></div><span>310</span>
                        </div>
                        <div class="mt-1 mb-1 spec-1"><span>100% cotton</span><span class="dot"></span><span>Light weight</span><span class="dot"></span><span>Best finish<br></span></div>
                        <div class="mt-1 mb-1 spec-1"><span>Unique design</span><span class="dot"></span><span>For men</span><span class="dot"></span><span>Casual<br></span></div>
                        <p class="text-justify text-truncate para mb-0">${product.description}</p>
                    </div>
                    <div class="align-items-center align-content-center col-md-3 border-left mt-1">
                        <div class="d-flex flex-row align-items-center">
                            <h4 class="mr-1">$${product.price}</h4>
                        </div>
                        <h6 class="text-success">Free shipping</h6>
                        <div class="d-flex flex-column mt-4"><button onclick="window.location.href='/Product?action=buy&id=${product.id}'" class="btn btn-dark btn-sm" type="button">Buy Now</button></a><button class="btn btn-outline-dark btn-sm mt-2" type="button">Add to wishlist</button></div>
                    </div>
                </div>
            </div>
        </div>
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