<%--
  Created by IntelliJ IDEA.
  User: uthoa
  Date: 05/06/23
  Time: 12:54 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Product List</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- Font Awesome -->
<link
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
        rel="stylesheet"
/>
<!-- Google Fonts -->
<link
        href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
        rel="stylesheet"
/>
<!-- MDB -->
<link
        href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css"
        rel="stylesheet"
/>
</head>
<style>
    .img-product{
        width: 100px;
        height: 100px;
    }
</style>
<body>

<jsp:include page="header_admin.jsp"></jsp:include>


<nav class="navbar navbar-light bg-light" style="position: sticky; top: 0; height: 80px; border: 1px solid #DDDDDD">
    <div class="container-fluid">
        <div style="display: flex; margin: 8px;position: relative">
            <div>
                <button class="btn" style="border: 1px solid #DDDDDD" onclick="window.location.href='/user?action=create'">Add Product</button>
            </div>
            <form action="/user?action=sort" method="post" style="margin-left: 20px">
                <button class="btn"  style="border: 1px solid #DDDDDD" type="submit">Sort By Price</button>
            </form>

        </div>
        <form class="d-flex" action="/user?action=search" method="post">
            <input type="text" name="action" value="search" hidden>
            <input style="width: 30vw" class="form-control me-2" type="search" name="phone" value="${phone}"
                   placeholder="Search by brand" aria-label="Search">
            <button class="btn btn-secondary" type="submit">Search</button>
        </form>

    </div>
</nav>

<h1 style="text-align: center;">Product Management</h1>

<table id="table-product" class="table table-striped">
    <thead>
    <tr>
        <th>#</th>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Brand</th>
        <th>Image</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${productList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.brand}</td>
            <td><img class="img-product" src="${product.image}" alt=""></td>
            <th>
                <button onclick="window.location.href = '/ProductServlet?action=edit'" class="btn btn-secondary">Edit</button>
                <button onclick="window.location.href = '/ProductServlet?action=delete'" class="btn btn-secondary">Delete</button>
            </th>
        </tr>
    </c:forEach>
    </tbody>
</table>

<jsp:include page="footer_admin.jsp"></jsp:include>
</body>
</html>
<!-- MDB -->
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"
></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/yourcode.js"></script>

