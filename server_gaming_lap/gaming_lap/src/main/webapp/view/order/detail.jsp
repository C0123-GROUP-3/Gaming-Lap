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
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif
        }


        .pic {
            width: 150px;
            height: 150px;
            object-fit: contain;
        }

        .table thead {
            background-color: #21cf95;
        }

        .table thead th {
            padding: 15px;
            font-size: 20px;
            color: white;
        }

        .table tbody td input[type="checkbox"] {
            appearance: none;
            width: 20px;
            height: 20px;
            background-color: #eee;
            position: relative;
            border-radius: 3px;
            cursor: pointer;
        }

        .container .table-wrap {

            margin: 20px auto;
            overflow-x: auto
        }

        .container .table-wrap::-webkit-scrollbar {
            height: 5px;
        }

        .container .table-wrap::-webkit-scrollbar-thumb {
            border-radius: 5px;
            background-image: linear-gradient(to right, #5D7ECD, #0C91E6);
        }

        .table > :not(caption) > * > * {
            padding: 2rem 0.5rem;
        }

        .input {
            width: 30px;
            height: 30px;
            color: black;
            font-weight: 600;
            outline: none;
            padding: 8px;
        }

        ::placeholder {
            color: black;
            font-weight: 600;
        }

        .table tbody td input[type="checkbox"]:after {
            position: absolute;
            width: 100%;
            height: 100%;
            font-family: "Font Awesome 5 Free";
            font-weight: 600;
            content: "\f00c";
            color: #fff;
            font-size: 15px;
            display: none
        }

        .table tbody td input[type="checkbox"]:checked,
        .table tbody td input[type="checkbox"]:checked:hover {
            background-color: #21cf95;
        }

        .table tbody td input[type="checkbox"]:checked::after {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .table tbody td input[type="checkbox"]:hover {
            background-color: #ddd;
        }

        .table tbody td {
            padding: 15px;
            margin: 0;
            font-size: 18px;
            font-weight: 600;
        }

        .table tbody td .fa-times {
            color: #D32F2F;
        }


        .text-muted {
            font-size: 12.5px;
        }

        .table tbody tr td:nth-of-type(3) {
            /*min-width: 320px;*/
        }

        @media (min-width: 992px) {
            .container .table-wrap {
                overflow: hidden;
            }
        }
    </style>
</head>
<body>
<jsp:include page="../../header_admin.jsp"></jsp:include>
<div style="width: 100%; z-index: -1;  height: auto; margin: 0px" class="row">
    <div style="background-color: #e0e0e0;z-index: -2" class="col-lg-2 col-md-1 col-sm"></div>
    <div class="col-lg-8 col-md-10 col-sm-12">
        <div style="width: 100%; height: auto; margin: 0 auto" class="row">
            <div class="row"
                 style="width : 100%;height: auto; text-align: center; padding-bottom: 15px; margin-top: 15px; margin-left: 1%">
                <h1>Order Information</h1>
            </div>
            <%--            style="margin-left: 25%"--%>
            <div class="row" style="margin-left: 29%">
                <div class="col-lg-8 col-md-10 col-sm-12">
                    <div class="card" style="width: 23rem;">
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
            <div class="row" style="margin-top: 0px;margin-left: 1px ">
                <%--                <c:forEach items="${orderDetailList}" var="orderDetailList">--%>
                <%--                    <div class="col-sm-6" style="z-index: -3">--%>
                <%--                        <div class="card mb-3" style="max-width: 540px;">--%>
                <%--                            <div class="row g-0">--%>
                <%--                                <div class="col-md-4">--%>
                <%--                                    <div style="margin-top: 20px">--%>
                <%--                                        <img src="${orderDetailList.product.image}" class="img-fluid rounded-start"--%>
                <%--                                             alt="...">--%>
                <%--                                    </div>--%>
                <%--                                </div>--%>
                <%--                                <div class="col-md-8">--%>
                <%--                                    <div class="card-body">--%>
                <%--                                        <h5 class="card-title">${orderDetailList.product.name}</h5>--%>
                <%--                                        <p class="card-text">ID Order Detail:  ${orderDetailList.id}</p>--%>
                <%--                                        <p class="card-text">Product Price: ${orderDetailList.product.price} $ </p>--%>
                <%--                                        <p class="card-text">Quantity: ${orderDetailList.quantity}</p>--%>
                <%--                                    </div>--%>
                <%--                                </div>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <div class="container">
                    <div class="table-wrap">
                        <table class="table table-responsive table-borderless">
                            <thead>
                            <th>ID</th>
                            <th>Picture</th>
                            <th>Product</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <%--                            <th>&nbsp;</th>--%>
                            </thead>
                            <tbody>
                            <c:forEach items="${orderDetailList}" var="orderDetailList">
                                <tr class="align-middle alert border-bottom" role="alert">
                                        <%--                                    <td>--%>
                                        <%--                                        <input type="checkbox" id="check">--%>
                                        <%--                                    </td>--%>
                                    <td>
                                        <div>
                                                ${orderDetailList.id}
                                        </div>
                                    </td>
                                    <td class="text-center">
                                        <img class="pic"
                                             src="${orderDetailList.product.image}"
                                             alt="">
                                    </td>
                                    <td>
                                        <div>
                                            <p class="m-0 fw-bold">${orderDetailList.product.name}</p>
                                                <%--                                            <p class="m-0 text-muted">Fugiat Voluptates quasi nemo,ipsa perferencis</p>--%>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="fw-600">$${orderDetailList.product.price}</div>
                                    </td>
                                    <td class="fw-600">
                                        <div class="d-" style="text-align: center">${orderDetailList.quantity}</div>
                                    </td>
                                    <td>
                                        <div class="fw-600">
                                            $${orderDetailList.product.price * orderDetailList.quantity}</div>
                                    </td>
                                        <%--                                    <td>--%>
                                        <%--                                        <div class="btn" data-bs-dismiss="alert">--%>
                                        <%--                                            <span class="fas fa-times"></span>--%>
                                        <%--                                        </div>--%>
                                        <%--                                    </td>--%>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <%--                </c:forEach>--%>
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
