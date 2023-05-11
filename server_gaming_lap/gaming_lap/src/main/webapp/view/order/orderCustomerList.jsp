<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/5/2023
  Time: 1:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
          rel="stylesheet"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
          rel="stylesheet"/>
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css"
          rel="stylesheet"/>
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css"/>
</head>
<body>
<jsp:include page="/header_admin.jsp"></jsp:include>
<nav class="navbar navbar-light bg-light" style="position: sticky;top:0;left: 0;right: 0">
    <div class="container-fluid">
        <div style="display: flex; margin-top: 27px; margin-bottom:27px; position: relative">
            <div>
                <button hidden class="btn" style="border: 1px solid #DDDDDD"
                        onclick="window.location.href='/OrderCustomerServlet'">Add Order
                </button>
                <form hidden action="/customer?action=sort" method="post" style="margin-left: 20px">
                                <button class="btn" style="border: 1px solid #DDDDDD" type="button">Sort By Name</button>
                </form>
            </div>
        </div>
        <%--        <form class="d-flex" action="/OrderServlet?action=search" method="post">--%>
        <%--            <input type="text" name="action" value="search" hidden>--%>
        <%--            <input style="width: 15vw" class="form-control me-2" type="search" name="name" value="${name}"--%>
        <%--                   placeholder="Search by Name" aria-label="Search">--%>
        <%--            <input style="width: 20vw" class="form-control me-2" type="search" maxlength="10" name="phone"--%>
        <%--                   value="${phone}"--%>
        <%--                   placeholder="Search by phone number" aria-label="Search">--%>
        <%--            <button class="btn btn-secondary" type="submit">Search</button>--%>
        <%--        </form>--%>
        <form class="d-flex" action="/OrderServlet?action=search" method="post">
            <input type="text" name="action" value="search" hidden>
            <input style="width: 15vw" class="form-control me-2" type="search" name="name" value="${name}"
                   placeholder="Search by Name" aria-label="Search">
            <input style="width: 20vw" class="form-control me-2" type="search" maxlength="10" name="phone"
                   value="${phone}"
                   placeholder="Search by phone number" aria-label="Search">
            <button class="btn btn-secondary" type="submit">Search</button>
        </form>
    </div>
</nav>
<h2 style="text-align: center; margin-top:30px">Select Customer</h2>
<table id="tableCustomer" class="table table-striped table- bordered" style="width: 100%">
    <thead>
    <tr>
        <th style="font-size: 20px">ID</th>
        <th style="font-size: 20px">Full Name</th>
        <th style="font-size: 20px">Phone Number</th>
        <th style="font-size: 20px">Address</th>
        <th style="font-size: 20px">Email</th>
        <th style="font-size: 20px">Create Time</th>
        <th style="font-size: 20px">Update Time</th>
        <th style="font-size: 20px">Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="customerList" items="${customerList}" varStatus="status">
        <tr>
            <td>${customerList.getId()}</td>
            <td>${customerList.getName()}</td>
            <td>${customerList.getPhone()}</td>
            <td>${customerList.getAddress()}</td>
            <td>${customerList.getEmail()}</td>
            <td>${customerList.getCreateTime()}</td>
            <td>${customerList.getUpdateTime()}</td>
            <td colspan="1">
                <form action="/OrderServlet?action=create&id=${customerList.id}" method="post">
                    <button type="submit" class="btn btn-secondary">
                        Select
                    </button>
                </form>
            </td>
        </tr>
        <%--        <div class="modal fade" id="updateModal${customerList.id}" tabindex="-1" aria-labelledby="update"--%>
        <%--             aria-hidden="true">--%>
        <%--            <div class="modal-dialog">--%>
        <%--                <div class="modal-content">--%>
        <%--                    <div class="modal-header">--%>
        <%--                        <h5 class="modal-title" id="update">Chỉnh sửa tên</h5>--%>
        <%--                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
        <%--                    </div>--%>
        <%--                    <div class="modal-body">--%>
        <%--                        <span></span> Do you want to edit customers <span style="color: red">${customerList.name}</span>--%>
        <%--                        <span> name ?</span>--%>
        <%--                    </div>--%>
        <%--                    <div class="modal-footer">--%>
        <%--                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>--%>
        <%--                        <button type="button" class="btn btn-primary"--%>
        <%--                                onclick="window.location.href='/customer?action=edit&id=${customerList.getId()}'">YES--%>
        <%--                        </button>--%>
        <%--                    </div>--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </div>--%>
        <%--        <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel"--%>
        <%--             aria-hidden="true">--%>
        <%--            <div class="modal-dialog">--%>
        <%--                <div class="modal-content">--%>
        <%--                    <div class="modal-header">--%>
        <%--                        <h5 class="modal-title" id="exampleModalLabel"> Erase the name</h5>--%>
        <%--                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
        <%--                    </div>--%>
        <%--                    <form action="/customer?action=delete" method="post">--%>
        <%--                        <div class="modal-body">--%>
        <%--                            <input hidden id="deleteId" name="deleteId">--%>
        <%--                            <span> Do you want to delete customers </span><span style="color: red"--%>
        <%--                                                                                id="deleteName"></span><span> name ?</span>--%>
        <%--                            <div class="modal-footer">--%>
        <%--                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>--%>
        <%--                                <button type="submit" class="btn btn-primary">YES</button>--%>
        <%--                            </div>--%>
        <%--                        </div>--%>
        <%--                    </form>--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </div>--%>
    </c:forEach>
    </tbody>
</table>
<jsp:include page="/footer_admin.jsp"></jsp:include>
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"
></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</script>
<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 8
        });
    });
</script>
<script>
    function infoCreate(id) {
        document.getElementById("createId").value = id;
        document.getElementById("createId1").innerText = id;
    }
</script>
<%--<script>--%>
<%--    function infoDelete(id, name) {--%>
<%--        document.getElementById("deleteId").value = id;--%>
<%--        document.getElementById("deleteName").innerText = name;--%>
<%--    }--%>

<%--    function infoUpdate(id, name) {--%>
<%--        document.getElementById("updateId").value = id;--%>
<%--        document.getElementById("updateName").innerText = name;--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>








