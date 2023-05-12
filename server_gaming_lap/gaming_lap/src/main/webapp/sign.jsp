<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/6/2023
  Time: 9:43 PM
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
</head>
<body>
<!-- Section: Design Block -->
<!-- Section: Design Block -->
<section class="">
    <!-- Jumbotron -->
    <div class="px-4 py-5 px-md-5 text-center text-lg-start" style="background-color: hsl(0, 0%, 96%)">
        <div class="container">
            <div class="row gx-lg-5 align-items-center">
                <div class="col-lg-6 mb-5 mb-lg-0">
                    <h1 class="my-5 display-3 fw-bold ls-tight">
                        Welcome you to <br />
                        <span class="text-primary">the technology world</span>
                    </h1>
                    <p style="color: hsl(217, 10%, 50.8%)">
                        with all the passion to technology, we will provide to you the best product of gaming region.
                        We have enough gear and computer for your best gaming experience. Hopefully, you can have your favorite gaming computer or gear which products we provide here.
                    </p>
                </div>
                <div class="col-lg-6 mb-5 mb-lg-0">
                    <div class="card">
                        <div class="card-body py-5 px-md-5">
                            <div>
                            <form action="/login?action=sign" method="post">

                                <div style="display: flex">
                                    <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign Up for an Account</h5>
                                </div>
<%--                                    <div class="form-outline mb-4">--%>
<%--                                        <input oninput="checkName()" type="text" id="form2Example1" name="name" class="form-control form-control-lg" />--%>
<%--    &lt;%&ndash;                                    <small style="color: red" id="checkName"></small>&ndash;%&gt;--%>
<%--                                        <label class="form-label" for="form2Example1">--%>
<%--                                            Name</label>--%>
<%--                                    </div>--%>
<%--                                    <div class="form-outline mb-4">--%>
<%--                                        <input oninput="checkPhone()" type="text" id="form2Example2" name="phone" class="form-control form-control-lg" />--%>
<%--    &lt;%&ndash;                                    <small style="color: red" id="checkPhone"></small>&ndash;%&gt;--%>
<%--                                        <label class="form-label" for="form2Example2">--%>
<%--                                            Phone Number</label>--%>
<%--                                    </div>--%>
<%--                                    <div class="form-outline mb-4">--%>
<%--                                        <input type="text" id="form2Example3" name="address" class="form-control form-control-lg" />--%>
<%--                                        <label class="form-label" for="form2Example3">--%>
<%--                                            Address</label>--%>
<%--                                    </div>--%>
<%--                                    <div class="form-outline mb-4">--%>
<%--                                        <input oninput="checkEmail()" type="email" id="form2Example4" name="email" class="form-control form-control-lg" />--%>
<%--    &lt;%&ndash;                                    <small style="color: red" id="checkEmail"></small>&ndash;%&gt;--%>
<%--                                        <label class="form-label" for="form2Example4">Email</label>--%>
<%--                                    </div>--%>
                                <div class="form-outline mb-4">
                                    <input required oninput="checkUsere()"  type="text" id="form2Example7" name="user" class="form-control form-control-lg" />
                                    <label class="form-label" for="form2Example7">
                                        Account</label>
                                </div>
                                <div id="checkUser" class="invalid-feedback" style="display: block;margin-top: -4%"></div>

                                <div class="form-outline mb-4">
                                    <input required oninput="checkPasss()" type="password" id="form2Example8" name="pass" class="form-control form-control-lg" />
                                    <label class="form-label" for="form2Example8">
                                        PassWord</label>
                                </div>
                                <div id="checkPass" class="invalid-feedback" style="display: block;margin-top: -4%"></div>
                                <div class="form-outline mb-4">
                                    <input required oninput="checkReRePasse()" type="password" id="form2Example9" name="repass" class="form-control form-control-lg" />
                                    <label class="form-label" for="form2Example9">
                                         Re-PassWord</label>
                                </div>
                                <div id="checkRePass" class="invalid-feedback" style="display: block;margin-top: -4%"></div>
                                <div  hidden class="form-outline mb-4">
                                    <input required value="2" type="password" id="form2Example6" name="role" class="form-control form-control-lg" />
                                    <%--                                    <small style="color: red" id="checkPass"></small>--%>
                                </div>
                                <div class="pt-1 mb-4">
                                    <button class="btn btn-secondary btn-lg btn-block" type="submit">Sign Up</button>
                                </div>

                                <!--Register buttons -->

                            </form>
                                <c:if test="${requestScope.checkSign}">
                                    <h3 style="color:blue">Sign Up Success</h3>
                                </c:if>
                                <h5 style="color:red;">${mess}</h5>
                                <h5  style="color:red;">${usernames}</h5>
                                <p class="mb-5 pb-lg-2" style="color: #393f81;">Do you already have an account ?<a href="/login.jsp" style="color: red;"> Login here</a></p>
                                <div class="text-center">
                                    <p>or sign up with:</p>
                                    <button type="button" class="btn btn-link btn-floating mx-1">
                                        <i class="fab fa-facebook-f"></i>
                                    </button>

                                    <button type="button" class="btn btn-link btn-floating mx-1">
                                        <i class="fab fa-google"></i>
                                    </button>

                                    <button type="button" class="btn btn-link btn-floating mx-1">
                                        <i class="fab fa-twitter"></i>
                                    </button>

                                    <button type="button" class="btn btn-link btn-floating mx-1">
                                        <i class="fab fa-github"></i>
                                    </button>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Jumbotron -->
