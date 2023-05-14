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
    <header style=" position:fixed;top:0;left: 0;right: 0;z-index:2 ">
        <nav style="background-color: black" class="navbar navbar-expand-lg navbar-dark ">
            <div class="container-fluid">
                <a class="navbar-brand" href="/index.jsp"><img style="height: 70px" width="55px"
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
                            <a class="nav-link" href="/Product?action=allProductList">Products</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Deals</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Support</a>
                        </li>
                    </ul>

                    <div class="dropdown">
                        <button style="color: white; font-size: 15px;margin-left: -50% " type="button" class="btn  "
                                data-bs-toggle="dropdown" aria-expanded="false">
                            <div class="ml-5">
                            <span class=" text-white">
                                 <%=session.getAttribute("user") != null ? ((Account) session.getAttribute("user")).getUser() : ""%>
                            </span>
                            </div>
                        </button>
                        <div class="dropdown-content" style="margin-left: -40%">
                            <a class="dropdown-item" href="" style="font-size: 20px">
                                <i class="fa-solid fa-user fa-beat-fade"></i> My Account</a>
                            <%=session.getAttribute("user") == null ? ("") : ("<a href='/logout'><i class=\"fa-solid fa-right-from-bracket fa-beat-fade\"></i> Log out</a>")%>
                        </div>
                    </div>
                </div>
                <span class="text-white">
                                            <%=session.getAttribute("user") == null ? (" <div class=\"dropdown\">\n" +
                                                    "                        <button style=\"color: white; font-size: 15px\" type=\"button\" class=\"btn  \" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\n" +
                                                    "                         LOGIN / SIGN UP </button>\n" +
                                                    "                        <div class=\"dropdown-content\" >\n" +
                                                    "                            <a class=\"dropdown-item\" href=\"/login.jsp\" style=\"font-size: 20px\">\n" +
                                                    "                                <i class=\"fa-solid fa-circle-user fa-spin\"></i> Login</a>\n" +
                                                    "                            <a class=\"dropdown-item\" href=\"/sign.jsp\" style=\"font-size: 20px\">\n" +
                                                    "                                <i class=\"fa-solid fa-user-plus fa-flip-horizontal\"></i> Sign Up</a>\n" +
                                                    "                        </div>\n" +
                                                    "                    </div>") : ("<a href='/logout'></a>")%>
                                        </span>
                <%--                <span class=" text-white"><%=session.getAttribute("user") != null ? ((Login) session.getAttribute("user")).getUser() : ""%></span>--%>
            </div>
        </nav>
    </header>
    <div style="    z-index: 1">
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
                        <button class="btn" onclick="window.location.href='/Product?action=allProductList'"
                                style="margin-top: 5%;margin-left: 2%;border: 2px solid black;color: black">Shop
                            Now
                        </button>
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
                                <button class="btn" onclick="window.location.href='/Product?action=allProductList'"
                                        style="margin-top: 5%;margin-left: 2%;border: 2px solid white;color: white">Shop
                                    Now
                                </button>
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
                            <button class="btn" onclick="window.location.href='/Product?action=allProductList'"
                                    style="margin-top: 5%;margin-left: 2%;border: 2px solid black;color: black">Shop
                                Now
                            </button>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="card bg-dark text-white">
                        <img src="  https://storage-asset.msi.com/us/picture/banner/banner_167288740636de279ef9428955d95c04c8d61e572d.jpeg"
                             class="card-img" alt="...">
                        <div class="card-img-overlay" style="margin-top: 15%;margin-left: 10%">
                            <%--                        <div><h5 class="card-title" style="font-size: 30px">WELCOME TO MY WORLD</h5>--%>
                            <%--                            <p class="card-text">--%>
                            <%--                                If you want then choose me. Experience and discover the mysteries in me.</p>--%>
                            <%--                        </div>--%>
                            <button class="btn" onclick="window.location.href='/Product?action=allProductList'"
                                    style="margin-top: 5%;margin-left: 2%;border: 2px solid white;color: white">Shop
                                Now
                            </button>
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
                <div class="col-6">
                    <div class="" style="width: 100%">
                        <div class="">
                            <img width=""
                                 src="https://storage-asset.msi.com/frontend/imgs/product_registration.jpg"
                                 class="card-img" alt="...">
                            <div class="card-img-overlay" style="margin-top: 15%;margin-left: 10%">
                                <div>
                                    <h5 class="card-title" style="font-size: 30px;color: white;">MSI GAMING</h5>
                                </div>
                                <button class="btn" onclick="window.location.href='/Product?action=allProductList'"
                                        style="margin-top: 5%;margin-left: 2%;border: 2px solid white ;color: white">
                                    Shop
                                    Now
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="" style="width: 100%">
                        <div class="">
                            <img width=""
                                 src="https://api.thinkview.vn/uploads/backend/2023/1/9/razer-blade-16-usp7-desktop.jpg"
                                 class="card-img" alt="...">
                            <div class="card-img-overlay" style="margin-top: 15%;margin-left: 10%">
                                <div>
                                    <h5 class="card-title" style="font-size: 30px;color: white;">NEW RAZER</h5>
                                </div>
                                <button class="btn" onclick="window.location.href='/Product?action=allProductList'"
                                        style="margin-top: 5%;margin-left: 2%;border: 2px solid white ;color: white">
                                    Shop
                                    Now
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <div style="display: flex;margin-top: 20px">
                <div class="card bg-dark text-white" style="border: none;width: 50%">
                    <img src="https://cdn.tgdd.vn/Files/2022/07/21/1449414/alienwarem17r5anhminhhoa_1280x720-800-resize.jpg"
                         class="card-img" alt="...">
                    <div class="card-img-overlay">
                        <a class="" onclick="window.location.href='/Product?action=allProductList'"
                           style="text-decoration: none;color: white;text-align: center"><h5 class="card-title"
                                                                                             style="margin-top: 150px;font-size: 30px">
                            Alienware Desktops</h5>
                        </a>
                    </div>
                </div>
                <div class="card bg-dark text-white" style="border: none;width: 50%">
                    <img src="https://cdn.tgdd.vn/Files/2022/03/30/1423113/laptop-alienware-x15-r2_1280x720-800-resize.png"
                         class="card-img" alt="...">
                    <div class="card-img-overlay">
                        <a class="" onclick="window.location.href='/Product?action=allProductList'"
                           style="text-decoration: none;color: white;text-align: center"><h5 class="card-title"
                                                                                             style="margin-top: 150px;font-size: 30px">
                            Alienware Desktops</h5>
                        </a>
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
                <button class="btn" onclick="window.location.href='/Product?action=allProductList'"
                        style="margin-top: 5%;margin-left: 2%;border: 2px solid white;color: white">Shop
                    Now</button>
            </div>
        </div>
        <div class="" style="display: flex">
            <div class=" text-center" style="width: 34em;">
                <div class="">
                    <img  style="" src="https://dlcdnwebimgs.asus.com/gain/6D83B350-83FE-4AFF-96A9-69693B9B255E/w750/h470"
                         class="card-img" alt="...">

                </div>
            </div>
            <div class=" text-center" style="width: 34em;">
                <div class="">
                    <img src="https://dlcdnwebimgs.asus.com/gain/4BB18AEF-347E-4DB6-B78C-C0FFE1F20385/w750/h470"
                         class="card-img" alt="...">
                </div>
            </div>

            <div class=" text-end" style="width: 34rem;">
                <div class="">
                    <img   src="  https://dlcdnwebimgs.asus.com/gain/08B956D7-479C-4E95-B8A1-43A1E814CD23/w750/h470"
                         class="card-img" alt="...">
                </div>
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
                <button class="btn" onclick="window.location.href='/Product?action=allProductList'"
                        style="margin-left: 60%;border: 2px solid white;color: white">Shop
                    Now
                </button>
            </div>

        </div>
        <div class="card bg-dark text-white" style=";border: none;margin: 0 auto;padding: 0">
            <img style="width: 100%;"
                 src="https://storage-asset.msi.com/global/picture/banner/banner_16728852160dff2b86896b25756c0a876424c3d928.jpeg"
                 class="card-img"
                 alt="...">
            <div class="card-img-overlay">
                <button class="btn" onclick="window.location.href='/Product?action=allProductList'"
                        style="margin-left: 20%;margin-top: 25%;border: 2px solid black;color: white">Shop
                    Now
                </button>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/footer_admin.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>