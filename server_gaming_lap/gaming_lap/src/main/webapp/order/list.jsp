<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/5/2023
  Time: 4:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Order List</title>
</head>
<link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
<link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>
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
<body>
<jsp:include page="header_admin.jsp"></jsp:include>
<nav class="navbar navbar-light bg-light" style="position: sticky; top:0;left: 0;right: 0">
    <div class="container-fluid">
        <div style="display: flex; margin: 8px;position: relative">
            <div>
                <button class="btn" style="border: 1px solid #DDDDDD"
                        onclick="window.location.href='/OrderCustomerServlet'">Add Order
                </button>
            </div>
            <form action="/OrderServlet?action=sort" method="post" style="margin-left: 20px">
                <button class="btn" style="border: 1px solid #DDDDDD" type="submit">Sort By Order Date</button>
            </form>
        </div>
        <form class="d-flex" action="/user?action=search" method="post">
            <input type="text" name="action" value="search" hidden>
            <input style="width: 30vw" class="form-control me-2" type="search" name="phone" value="${phone}"
                   placeholder="Search by phone number customer" aria-label="Search">
            <button class="btn btn-secondary" type="submit">Search</button>
        </form>
    </div>
</nav>
<h1 style="text-align: center;margin-top:30px">Order Management</h1>
<table id="tableOrder" class="table table-striped table- bordered" style="width: 100%">
    <thead>
    <tr>
        <th style="font-size: 20px">#</th>
        <th style="font-size: 20px">ID</th>
        <th style="font-size: 20px">Customer Name</th>
        <th style="font-size: 20px">Create At</th>
        <th style="font-size: 20px">Update At</th>
        <th style="font-size: 20px">Total Price ($)</th>
        <th style="font-size: 20px">Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="orderList" items="${orderList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${orderList.id}</td>
            <td>${orderList.customer.name}</td>
            <td>${orderList.createAt}</td>
            <td>${orderList.updateAt}</td>
            <td>${orderList.totalPrice} $</td>
            <td colspan="2">
                <form action="/OrderServlet?action=edit&id=${orderList.id}" method="post">
                <button type="submit" class="btn btn-warning">
                    Edit
                </button>
                </form>
                <button type="button" onclick="infoDelete('${orderList.id}')" class="btn btn-danger"
                        data-bs-toggle="modal"
                        data-bs-target="#deleteModal">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<jsp:include page="footer_admin.jsp"></jsp:include>
<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="update"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="update">Edit Order</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/OrderServlet?action=update" method="post">
                <div class="modal-body">
                    <input hidden id="updateId" name="updateId">
                    <span>Edit Order </span>
                    <span id="updateId1"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    <button type="submit" class="btn btn-primary">YES</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete Order</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/OrderServlet?action=delete" method="post">
                <div class="modal-body">
                    <input hidden id="deleteId" name="deleteId">
                    <span>
                        Delete Order
                    </span>
                    <span id="deleteId1" style=" color: red">
                    </span>
                    <span>
                         ?
                    </span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    <button type="submit" class="btn btn-primary">YES</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script>
    function infoDelete(id) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteId1").innerText = id;
    }
</script>
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"
></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableOrder').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 6
        });
    });
</script>