</section>
<!-- Section: Design Block -->
<!-- Section: Design Block -->
<script>


    function checkUsere() {
        let user = document.getElementById("form2Example7").value;
        let regexName = /^(?=.*[A-Za-z])(?=.*)[A-Za-z\d]{6,50}$/;
        if (regexName.test(user)) {
            document.getElementById("checkUser").innerText = "";
        } else {
            document.getElementById("checkUser").innerText = "The Account  is not in the correct format";
        }}
    // KT PASS có ít nhất 6 kí tự tỏng đó có 1 chữ cái và số

        function checkPasss() {
            let email = document.getElementById("form2Example8").value;
            let regexName =  /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$/;
            if (regexName.test(email)) {
                document.getElementById("checkPass").innerText = "";
            } else {
                document.getElementById("checkPass").innerText = "The Pass Word is not in the correct format";
            }
    }
    function checkReRePasse() {
        let re = document.getElementById("form2Example9").value;
        let regexName = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$/;
        if (regexName.test(re)) {
            document.getElementById("checkRePass").innerText = "";
        } else {
            document.getElementById("checkRePass").innerText = "The Re Pass Word is not in the correct format";
        }
    }
    function check(){
        if (email===re){
            document.getElementById("RePass").innerText="";
        }else
            document.getElementById("checkRePass").innerText = "not the same as the password";
    } {

    }

</script>

<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"
></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</script>
<script>
    function checkName() {
        let name = document.getElementById("form2Example1").value;
        let regexName = /^[A-Z][a-z]*(\s[A-Z][a-z]*)+$/;
        if (regexName.test(name)) {
            document.getElementById("checkName").innerText = "";
        } else {
            document.getElementById("checkName").innerText = "The Name is not in the correct format";
        }
    }

    function checkPhone() {
        let phone = document.getElementById("form2Example2").value;
        let regexPhone = /^((\+84)|0)[0-9]{9}$/;
        if (regexPhone.test(phone)) {
            document.getElementById("checkPhone").innerText = "";
        } else {
            document.getElementById("checkPhone").innerText = "The Phone Number is not in the correct format";
        }
    }

    function checkEmail() {
        let email = document.getElementById("form2Example4").value;
        let regexName = /^[a-z]\w{5,}\@[a-z]{3,5}\.[a-z]{2,5}$/;
        if (regexName.test(email)) {
            document.getElementById("checkEmail").innerText = "";
        } else {
            document.getElementById("checkEmail").innerText = "The Email is not in the correct format";
        }
    }

    function checkUser() {
        let email = document.getElementById("form2Example5").value;
        let regexName = /^[a-z]\w{5,}\@[a-z]{3,5}\.[a-z]{2,5}$/;
        if (regexName.test(email)) {
            document.getElementById("checkUser").innerText = "";
        } else {
            document.getElementById("checkUser").innerText = "The Account Email is not in the correct format";
        }
    }

    // KT PASS có ít nhất 6 kí tự tỏng đó có 1 chữ cái và số
    function checkPass() {
        let email = document.getElementById("form2Example6").value;
        let regexName = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$/;
        if (regexName.test(email)) {
            document.getElementById("checkPass").innerText = "";
        } else {
            document.getElementById("checkPass").innerText = "The Pass Word is not in the correct format";
        }
    }

</script>
</body>
</html>
