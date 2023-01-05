<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.model.NumberFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

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
    <style>
        .error{
            color: red;
            font-size: 14px;
        }
    </style>
</head>

<body>

    <!-- Header Star -->
    <%@include file="header.jsp"%>
    <!-- Header End -->


    <!-- Breadcrumb Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-12">
                <nav class="breadcrumb bg-light mb-30">
                    <a class="breadcrumb-item text-dark" href="index.html">Trang Chủ</a>
                    <a class="breadcrumb-item text-dark" href="#">Cửa hàng</a>
                    <span class="breadcrumb-item active">Thanh Toán</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->


    <!-- Checkout Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-lg-8">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">ĐỊA CHỈ THANH TOÁN</span></h5>
                <div class="bg-light p-30 mb-5">
                    <%String error = (String)request.getAttribute("error");
                    if(error == "error") error = "* Vui lòng nhập đầy đủ thông tin";
                    if(error == null) error ="";
                        String name = request.getParameter("name");
                        String email = request.getParameter("email");
                        String phone = request.getParameter("phone");
                        String address = request.getParameter("address");
                        name = name==null?"":name;
                        email=email==null?"":email;
                        phone=phone==null?"":phone;
                        address = address== null?"":address;
                    %>
                    <form action="/Project_CuaHangMuBaoHiem_war/add_bill" method="get">
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Tên</label>
                            <input name="name" class="form-control" value="<%=name%>" type="text" placeholder="">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>E-mail</label>
                            <input name="email" class="form-control" value="<%=email%>" type="text" placeholder="">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Số điện thoại</label>
                            <input name="phone" class="form-control" value="<%=phone%>" type="text" placeholder="">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Địa chỉ</label>
                            <input name="address" class="form-control" value="<%=address%>" type="text" placeholder="">
                        </div>

                    </div>
                    <div><span id="error" class="error"><%=error%></span></div>
                    <div><small style="color: red;">* Thanh toán khi nhận hàng</small></div>
                    <div class="bg-light p-30">
                        <input type="submit" class="btn btn-block btn-primary font-weight-bold py-3" value="Đặt hàng" style="margin-left: 360px;width: 186px">
                    </div>
                    </form>
                </div>
                
            </div>
            <div class="col-lg-4">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">TỔNG ĐƠN HÀNG</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="border-bottom">
                        <h6 class="mb-3">Các sản phẩm</h6>
                        <%NumberFormat nf = new NumberFormat();%>
                        <%for(Product p: cart.getListProduct()){%>
                        <div class="d-flex justify-content-between">
                            <p><%=p.getName()%></p>
                            <p><%=nf.numberFormat(p.getPrice()*(1-(long)p.getDiscount()))%></p>
                        </div>
                        <%}%>
                    </div>
                    <div class="border-bottom pt-3 pb-2">
                        <div class="d-flex justify-content-between mb-3">
                            <h6>Tổng tiền hàng</h6>
                            <%
                                long price = 0;
                                for(Product p:cart.getListProduct()){
                                    price += p.getPrice()*(1-(long)p.getDiscount());
                                }%>
                            <h6><%=nf.numberFormat(price)%></h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Phí vận chuyển</h6>
                            <h6 class="font-weight-medium">50.000đ</h6>
                        </div>
                    </div>
                    <div class="pt-2">
                        <div class="d-flex justify-content-between mt-2">
                            <h5>Tổng thanh toán</h5>
                            <h5><%=nf.numberFormat(price+50000)%></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Checkout End -->

    <!-- Footer Start -->
    <%@include file="footer.jsp" %>
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