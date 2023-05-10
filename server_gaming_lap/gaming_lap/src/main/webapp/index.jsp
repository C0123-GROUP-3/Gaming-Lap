<%@ page import="model.Account" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="index.css">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
          rel="stylesheet"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
          rel="stylesheet"/>
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css"
          rel="stylesheet"/>
    <link rel="stylesheet" href="dropdown.css">
</head>
<body>
<div>
    <header style="position: fixed;top:0;left: 0;right: 0;z-index: 2; ">
        <nav style="background-color: black" class="navbar navbar-expand-lg navbar-dark ">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"><img style="height: 70px" width="55px"
                                                      src="https://www.nicepng.com/png/full/187-1876780_alienware-icon-rtm-notebookreview-alienware-start-button-png.png"
                                                      class="rounded mx-auto d-block" alt="..."></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText"
                        aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Gaming Lap</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Products</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Deals</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Support</a>
                        </li>
                    </ul>

                    <div class="dropdown" >
                        <button style="color: white; font-size: 15px;margin-left: -50% " type="button" class="btn  "
                                data-bs-toggle="dropdown" aria-expanded="false" >
                            <div class="ml-5">
                            <span class=" text-white">
                                 <%=session.getAttribute("user") != null ? ((Account) session.getAttribute("user")).getUser() :""%>
                            </span>
                            </div>
                        </button>
                        <div class="dropdown-content" style="margin-left: -90%">
                            <a class="dropdown-item" href="" style="font-size: 20px">
                                <i class="fa-solid fa-user fa-beat-fade"></i> My Account</a>
                              <%=session.getAttribute("user") == null ?(""):("<a href='/logout'><i class=\"fa-solid fa-right-from-bracket fa-beat-fade\"></i> Log out</a>")%>
                        </div>
                    </div>
                </div>
                <span class="text-white">
                                            <%=session.getAttribute("user") == null ? (" <div class=\"dropdown\">\n" +
                                                    "                        <button style=\"color: white; font-size: 15px\" type=\"button\" class=\"btn  \" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\n" +
                                                    "                         LOGIN / SIGN IN </button>\n" +
                                                    "                        <div class=\"dropdown-content\" >\n" +
                                                    "                            <a class=\"dropdown-item\" href=\"/login.jsp\" style=\"font-size: 20px\">\n" +
                                                    "                                <i class=\"fa-solid fa-circle-user fa-spin\"></i> Login</a>\n" +
                                                    "                            <a class=\"dropdown-item\" href=\"/sign.jsp\" style=\"font-size: 20px\">\n" +
                                                    "                                <i class=\"fa-solid fa-user-plus fa-flip-horizontal\"></i> Sign In</a>\n" +
                                                    "                        </div>\n" +
                                                    "                    </div>") : ("<a href='/logout'></a>")%>
                                        </span>
<%--                <span class=" text-white"><%=session.getAttribute("user") != null ? ((Login) session.getAttribute("user")).getUser() : ""%></span>--%>
            </div>
        </nav>
    </header>
