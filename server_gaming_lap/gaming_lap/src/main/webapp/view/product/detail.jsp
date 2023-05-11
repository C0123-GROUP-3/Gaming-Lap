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

<div style="width: 100%;  height: 800px" class="row">
    <div style="background-color: #e0e0e0" class="col-lg-2 col-md-1 col-sm"></div>
    <div  class="col-lg-8 col-md-10 col-sm-12">




        <div style="width: 100%; height: auto" class="row">
            <div class="row" style="height: auto; text-align: center; padding-bottom: 30px"><h1>Product Information</h1></div>
            <div style="background-color: white" class="col-lg-6 col-md-12"><img width="100%" ; src="${image}" class="rounded float-start" alt="..."></div>
            <div style="background-color: white" class="col-lg-6 col-md-12">
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
                    <p> ${description}</p></div>
            </div>
        </div>






    </div>
    <div style="background-color: #e0e0e0" class="col-lg-2 col-md-1 col-sm"></div>
</div>



    <jsp:include page="../../footer_admin.jsp"></jsp:include>



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
