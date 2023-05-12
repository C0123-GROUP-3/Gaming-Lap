<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Create</title>
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
        width: 30%;
        margin: 0 auto;
        text-align: center;
    }
    input {
        width: 200vw;
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
<div class="col-12"><jsp:include page="../../header_admin.jsp"></jsp:include></div>

<h1 style="text-align: center;margin-top:50px ">ADD PRODUCT</h1>
<h6 style="text-align: center; color: darkgreen">
    <c:if test="${check}" >
        ADDED SUCCESSFULLY
    </c:if>
</h6>
<div class="col-lg-2 col-sm-1"></div>
<div class="col-lg-8 col-sm-10 " id="add">
    <form action="/Product?action=create" method="post" class="text_left">
        <div class="form-outline mb-4">
            <input name="name" type="text" id="form6Example3" class="form-control" required/>
            <label class="form-label" for="form6Example3">Product Name</label>
        </div>
        <div class="form-outline mb-4">
            <input name="price" type="number" id="form6Example4" class="form-control" required/>
            <label class="form-label" for="form6Example4">Product Price</label>
        </div>
        <div class="form-outline mb-4">
            <input name="brand" type="text" id="form6Example5" class="form-control" required />
            <label class="form-label" for="form6Example5">Brand of Product</label>
        </div>
        <div class="form-outline mb-4">
            <input name="image" type="text" id="form6Example6" class="form-control" required/>
            <label class="form-label" for="form6Example6">Image URL </label>
        </div>
        <div class="form-outline mb-4">

            <select name="typeProduct" class="form-select form-control" aria-label="Default select example" required>
                <option selected>Select type of product</option>
                <c:forEach var="type" items="${typeProductList}">
                    <option value="${type.typeId}">${type.typeName}</option>
                </c:forEach>
            </select>

        </div>
        <div class="form-outline mb-4">
            <textarea name="description" class="form-control" id="form6Example7" rows="4"></textarea>
            <label class="form-label" for="form6Example7">Additional description</label>
        </div>
        <button type="submit" class="btn btn-dark btn-block mb-4">Create</button>

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

<jsp:include page="../../footer_admin.jsp"></jsp:include>

</body>
</html>