<div style="    z-index: -1">
    <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel" style=" ;
             transition: background-color 0.2s">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://i.dell.com/is/image/DellContent/content/dam/ss2/page-specific/dell-homepage/en/modules/cs2304g0003-616598-gl-cs-co-fy24q2-site-banner-aw-x14-r2-laptop-1600x700-right.png?fmt=png-alpha&wid=1600&hei=700"
                     class="card-img" alt="...">
                <div class="card-img-overlay" style="margin-top: 15%;margin-left: 10%">
                    <div><h5 class="card-title" style="font-size: 30px;color: black">THE FREEDOM TO GAME
                        ANYWHERE</h5>
                        <p class="card-text" style="color: black">The new and improved x14. Bigger screen. Better
                            performance. Remarkably thin.</p>
                    </div>
                    <a href="#" class="btn"
                       style="margin-top: 5%;margin-left: 2%;border: 2px solid black;color: black">Shop
                        Now</a>
                </div>
            </div>
            <div class="carousel-item">
                <div class="card bg-dark text-white">
                    <div class="card bg-dark text-white">
                        <img src="https://i.dell.com/is/image/DellContent/content/dam/documents-and-videos/dv2/csbg/en/product-launch/alienware/alienware-m16-m18-family-gaming-notebooks-amd/site-banners/m16/cs2302g0047-230210-gl-cs-co-site-banner-aw-m16-amd-laptop-1600x700-right.jpg?fmt=png-alpha&wid=1600&hei=700"
                             class="card-img" alt="...">
                        <div class="card-img-overlay" style="margin-top: 15%;margin-left: 10%">
                            <div><h5 class="card-title" style="font-size: 30px">POWERED TO PERFORM</h5>
                                <p class="card-text">Robust 16 and 18 gaming laptops designed to push your game to
                                    the
                                    limit.</p>
                            </div>
                            <a href="#" class="btn"
                               style="margin-top: 5%;margin-left: 2%;border: 2px solid white;color: white">Shop
                                Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="card bg-dark text-white">
                    <img src="https://images.acer.com/is/image/acer/2023GPC_post-event_Acer_banner:Primary-Hero-XL?fmt=png-alpha&wid=1600&hei=700"
                         class="card-img" alt="...">
                    <div class="card-img-overlay" style="margin-top: 15%;margin-left: 10%">
                        <div><h5 class="card-title" style="font-size: 30px">WELCOME TO MY WORLD</h5>
                            <p class="card-text">
                                If you want then choose me. Experience and discover the mysteries in me.</p>
                        </div>
                        <a href="https://www.acer.com/us-en/laptops" class="btn"
                           style="margin-top: 5%;margin-left: 2%;border: 2px solid white;color: white">Shop Now</a>
                    </div>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade"
                data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade"
                data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <div style="margin: 0 auto;padding: 0">
        <div style="width: 100%;display: flex;margin-top: 20px">
            <%--                <div class="row">--%>
            <div class="col-6" style="">
                <div class="card" style="width: 100%">
                    <div class="card-body">
                        <img src="https://assets2.razerzone.com/images/pnx.assets/45149f834f1f08c5e4795aadca37c6b8/razer-blade-18-hero-desktop-v2.jpg"
                             class="card-img" alt="...">
                        <div class="card-img-overlay">
                            <div><h5 class="card-title" style="font-size: 30px;color: white">Powered To
                                Perform</h5>
                            </div>
                            <a href="#" class="btn"
                               style="margin-top: 5%;margin-left: 2%;border: 2px solid white;color: white">Shop
                                Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="card" style="width: 100%">
                    <div class="card-body">
                        <img width=""
                             src="https://api.thinkview.vn/uploads/backend/2023/1/9/razer-blade-16-usp7-desktop.jpg"
                             class="card-img" alt="...">
                        <div class="card-img-overlay" style="margin-top: 15%;margin-left: 10%">
                            <div>
                                <h5 class="card-title" style="font-size: 30px;color: white;">Powered To
                                    Perform</h5>
                            </div>
                            <a href="https://www.youtube.com/" class="btn"
                               style="margin-top: 5%;margin-left: 2%;border: 2px solid white ;color: white">Shop
                                Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Special title treatment</h5>
                    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Special title treatment</h5>
                    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>
        </div>
    </div>
    <div>
        <div style="display: flex;margin-top: 20px">
            <div class="card bg-dark text-white" style="border: none;">
                <img src="https://cdn.tgdd.vn/Files/2022/07/21/1449414/alienwarem17r5anhminhhoa_1280x720-800-resize.jpg"
                     class="card-img" alt="...">
                <div class="card-img-overlay">
                    <a href="" style="text-decoration: none;color: white"><h5 class="card-title"
                                                                              style="text-align: center;margin-top: 150px;font-size: 30px">
                        Alienware Desktops</h5></a>
                </div>
            </div>
            <div class="card bg-dark text-white" style="border: none;">
                <img src="https://cdn.tgdd.vn/Files/2022/03/30/1423113/laptop-alienware-x15-r2_1280x720-800-resize.png"
                     class="card-img" alt="...">
                <div class="card-img-overlay">
                    <a href="" style="text-decoration: none;color: white"><h5 class="card-title"
                                                                              style="text-align: center;margin-top: 150px;font-size: 30px">
                        Alienware Desktops</h5></a>
                </div>
            </div>
        </div>
    </div>
    <div class="card bg-dark text-white" style="border: none">
        <img src="https://assets2.razerzone.com/images/pnx.assets/b32ed0288bb5eb39050b34c19ad71d6d/razer-blade-14-mercury-carousel-2-desktop-v2.jpg"
             class="card-img" alt="...">
        <div class="card-img-overlay" style="margin-top: 15%;margin-left: 10%">
            <div><h5 class="card-title" style="font-size: 30px">WELCOME TO MY WORLD</h5>
                <p class="card-text">
                    If you want then choose me. Experience and discover the mysteries in me.</p>
            </div>
            <a href="https://www.acer.com/us-en/laptops" class="btn"
               style="margin-top: 5%;margin-left: 2%;border: 2px solid white;color: white">Shop Now</a>
        </div>
    </div>
    <div class="card bg-dark text-white" style=";border: none;margin: 0 auto;padding: 0">
        <img style="width: 100%;"
             src="https://www.asus.com/WebsitesBanner/global/banners/c0iw0shutnhbxd2d/c0iw0shutnhbxd2d-0_0_desktop_0_1X.jpg"
             class="card-img"
             alt="...">
        <div class="card-img-overlay">
            <h5 class="card-title" style="margin-left: 60%;margin-top: 10%;font-size: 30px; color: white">
                STARES COME STANDARD</h5>
            <p class="card-text" style="margin-left: 60%">With its captivating AlienFX lighting and head-turning
                full
                metal chassis, the new x16 is destined to draw attention.</p>
            <a href="#" class="btn"
               style="margin-left: 60%;border: 2px solid white;color: white">Shop Now</a>
        </div>
    </div>
