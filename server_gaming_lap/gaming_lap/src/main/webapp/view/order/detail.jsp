<%--
  Created by IntelliJ IDEA.
  User: uthoa
  Date: 05/08/23
  Time: 9:38 a.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
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
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../../header_admin.jsp"></jsp:include>
<div style="width: 100%; z-index: -1;  height: auto" class="row">
    <div style="background-color: #e0e0e0;z-index: -2" class="col-lg-2 col-md-1 col-sm"></div>
    <div class="col-lg-8 col-md-10 col-sm-12">
        <div style="width: 100%; height: auto" class="row">
            <div class="row" style="height: auto; text-align: center; padding-bottom: 15px; margin-top: 15px">
                <h1>Order Information</h1>
            </div>
            <div class="row" style="margin-left: 25%">
                <div class="col-lg-8 col-md-10 col-sm-12">
                    <div class="card" style="width: 30rem;">
                        <c:forEach items="${orderList}" var="orderList">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">ID Order: ${orderList.id}</li>
                                <li class="list-group-item">Customer Name: ${orderList.customer.name}</li>
                                <li class="list-group-item">Phone: ${orderList.customer.phone}</li>
                                <c:forEach items="${totalPrice}" var="totalPrice">
                                    <li class="list-group-item">Total Price: ${totalPrice.id} $</li>
                                </c:forEach>
                            </ul>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 30px;margin-left: 10px ">
                <c:forEach items="${orderDetailList}" var="orderDetailList">
                    <div class="col-sm-6" style="z-index: -3">
                        <div class="card mb-3" style="max-width: 540px;">
                            <div class="row g-0">
                                <div class="col-md-4">
                                    <div style="margin-top: 20px">
                                        <img src="${orderDetailList.product.image}" class="img-fluid rounded-start"
                                             alt="...">
                                    </div>

                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h5 class="card-title">${orderDetailList.product.name}</h5>
                                        <p class="card-text">ID Order Detail:  ${orderDetailList.id}</p>
                                        <p class="card-text">Product Price: ${orderDetailList.product.price} $ </p>
                                        <p class="card-text">Quantity: ${orderDetailList.quantity}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div style="background-color: #e0e0e0;z-index: -2" class="col-lg-2 col-md-1 col-sm"></div>
</div>
<jsp:include page="../../footer_admin.jsp"></jsp:include>
</body>
</html>
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"
></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/yourcode.js"></script>
