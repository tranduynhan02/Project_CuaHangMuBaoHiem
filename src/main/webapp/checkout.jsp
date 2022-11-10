<%--
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

<!-- Header Start -->
<%@include file="header.jsp"%>
<!-- Header End -->


<!-- Breadcrumb Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="#">Trang Chủ</a>
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
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label>Họ</label>
                        <input class="form-control" type="text" placeholder="">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Tên</label>
                        <input class="form-control" type="text" placeholder="">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>E-mail</label>
                        <input class="form-control" type="text" placeholder="">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Số điện thoại</label>
                        <input class="form-control" type="text" placeholder="">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Địa chỉ 1</label>
                        <input class="form-control" type="text" placeholder="">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Địa chỉ 2</label>
                        <input class="form-control" type="text" placeholder="">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Tỉnh/Thành Phố</label>
                        <input class="form-control" type="text" placeholder="">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Quận/Huyện</label>
                        <input class="form-control" type="text" placeholder="">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Xã/Phường</label>
                        <input class="form-control" type="text" placeholder="">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Mã bưu chính</label>
                        <input class="form-control" type="text" placeholder="">
                    </div>
                    <div class="col-md-12 form-group">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="newaccount">
                            <label class="custom-control-label" for="newaccount">Tạo một tài khoản</label>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="shipto">
                            <label class="custom-control-label" for="shipto"  data-toggle="collapse" data-target="#shipping-address">Gửi đến địa chỉ khác</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="collapse mb-5" id="shipping-address">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Địa chỉ giao hàng</span></h5>
                <div class="bg-light p-30">
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Họ</label>
                            <input class="form-control" type="text" placeholder="">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Tên</label>
                            <input class="form-control" type="text" placeholder="">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>E-mail</label>
                            <input class="form-control" type="text" placeholder="">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Số điện thoại</label>
                            <input class="form-control" type="text" placeholder="">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Địa chỉ 1</label>
                            <input class="form-control" type="text" placeholder="">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Địa chỉ 2</label>
                            <input class="form-control" type="text" placeholder="">
                        </div>

                        <div class="col-md-6 form-group">
                            <label>Tỉnh/Thành phố</label>
                            <input class="form-control" type="text" placeholder="">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Quận/Huyện</label>
                            <input class="form-control" type="text" placeholder="">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Xã/Phường</label>
                            <input class="form-control" type="text" placeholder="">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Mã bưu chính</label>
                            <input class="form-control" type="text" placeholder="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">TỔNG ĐƠN HÀNG</span></h5>
            <div class="bg-light p-30 mb-5">
                <div class="border-bottom">
                    <h6 class="mb-3">Các sản phẩm</h6>
                    <div class="d-flex justify-content-between">
                        <p>KYT Venom Thitipong 2016</p>
                        <p>1.990.000đ</p>
                    </div>
                    <div class="d-flex justify-content-between">
                        <p>LS2 Storm Nepa</p>
                        <p>2.900.000đ</p>
                    </div>
                    <div class="d-flex justify-content-between">
                        <p>LS2 Storm Sprinter</p>
                        <p>2.900.000đ</p>
                    </div>
                </div>
                <div class="border-bottom pt-3 pb-2">
                    <div class="d-flex justify-content-between mb-3">
                        <h6>Tổng tiền hàng</h6>
                        <h6>7.790.000đ</h6>
                    </div>
                    <div class="d-flex justify-content-between">
                        <h6 class="font-weight-medium">Phí vận chuyển</h6>
                        <h6 class="font-weight-medium">50.000đ</h6>
                    </div>
                </div>
                <div class="pt-2">
                    <div class="d-flex justify-content-between mt-2">
                        <h5>Tổng thanh toán</h5>
                        <h5>7.840.000đ</h5>
                    </div>
                </div>
            </div>
            <div class="mb-5">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Payment</span></h5>
                <div class="bg-light p-30">
                    <div class="form-group">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="payment" id="paypal">
                            <label class="custom-control-label" for="paypal">Thẻ tín dụng/Ghi nợ</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="payment" id="directcheck">
                            <label class="custom-control-label" for="directcheck">Thanh toán khi nhận hàng</label>
                        </div>
                    </div>
                    <div class="form-group mb-4">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="payment" id="banktransfer">
                            <label class="custom-control-label" for="banktransfer">Thẻ ATM nội địa (Internet Banking)</label>
                        </div>
                    </div>
                    <button class="btn btn-block btn-primary font-weight-bold py-3">Đặt hàng</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Checkout End -->


<!-- Footer Start -->
<%@include file="footer.jsp"%>
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