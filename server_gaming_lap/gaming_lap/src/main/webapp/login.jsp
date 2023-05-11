<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/6/2023
  Time: 9:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<section class="vh-100" style="background-color: #444444;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-xl-10">
                <div class="card" style="border-radius: 1rem;">
                    <div class="row g-0">
                        <div class="col-md-6 col-lg-5 d-none d-md-block">
                            <img src="https://account.asus.com/img/login_img02.png"
                                 alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;margin-left: 60px" />
                                <h3 style="margin-left: 30px">One Account, All Gaming Lap</h3>
                            <div style="margin-left: 20px">

                                <p> <i class="fa-solid fa-business-time"></i> Manage the warranties of your Gaming Lap products</p>

                                <p> <i class="fa-solid fa-gears"></i> Download drivers and software for your products</p>

                                <p> <i class="fa-solid fa-down-left-and-up-right-to-center"></i> Get technical support and keep track of your repair status</p>

                                <p> <i class="fa-solid fa-cart-shopping"></i> Quick checkout and easy order tracking</p>

                                <p> <i class="fa-solid fa-folder-open"></i> Get exclusive offers and discounts</p>

                            </div>

                        </div>
                        <div class="col-md-6 col-lg-7 d-flex align-items-center">
                            <div class="card-body p-4 p-lg-5 text-black">
                                <form action="/login?action=loginCustomer" method="post">
                                    <div class="d-flex align-items-center mb-3 pb-1">
                                        <span class="h1 fw-bold mb-0">Gaming Lap</span>
                                        <div class="modal-body">
                                        </div>
                                    </div>
                                    <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>
                                        <p class="text-danger" >${requestScope.error}</p>
                                    <div class="form-outline mb-4">
                                        <input  type="text" id="form2Example17" name="user" class="form-control form-control-lg" />
                                        <label class="form-label" for="form2Example17">
                                            Account Email</label>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <input type="password" id="form2Example27" name="pass" class="form-control form-control-lg" />
                                        <label class="form-label" for="form2Example27">Password</label>
                                    </div>

                                    <div class="pt-1 mb-4">
                                        <a href="/login.jsp"><button class="btn btn-secondary btn-lg btn-block" type="submit">Login</button></a>
                                    </div>

                                    <a class="small text-muted" href="#!">Forgot password?</a>
                                    <p class="mb-5 pb-lg-2" style="color: #393f81;">Don't have an account? <a href="/sign.jsp" style="color: red;">Register here</a></p>
                                   <div style="text-align: center;letter-spacing: 20px">
                                       <a href="oauth/facebook/?op=login">
                                           <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Facebook_f_logo_%282019%29.svg/1365px-Facebook_f_logo_%282019%29.svg.png"
                                                alt="Facebook" class="LoginPage__socialIcon__3JWSx" style="width: 40px">
                                       </a>
                                       <a href="oauth/google/callback.aspx">
                                           <img src="https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg" alt="Google" class="LoginPage__socialIcon__3JWSx" style="width: 40px">
                                       </a>
                                       <a href="https://web.telegram.org/">
                                           <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Telegram_logo.svg/2048px-Telegram_logo.svg.png" alt="Google" class="LoginPage__socialIcon__3JWSx" style="width: 40px">
                                       </a>
                                   </div>
                                    <br>
                                    <a href="#!" class="small text-muted">Terms of use.</a>
                                    <a href="#!" class="small text-muted">Privacy policy</a>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"
></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</script>

</body>
</html>
