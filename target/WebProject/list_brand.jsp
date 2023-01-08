<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.model.NumberFormat" %>
<%@ page import="java.util.Map" %><%--
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
      <%
        Map<String,Integer> list_brand = ProductService.getListBrand();
        for(String key: list_brand.keySet()){
      %>
      <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
        <a class="text-decoration-none" href="/Project_CuaHangMuBaoHiem_war/product-by-brand?brand=<%=key%>">
          <div class="cat-item d-flex align-items-center mb-4">
            <div class="overflow-hidden" style="width: 100px; height: 100px;">
              <img class="img-fluid" src="img/cat-1.jpg" alt="">
            </div>
            <div class="flex-fill pl-3">
              <h6><%=key%></h6>
              <small class="text-body"><%=list_brand.get(key)%> Sản phẩm</small>
            </div>
          </div>
        </a>
      </div>
      <%}%>
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
        <form action="/Project_CuaHangMuBaoHiem_war/filter-product" method="get">

          <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
            <input type="checkbox" name="price" class="custom-control-input" id="price-1" value="price-1">
            <label class="custom-control-label" for="price-1">0đ - 500.000đ</label>
            <span class="badge border font-weight-normal"><%=ProductService.getQuantityProduct(0,500000)%></span>
          </div>
          <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
            <input type="checkbox" name="price" class="custom-control-input" id="price-2" value="price-2">
            <label class="custom-control-label" for="price-2">500.000đ - 1.000.000đ</label>
            <span class="badge border font-weight-normal"><%=ProductService.getQuantityProduct(500000,1000000)%></span>
          </div>
          <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
            <input type="checkbox" name="price" class="custom-control-input" id="price-3" value="price-3">
            <label class="custom-control-label" for="price-3">1.000.000đ - 2.000.000đ</label>
            <span class="badge border font-weight-normal"><%=ProductService.getQuantityProduct(1000000,2000000)%></span>
          </div>
          <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
            <input type="checkbox" name="price" class="custom-control-input" id="price-4" value="price-4">
            <label class="custom-control-label" for="price-4">2.000.000đ - 5.000.000đ</label>
            <span class="badge border font-weight-normal"><%=ProductService.getQuantityProduct(2000000,5000000)%></span>
          </div>
          <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
            <input type="checkbox" name="price" class="custom-control-input" id="price-5" value="price-5">
            <label class="custom-control-label" for="price-5">Trên 5.000.000đ</label>
            <span class="badge border font-weight-normal"><%=ProductService.getQuantityProduct(5000000,0)%></span>
          </div>
          <%--                </form>--%>
      </div>
      <!-- Price End -->

      <!-- Star Start -->
      <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Lọc theo sao</span></h5>
      <div class="bg-light p-4 mb-30">
        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
          <input type="checkbox" name="star" class="custom-control-input" id="star-5" value="star-5">
          <label class="custom-control-label" for="star-5">5 sao</label>
          <span class="badge border font-weight-normal"><%=ProductService.getQuantityStarProduct(5)%></span>
        </div>
        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
          <input type="checkbox" name="star" class="custom-control-input" id="star-4" value="star-4">
          <label class="custom-control-label" for="star-4">4 sao</label>
          <span class="badge border font-weight-normal"><%=ProductService.getQuantityStarProduct(4)%></span>
        </div>
        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
          <input type="checkbox" name="star" class="custom-control-input" id="star-3" value="star-3">
          <label class="custom-control-label" for="star-3">3 sao</label>
          <span class="badge border font-weight-normal"><%=ProductService.getQuantityStarProduct(3)%></span>
        </div>
        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
          <input type="checkbox" name="star" class="custom-control-input" id="star-2" value="star-2">
          <label class="custom-control-label" for="star-2">2 sao</label>
          <span class="badge border font-weight-normal"><%=ProductService.getQuantityStarProduct(2)%></span>
        </div>
        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
          <input type="checkbox" name="star" class="custom-control-input" id="star-1" value="star-1">
          <label class="custom-control-label" for="star-1">1 sao</label>
          <span class="badge border font-weight-normal"><%=ProductService.getQuantityStarProduct(1)%></span>
        </div>
      </div>
      <!-- Star End -->
      <input type="submit" value="Lọc" style="width: 150px; margin-left: 96px; color: white; background: #FFD333; border: 1px solid #dee2e6">
      </form>
    </div>
    <!-- Star End -->


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

                  <a class="dropdown-item" href="/Project_CuaHangMuBaoHiem_war/sort?text=new">Mới nhất</a>
                  <a class="dropdown-item" href="/Project_CuaHangMuBaoHiem_war/sort?text=popular">Phổ biến</a>
                  <a class="dropdown-item" href="/Project_CuaHangMuBaoHiem_war/sort?text=rating">Đánh giá cao</a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <% NumberFormat nf = new NumberFormat();
          List<Product> list =ProductService.getData();
          for(Product p : list){
        %>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
          <div class="product-item bg-light mb-4">
            <div class="product-img position-relative overflow-hidden">
              <img class="img-fluid w-100" src="<%=p.getImg().get(0)%>" alt="">
              <div class="product-action">
                <a class="btn btn-outline-dark btn-square" <% if (p.sumQuantity()<=0){%><%}else{%> href="<%="/Project_CuaHangMuBaoHiem_war/Add?id=" +p.getId()%>"<%}%>><i class="fa fa-shopping-cart"></i></a>
                <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                <a class="btn btn-outline-dark btn-square" href="<%="/Project_CuaHangMuBaoHiem_war/detail?id=" +p.getId()%>"><i class="fa fa-search"></i></a>
              </div>
            </div>
            <div class="text-center py-4">
              <a class="h6 text-decoration-none text-truncate" href="<%="/Project_CuaHangMuBaoHiem_war/detail?id=" +p.getId()%>"><%=p.getName()%></a>
              <div class="d-flex align-items-center justify-content-center mt-2">
                <h5><%=nf.numberFormat(p.getPrice())%>đ</h5><h6 class="text-muted ml-2"><del><%=nf.numberFormat(p.getPrice())%>đ</del></h6>

              </div>
              <% if(p.sumQuantity()<=0) {%>Hết hàng<%}else{%> Còn: <%=p.sumQuantity()%><%}%>
              <div class="d-flex align-items-center justify-content-center mb-1">
                <%for (int j=1;j<=p.getStar();j++){%>
                <small class="fa fa-star text-primary mr-1"></small>
                <%}
                  if ((p.getStar()*10)%10!=0){
                %>
                <small class="fa fa-star-half-alt text-primary mr-1"></small>
                <%}%>
                <small>(<%=p.getAmount()%>)</small>
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