<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>CreateOrderDetail</title>
</head>
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
<style>
    #add {
        width: 35%;
        margin: 0 auto;
        text-align: center;
    }

    input {
        width: 200px;
    }

    .text_left {
        text-align: left;
    }

    label {
        left: 10%;
    }
</style>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<body>
<div class="col-12">
    <jsp:include page="../header_admin.jsp"></jsp:include>
</div>
<h3 style="text-align: center;margin-top:30px ">Add New Order Detail</h3>
<div class="col-lg-2 col-sm-1"></div>
<div class="col-lg-8 col-sm-10 " id="add">
    <%--  INSERT INTO order_detail (id_order,id_product,quantity_product) VALUES (1,2,2);--%>
    <form action="/OrderServlet?action=createOrderDetail" method="post" class="text_left">
        <div class="form-outline mb-4">
            <c:forEach var="order" items="${order}">
                <input hidden style="text-align: center" name="orderId" id="orderId" type="text"
                       class="form-control"
                       value="${order.id}"/>
                <%--                Id: ${customerList.id}, Name: ${customerList.name}, Phone: ${customerList.phone}--%>
                <input disabled style="text-align: center" name="orderName" id="orderName" type="text"
                       class="form-control"
                       value="Id Order: ${order.id}"/>
            </c:forEach>
        </div>
        <div class="form-outline mb-4">
            <c:forEach var="customerList" items="${customerList}">
                <input hidden style="text-align: center" name="customerId" id="customerId" type="text"
                       class="form-control"
                       value="${customerList.id}"/>
<%--                Id: ${customerList.id}, Name: ${customerList.name}, Phone: ${customerList.phone}--%>
                <input disabled style="text-align: center" name="customerName" id="customerName" type="text"
                       class="form-control"
                       value="Id: ${customerList.id}, Name: ${customerList.name}, Phone: ${customerList.phone}"/>
            </c:forEach>
        </div>
        <div class="form-outline mb-4">
            <label style="text-align: center" for="form6Example0">Select Product</label>
            <select  name="productId" id="form6Example0" class="form-select" aria-label="Default select example"
                    required>
<%--                <option style="text-align: center" selected class="form-label" disabled>Select Product</option>--%>
                <c:forEach var="productList" items="${productList}">
                    <option name="productId" id="productId" value="${productList.id}">${productList.id}
                        (${productList.name} - ${productList.price}$)
                    </option>
                </c:forEach>
            </select>
        </div>
        <div class="form-outline mb-4">
            <label  for="quantity">Quantity</label>
            <input style="text-align: center" name="quantity" type="number" min="1" max="100" id="quantity"
                   class="form-control" required/>

<%--            class="form-label"--%>
        </div>
        <button type="submit" class="btn btn-dark btn-block mb-4">Create</button>
        <button type="button" class="btn btn-info btn-block mb-4" onclick="window.location.href='/OrderServlet'">Done
        </button>
        <h6 style="text-align: center; color: red">
            <c:if test="${check}">
                ADDED SUCCESSFULLY
            </c:if>
        </h6>
    </form>
</div>
<div class="col-lg-2 col-sm-1"></div>
<%--<div class="modal fade" id="updateModal${customerList.id}" tabindex="-1" aria-labelledby="update"--%>
<%--     aria-hidden="true">--%>
<%--  <div class="modal-dialog">--%>
<%--    <div class="modal-content">--%>
<%--      <div class="modal-header">--%>
<%--        <h5 class="modal-title" id="update">Chỉnh sửa tên</h5>--%>
<%--        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--      </div>--%>
<%--      <div class="modal-body">--%>
<%--        <span></span> Do you want to edit customers <span style="color: red">${customerList.name}</span>--%>
<%--        <span> name ?</span>--%>
<%--      </div>--%>
<%--      <div class="modal-footer">--%>
<%--        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>--%>
<%--        <button type="button" class="btn btn-primary"--%>
<%--                onclick="window.location.href='/customer?action=edit&id=${customerList.getId()}'">YES--%>
<%--        </button>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>
<%--<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel"--%>
<%--     aria-hidden="true">--%>
<%--  <div class="modal-dialog">--%>
<%--    <div class="modal-content">--%>
<%--      <div class="modal-header">--%>
<%--        <h5 class="modal-title" id="exampleModalLabel"> Erase the name</h5>--%>
<%--        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--      </div>--%>
<%--      <form action="/customer?action=delete" method="post">--%>
<%--        <div class="modal-body">--%>
<%--          <input hidden id="deleteId" name="deleteId">--%>
<%--          <span> Do you want to delete customers </span><span style="color: red"--%>
<%--                                                              id="deleteName"></span><span> name ?</span>--%>
<%--          <div class="modal-footer">--%>
<%--            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>--%>
<%--            <button type="submit" class="btn btn-primary">YES</button>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--      </form>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"
></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

<jsp:include page="../footer_admin.jsp"></jsp:include>
<script>
    function infoCustome(id, name) {
        document.getElementById("customerId").value = id;
        document.getElementById("customerName").value = name;
    }
</script>
</body>
</html>