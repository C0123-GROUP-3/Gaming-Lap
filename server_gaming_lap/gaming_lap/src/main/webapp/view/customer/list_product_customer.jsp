<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/26/2023
  Time: 4:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="stylesheet" href="from.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<jsp:include page="/header_admin.jsp"></jsp:include>

<hr style="margin-top: -1px">
<div class=" article__section container-fluid" style="margin-top: 120px">
  <div class=" row d-inline-flex">
    <article class=" col-l-3 article">
      <div class="article__left">
        <div>
          <button type="submit" class="article__left-btn">
            <i style="color: white" class="fa-solid fa-bars"></i> Danh Mục Sản Phẩm
          </button>
          <ul class="article__left-ul">
          </ul>
        </div>
      </div>
    </article>
  </div>

  <div class="row" style="margin-left: 20px;z-index: -1" >
    <!-- Gallery Item 1 -->
    <div class="col-6 col-sm-4 col-md-3 p-2">
      <div class="card" style="width: 15rem; margin: 30px 25px">
        <img src="https://product.hstatic.net/1000026716/product/7.hinhanhsanpham2_ef28ffb59c524d9292715ca5c837607f.jpg">
        <div class="card-body">
          <p style="margin-top: -40px" class="card-text">Laptop LG Gram 2in1 14T90R GAH55A5.</p>
          <p style="margin-top: 10px;color: red" class="card-text">35,990,000₫</p>
          <div style="text-align: center">
            <a href="#" class="btn " style="margin-top: -10px;background-color: red;color: white">Giỏ
              Hàng</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Gallery Item 2 -->
    <div class="col-6 col-sm-4 col-md-3 p-2">
      <div class="card" style="width: 15rem; margin:30px 25px ">
        <img src="https://product.hstatic.net/1000026716/product/7.hinhanhsanpham2_ef28ffb59c524d9292715ca5c837607f.jpg">
        <div class="card-body">
          <p style="margin-top: -40px" class="card-text">Laptop LG Gram 2in1 14T90R GAH55A5.</p>
          <p style="margin-top: 10px;color: red" class="card-text">35,990,000₫</p>
          <div style="text-align: center">
            <a href="#" class="btn " style="margin-top: -10px;background-color: red;color: white">Giỏ
              Hàng</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Gallery Item 3 -->
    <div class="col-6 col-sm-4 col-md-3 p-2">
      <div class="card" style="width: 15rem; margin:30px 25px ">
        <img src="https://product.hstatic.net/1000026716/product/7.hinhanhsanpham2_ef28ffb59c524d9292715ca5c837607f.jpg">
        <div class="card-body">
          <p style="margin-top: -40px" class="card-text">Laptop LG Gram 2in1 14T90R GAH55A5.</p>
          <p style="margin-top: 10px;color: red" class="card-text">35,990,000₫</p>
          <div style="text-align: center">
            <a href="#" class="btn " style="margin-top: -10px;background-color: red;color: white">Giỏ
              Hàng</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Gallery Item 4 -->
    <div class="col-6 col-sm-4 col-md-3 p-2">
      <div class="card" style="width: 15rem; margin:30px 25px">
        <img src="https://product.hstatic.net/1000026716/product/7.hinhanhsanpham2_ef28ffb59c524d9292715ca5c837607f.jpg">
        <div class="card-body">
          <p style="margin-top: -40px" class="card-text">Laptop LG Gram 2in1 14T90R GAH55A5.</p>
          <p style="margin-top: 10px;color: red" class="card-text">35,990,000₫</p>
          <div style="text-align: center">
            <a href="#" class="btn " style="margin-top: -10px;background-color: red;color: white">Giỏ
              Hàng</a>
          </div>
        </div>
      </div>
    </div>
    <div class="col-6 col-sm-4 col-md-3 p-2">
      <div class="card" style="width: 15rem; margin:30px 25px ">
        <img src="https://product.hstatic.net/1000026716/product/7.hinhanhsanpham2_ef28ffb59c524d9292715ca5c837607f.jpg">
        <div class="card-body">
          <p style="margin-top: -40px" class="card-text">Laptop LG Gram 2in1 14T90R GAH55A5.</p>
          <p style="margin-top: 10px;color: red" class="card-text">35,990,000₫</p>
          <div style="text-align: center">
            <a href="#" class="btn " style="margin-top: -10px;background-color: red;color: white">Giỏ
              Hàng</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>