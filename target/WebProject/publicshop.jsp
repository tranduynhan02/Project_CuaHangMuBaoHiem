<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %><%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 11/6/2022
  Time: 9:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>HelmetsShop</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="Free HTML Templates" name="keywords">
  <meta content="Free HTML Templates" name="description">

  <!-- Favicon -->
  <link href="img/favicon.ico" rel="icon">

  <!-- Google Web Fonts -->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

  <!-- Libraries Stylesheet -->
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Customized Bootstrap Stylesheet -->
  <link href="css/style.css" rel="stylesheet">
</head>

<body>

<!-- Header Star -->
<%@ include file="header.jsp"%>
<!-- Header End -->

<!-- Breadcrumb Start -->
<div class="container-fluid">
  <div class="row px-xl-5">
    <div class="col-12">
      <nav class="breadcrumb bg-light mb-30">
        <a class="breadcrumb-item text-dark" href="#">Home</a>
        <a class="breadcrumb-item text-dark" href="#">Shop</a>
        <span class="breadcrumb-item active">Shop List</span>
      </nav>
    </div>
  </div>
</div>
<!-- Breadcrumb End -->


<!-- Categories Start -->
<div class="container-fluid pt-5">
  <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Thể loại</span></h2>
  <div class="row px-xl-5 pb-3">
    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
      <a class="text-decoration-none" href="">
        <div class="cat-item d-flex align-items-center mb-4">
          <div class="overflow-hidden" style="width: 100px; height: 100px;">
            <img class="img-fluid" src="img/cat-1.jpg" alt="">
          </div>
          <div class="flex-fill pl-3">
            <h6>Nón bảo hiểm fullface</h6>
            <small class="text-body">100 Sản phẩm</small>
          </div>
        </div>
      </a>
    </div>
    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
      <a class="text-decoration-none" href="">
        <div class="cat-item img-zoom d-flex align-items-center mb-4">
          <div class="overflow-hidden" style="width: 100px; height: 100px;">
            <img class="img-fluid" src="img/cat-2.jpg" alt="">
          </div>
          <div class="flex-fill pl-3">
            <h6>Nón bảo hiểm 3/4</h6>
            <small class="text-body">100 Sản phẩm</small>
          </div>
        </div>
      </a>
    </div>
    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
      <a class="text-decoration-none" href="">
        <div class="cat-item img-zoom d-flex align-items-center mb-4">
          <div class="overflow-hidden" style="width: 100px; height: 100px;">
            <img class="img-fluid" src="img/cat-3.jpg" alt="">
          </div>
          <div class="flex-fill pl-3">
            <h6>Nón nửa đầu</h6>
            <small class="text-body">100 Sản phẩm</small>
          </div>
        </div>
      </a>
    </div>
    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
      <a class="text-decoration-none" href="">
        <div class="cat-item img-zoom d-flex align-items-center mb-4">
          <div class="overflow-hidden" style="width: 100px; height: 100px;">
            <img class="img-fluid" src="img/cat-4.jpg" alt="">
          </div>
          <div class="flex-fill pl-3">
            <h6>Nón trẻ em</h6>
            <small class="text-body">100 Sản phẩm</small>
          </div>
        </div>
      </a>
    </div>
  </div>
</div>
<!-- Categories End -->