</div>
</div>
<footer style="background-color: black" class="text-center text-lg-start text-muted ">
    <!-- Section: Social media -->
    <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
        <!-- Left -->
        <div class="me-5 d-none d-lg-block">
            <span>Get connected with us on social networks:</span>
        </div>
        <!-- Left -->

        <!-- Right -->
        <div>
            <a href="" class="me-4 text-reset">
                <i class="fab fa-facebook-f"></i>
            </a>
            <a href="" class="me-4 text-reset">
                <i class="fab fa-twitter"></i>
            </a>
            <a href="" class="me-4 text-reset">
                <i class="fab fa-google"></i>
            </a>
            <a href="" class="me-4 text-reset">
                <i class="fab fa-instagram"></i>
            </a>
            <a href="" class="me-4 text-reset">
                <i class="fab fa-linkedin"></i>
            </a>
            <a href="" class="me-4 text-reset">
                <i class="fab fa-github"></i>
            </a>
        </div>

        <!-- Right -->
    </section>
    <!-- Section: Social media -->

    <!-- Section: Links  -->
    <section class="">
        <div class="container text-center text-md-start mt-5">
            <!-- Grid row -->
            <div class="row mt-3">
                <!-- Grid column -->
                <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                    <!-- Content -->
                    <h6 class="text-uppercase fw-bold mb-4">
                        <i class="fas fa-gem me-3 text-secondary"></i>Gaming Lap Company
                    </h6>

                </div>
                <!-- Grid column -->
                <!-- Grid column -->
                <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase fw-bold mb-4">
                        Products
                    </h6>
                    <p>
                        <a style="text-decoration: none" href="#!" class="text-reset">Acer</a>
                    </p>
                    <p>
                        <a style="text-decoration: none" href="#!" class="text-reset">MSI</a>
                    </p>
                    <p>
                        <a style="text-decoration: none" href="#!" class="text-reset">Razer</a>
                    </p>
                    <p>
                        <a style="text-decoration: none" href="#!" class="text-reset">Alien Ware</a>
                    </p>
                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase fw-bold mb-4">
                        Useful links
                    </h6>
                    <p>
                        <a style="text-decoration: none" href="#!" class="text-reset">Pricing</a>
                    </p>
                    <p>
                        <a style="text-decoration: none" href="#!" class="text-reset">Settings</a>
                    </p>
                    <p>
                        <a style="text-decoration: none" href="#!" class="text-reset">Orders</a>
                    </p>
                    <p>
                        <a style="text-decoration: none" href="#!" class="text-reset">Help</a>
                    </p>
                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
                    <p><i class="fas fa-home me-3 text-secondary"></i> New York, NY 10012, US</p>
                    <p>
                        <i class="fas fa-envelope me-3 text-secondary"></i>
                        gaminglapcompany@gmail.com
                    </p>
                    <p><i class="fas fa-phone me-3 text-secondary"></i> + 01 234 567 88</p>
                    <p><i class="fas fa-print me-3 text-secondary"></i> + 01 234 567 89</p>
                </div>
                <!-- Grid column -->
            </div>
            <!-- Grid row -->
        </div>
    </section>
    <!-- Section: Links  -->

    <!-- Copyright -->
    <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.025);">
        © 2023 Developed by Hoa, Nhan, Dinh

    </div>
    <!-- Copyright -->
</footer>
<!-- Footer -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>