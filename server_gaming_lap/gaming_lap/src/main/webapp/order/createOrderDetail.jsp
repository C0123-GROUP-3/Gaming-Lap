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
  <jsp:include page="../order/header_admin.jsp"></jsp:include>
</div>
<h3 style="text-align: center;margin-top:50px ">Add New Order Detail</h3>
<div class="col-lg-2 col-sm-1"></div>
<div class="col-lg-8 col-sm-10 " id="add">
  <form action="/order_servlet?action=create" method="post" class="text_left">
    <div class="form-outline mb-4">
      <input name="orderDate" type="date" id="form6Example2" class="form-control" required/>
      <label class="form-label" for="form6Example2">Order Date</label>
    </div>
    <div class="form-outline mb-4">
      <select name="customerId" id="form6Example3" class="form-select" aria-label="Default select example" required>
        <option selected required class="form-label" disabled>Select Customer</option>
        <c:forEach var="customerList" items="${customerList}">
          <option value="${customerList.id}">${customerList.name} (${customerList.phone})</option>
        </c:forEach>
      </select>
    </div>
    <div class="form-outline mb-4">
      <select name="productId" id="form6Example0" class="form-select" aria-label="Default select example" required>
        <option selected class="form-label" disabled>Select Product</option>
        <c:forEach var="productList" items="${productList}">
          <option value="${productList.id}">${productList.id} (${productList.name})</option>
        </c:forEach>
      </select>
    </div>
    <div class="form-outline mb-4">
      <input name="totalPrice" type="text" id="form6Example5" class="form-control" required/>
      <label class="form-label" for="form6Example5">Total Price</label>
    </div>
    <button type="submit" class="btn btn-dark btn-block mb-4">Create</button>
    <button type="button" class="btn btn- btn-block mb-4">Done</button>
    <h6 style="text-align: center; color: red">
      <c:if test="${check}">
        ADDED SUCCESSFULLY
      </c:if>
    </h6>
  </form>
</div>
<div class="col-lg-2 col-sm-1"></div>
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"
></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

<jsp:include page="../order/footer_admin.jsp"></jsp:include>

</body>
</html>