<!-- Shop Start -->
<div class="container-fluid">
  <div class="row px-xl-5">
    <!-- Shop Sidebar Start -->
    <div class="col-lg-3 col-md-4">
      <!-- Price Start -->
      <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Filter by price</span></h5>
      <div class="bg-light p-4 mb-30">
        <form>
          <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
            <input type="checkbox" class="custom-control-input" checked id="price-all">
            <label class="custom-control-label" for="price-all">All Price</label>
            <span class="badge border font-weight-normal">1000</span>
          </div>
          <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
            <input type="checkbox" class="custom-control-input" id="price-1">
            <label class="custom-control-label" for="price-1">$0 - $100</label>
            <span class="badge border font-weight-normal">150</span>
          </div>
          <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
            <input type="checkbox" class="custom-control-input" id="price-2">
            <label class="custom-control-label" for="price-2">$100 - $200</label>
            <span class="badge border font-weight-normal">295</span>
          </div>
          <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
            <input type="checkbox" class="custom-control-input" id="price-3">
            <label class="custom-control-label" for="price-3">$200 - $300</label>
            <span class="badge border font-weight-normal">246</span>
          </div>
          <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
            <input type="checkbox" class="custom-control-input" id="price-4">
            <label class="custom-control-label" for="price-4">$300 - $400</label>
            <span class="badge border font-weight-normal">145</span>
          </div>
          <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
            <input type="checkbox" class="custom-control-input" id="price-5">
            <label class="custom-control-label" for="price-5">$400 - $500</label>
            <span class="badge border font-weight-normal">168</span>
          </div>
        </form>
      </div>
      <!-- Price End -->

      <!-- Star Start -->
      <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Filter by color</span></h5>
      <div class="bg-light p-4 mb-30">
        <form>
          <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
            <input type="checkbox" class="custom-control-input" checked id="color-all">
            <label class="custom-control-label" for="price-all">All Color</label>
            <span class="badge border font-weight-normal">1000</span>
          </div>
          <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
            <input type="checkbox" class="custom-control-input" id="color-1">
            <label class="custom-control-label" for="color-1">5 sao</label>
            <span class="badge border font-weight-normal">150</span>
          </div>
          <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
            <input type="checkbox" class="custom-control-input" id="color-2">
            <label class="custom-control-label" for="color-2">4 sao</label>
            <span class="badge border font-weight-normal">295</span>
          </div>
          <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
            <input type="checkbox" class="custom-control-input" id="color-3">
            <label class="custom-control-label" for="color-3">3 sao</label>
            <span class="badge border font-weight-normal">246</span>
          </div>
          <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
            <input type="checkbox" class="custom-control-input" id="color-4">
            <label class="custom-control-label" for="color-4">2 sao</label>
            <span class="badge border font-weight-normal">145</span>
          </div>
          <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
            <input type="checkbox" class="custom-control-input" id="color-5">
            <label class="custom-control-label" for="color-5">1 sao</label>
            <span class="badge border font-weight-normal">168</span>
          </div>
        </form>
      </div>
      <!-- Star End -->

    </div>
    <!-- Shop Sidebar End -->


    <!-- Shop Product Start -->
    <div class="col-lg-9 col-md-8">
      <div class="row pb-3">
        <div class="col-12 pb-1">
          <div class="d-flex align-items-center justify-content-between mb-4">
            <div>
              <button class="btn btn-sm btn-light"><i class="fa fa-th-large"></i></button>
              <button class="btn btn-sm btn-light ml-2"><i class="fa fa-bars"></i></button>
            </div>
            <div class="ml-2">
              <div class="btn-group">
                <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">Sorting</button>
                <div class="dropdown-menu dropdown-menu-right">
                  <a class="dropdown-item" href="#">Latest</a>
                  <a class="dropdown-item" href="#">Popularity</a>
                  <a class="dropdown-item" href="#">Best Rating</a>
                </div>
              </div>
              <div class="btn-group ml-2">
                <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">Showing</button>
                <div class="dropdown-menu dropdown-menu-right">
                  <a class="dropdown-item" href="#">10</a>
                  <a class="dropdown-item" href="#">20</a>
                  <a class="dropdown-item" href="#">30</a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <% List<Product> list = ProductService.getData();
          for (int i=0;i< list.size();i++){%>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
          <div class="product-item bg-light mb-4">
            <div class="product-img position-relative overflow-hidden">
              <img class="img-fluid w-100" src="<%=list.get(i).getImg()%>" alt="">
              <div class="product-action">
                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                <a class="btn btn-outline-dark btn-square" href="detail.jsp"><i class="fa fa-search"></i></a>
              </div>
            </div>
            <div class="text-center py-4">
              <a class="h6 text-decoration-none text-truncate" href=""><%=list.get(i).getName()%>></a>
              <div class="d-flex align-items-center justify-content-center mt-2">
                <h5><%=list.get(i).getPrice()%></h5><h6 class="text-muted ml-2"><del><%=list.get(i).getPrice()%></del></h6>
              </div>
              <div class="d-flex align-items-center justify-content-center mb-1">
                <small class="fa fa-star text-primary mr-1"></small>
                <small class="fa fa-star text-primary mr-1"></small>
                <small class="fa fa-star text-primary mr-1"></small>
                <small class="fa fa-star text-primary mr-1"></small>
                <small class="fa fa-star text-primary mr-1"></small>
                <small>(99)</small>
              </div>
            </div>
          </div>
        </div>
        <%}%>
        <div class="col-12">
          <nav>
            <ul class="pagination justify-content-center">
              <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
              <li class="page-item active"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
          </nav>
        </div>
      </div>
    </div>
    <!-- Shop Product End -->
  </div>
</div>
<!-- Shop End -->


<!-- Footer Start -->
<%@ include file="footer.jsp"%>
<!-- Footer End -->


<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="mail/jqBootstrapValidation.min.js"></script>
<script src="mail/contact.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>

</html>