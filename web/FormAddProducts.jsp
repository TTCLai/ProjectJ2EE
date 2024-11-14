<%-- 
    Document   : employeedeatails
    Created on : Oct 16, 2024, 8:57:56 AM
    Author     : LENOVO
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- mobile metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="viewport" content="initial-scale=1, maximum-scale=1" />
        <!-- site metas -->
        <title>Pluto - Responsive Bootstrap Admin Panel Templates</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!-- site icon -->
        <link rel="icon" href="images/fevicon.png" type="image/png" />
        <!-- bootstrap css -->
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <!-- site css -->
        <link rel="stylesheet" href="style.css" />
        <!-- responsive css -->
        <link rel="stylesheet" href="css/responsive.css" />
        <!-- color css -->
        <link rel="stylesheet" href="css/colors.css" />
        <!-- select bootstrap -->
        <link rel="stylesheet" href="css/bootstrap-select.css" />
        <!-- scrollbar css -->
        <link rel="stylesheet" href="css/perfect-scrollbar.css" />
        <!-- custom css -->
        <link rel="stylesheet" href="css/custom.css" />

        <!-- link icon  -->
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
          <![endif]-->


        <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script> -->
        <style>
            #imagePreview {
                width: 100%;
                height: 300px;
                border: 1px solid #ddd;
                display: flex;
                justify-content: center;
                align-items: center;
                overflow: hidden;
            }

            #imagePreview img {
                max-width: 100%;
                max-height: 100%;
                object-fit: contain;
            }

            .container mt-5 {
                margin: 30px;

            }
            .container{
                width: 98%;

                margin: 10px;

            }
        </style>

    </head>

    <body class="dashboard dashboard_1">
        <div class="full_container">
            <div class="inner_container">
                <!-- Sidebar  -->
                <nav id="sidebar">
                    <div class="sidebar_blog_1">
                        <div class="sidebar-header">
                            <div class="logo_section">
                                <a href="index.html"><img class="logo_icon img-responsive" src="images/logo/logo_icon.png" alt="#" /></a>
                            </div>
                        </div>
                        <div class="sidebar_user_info">
                            <div class="icon_setting"></div>
                            <c:if test="${sessionScope.ad!=null}">
                                <div class="user_profle_side">
                                    <div class="user_img">
                                        <img class="img-responsive" src="images/layout_img/user_img.jpg" alt="#" />
                                    </div>
                                    <div class="user_info">
                                        <h6>${sessionScope.ad.username}</h6>
                                        <p><span class="online_animation"></span> Online</p>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.emp!=null}">
                                <div class="user_profle_side">
                                    <div class="user_img">
                                        <img class="img-responsive" src="images/layout_img/user_img.jpg" alt="#" />
                                    </div>
                                    <div class="user_info">
                                        <h6>${sessionScope.emp.fullname}</h6>
                                        <p><span class="online_animation"></span> Online</p>
                                    </div>
                                </div>
                            </c:if>

                        </div>
                    </div>
                    <div class="sidebar_blog_2">
                        <!--                        <h4>General</h4>-->
                        <ul class="list-unstyled components">
                            <c:if test="${role=='admin'}">
                                <li class="active">
                                    <a href="index.html"><i class="fa fa-dashboard "></i>
                                        <span>Tổng quan</span></a>
                                </li>
                                <li>
                                    <a href="#element" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i
                                            class="fa fa-group "></i>
                                        <span>Nhân viên</span></a>
                                    <ul class="collapse list-unstyled" id="element">
                                        <li>
                                            <a href="">Tài khoản nhân viên</a>

                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/TaiNhanVien">>><span>Danh sách nhân viên</span></a>
                                        </li>
                                        <li>
                                            <a href="media_gallery.html">> <span>Lương</span></a>
                                        </li>

                                    </ul>
                                </li>
                                <li>
                                    <a href="tables.html"><i class="fa fa-money "></i>
                                        <span>Doanh thu</span></a>
                                </li>
                                <li>
                                    <a href="#apps" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i
                                            class="fa fa-object-group"></i>
                                        <span>Cửa hàng</span></a>
                                    <ul class="collapse list-unstyled" id="apps">
                                        <li>
                                            <a href="email.html">> <span>Kho</span></a>
                                        </li>
                                        <li>
                                            <a href="calendar.html">> <span>Chi phí</span></a>
                                        </li>

                                    </ul>
                                </li>
                                <li>
                                    <a href="products.jsp"><i class="fa fa-cubes"></i>
                                        <span>Sản phẩm</span></a>
                                </li>
                                <li>
                                    <a href="contact.html">
                                        <i class="fa fa-puzzle-piece"></i>
                                        <span>Loại sản phẩm</span></a>
                                </li>
                                <li>
                                    <a href="widgets.html"><i class="fa fa-user "></i><span>Khách hàng</span></a>
                                </li>

                                <li>
                                    <a href="map.html"><i class="fa fa-square "></i> <span>Đơn hàng</span></a>
                                </li>

                            </c:if>

                            <!-- Chuc nang cua nhan vien -->
                            <c:if test="${role=='employee'}">
                                <li class="active">
                                    <a href="index.html"><i class="fa fa-dashboard "></i>
                                        <span>Tổng quan</span></a>
                                <li>
                                    <a href="price.html"><i class="fa fa-cubes"></i>
                                        <span>Sản phẩm</span></a>
                                </li>
                                <li>
                                    <a href="contact.html">
                                        <i class="fa fa-puzzle-piece"></i>
                                        <span>Loại sản phẩm</span></a>
                                </li>
                                </li>
                                <li>
                                    <a href="widgets.html"><i class="fa fa-user "></i><span>Khách hàng</span></a>
                                </li>

                                <li>
                                    <a href="map.html"><i class="fa fa-square "></i> <span>Đơn hàng</span></a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </nav>
                <!-- end sidebar -->
                <!-- right content -->

                <div id="content">
                    <!-- topbar -->
                    <div class="topbar">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <div class="full">
                                <button type="button" id="sidebarCollapse" class="sidebar_toggle">
                                    <i class="fa fa-bars"></i>
                                </button>
                                <div class="logo_section">
                                    <a href="index.html"><img class="img-responsive" src="images/logo/logo.png" alt="#" /></a>
                                </div>
                                <div class="right_topbar">
                                    <div class="icon_info">
                                        <ul>
                                            <li>
                                                <a href="#"><i class="fa fa-bell-o"></i><span class="badge">2</span></a>
                                            </li>
                                            <li>
                                                <a href="#"><i class="fa fa-question-circle"></i></a>
                                            </li>
                                            <li>
                                                <a href="#"><i class="fa fa-envelope-o"></i><span class="badge">3</span></a>
                                            </li>
                                        </ul>
                                        <ul class="user_profile_dd">
                                            <c:if test ="${sessionScope.ad!= null}">
                                                <li>
                                                    <a class="dropdown-toggle" data-toggle="dropdown"><img class="img-responsive rounded-circle"
                                                                                                           src="images/layout_img/user_img.jpg" alt="#" /><span class="name_user">${sessionScope.ad.username}</span></a>
                                                    <div class="dropdown-menu">
                                                        <a class="dropdown-item" href="profile.html">My Profile</a>
                                                        <a class="dropdown-item" href="settings.html">Settings</a>
                                                        <a class="dropdown-item" href="help.html">Help</a>
                                                        <a class="dropdown-item" href="DangXuat"><span>Log Out</span> <i class="fa fa-sign-out"></i></a>
                                                    </div>
                                                </li>
                                            </c:if>
                                            <c:if test ="${sessionScope.emp!=null}">
                                                <li>
                                                    <a class="dropdown-toggle" data-toggle="dropdown"><img class="img-responsive rounded-circle"
                                                                                                           src="images/layout_img/user_img.jpg" alt="#" /><span class="name_user">${sessionScope.emp.fullname}</span></a>
                                                    <div class="dropdown-menu">
                                                        <a class="dropdown-item" href="profile.html">My Profile</a>
                                                        <a class="dropdown-item" href="settings.html">Settings</a>
                                                        <a class="dropdown-item" href="help.html">Help</a>
                                                        <a class="dropdown-item" href="DangXuat"><span>Log Out</span> <i class="fa fa-sign-out"></i></a>
                                                    </div>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>


        </div>
        <div style" margin-top: 25px;margin-bottom: 25px;" class="container">
        <div style="background-color: white;" class="container mt-5">
            <div>
                <h3 class="fw-bold mb-3">Thêm Sản Phẩm</h3>
                <h6 class="op-7 mb-2">Pulo</h6>
            </div>
            <br>

            <form action="ThemSanPham" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="productName" class="form-label">Tên Sản Phẩm</label>
                            <input type="text" class="form-control" id="productname" name="productname" required>
                        </div>
                        <div class="mb-3">
                            <label for="price" class="form-label">Giá</label>
                            <input type="text" class="form-control" id="price" name="price" required>
                        </div>
                        <div class="mb-3">
                            <label for="quantity" class="form-label">Số Lượng</label>
                            <input type="text" class="form-control" id="quantity" name="quantity" required>
                        </div>
                        <div class="mb-3">
                                <label for="categoryId" class="form-label" href="LayLoaiSanPham">Chọn Loại Sản Phẩm</label>
                                <select class="form-select" id="categoryid" name="categoryid" required>
                                    <option value="" style="width: 90px">Loại</option>
                                    <c:forEach var="type" items="${listCC}">
                                        <option value="${type.categoryid}">${type.categoryname}</option>
                                    </c:forEach>
                                </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="img" class="form-label">Chọn Hình Ảnh Sản Phẩm</label>
                            <input type="file" class="form-control" id="productimg" name="productimg" accept="image/*" onchange="previewImage(event)">
                        </div>
                        <div id="imagePreview" class="mb-3">
                            <p>Image preview will appear here</p>
                        </div>
                    </div>
                </div>
                <button style="margin-bottom: 20px; width: 150px" type="submit" class="btn btn-primary">Thêm Sản Phẩm</button>
                <a style="float: right;" href="TaiNhanVien">Quay lại trang</a>
                </form>
        </div>
    </div>
    <br>

        <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script> -->
        <script>
            function previewImage(event) {
                var reader = new FileReader();
                reader.onload = function () {
                    var output = document.createElement('img');
                    output.src = reader.result;
                    var preview = document.getElementById('imagePreview');
                    preview.innerHTML = '';
                    preview.appendChild(output);
                };
                reader.readAsDataURL(event.target.files[0]);
            }
        </script>

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- wow animation -->
        <script src="js/animate.js"></script>
        <!-- select country -->
        <script src="js/bootstrap-select.js"></script>
        <!-- owl carousel -->
        <script src="js/owl.carousel.js"></script>
        <!-- chart js -->
        <script src="js/Chart.min.js"></script>
        <script src="js/Chart.bundle.min.js"></script>
        <script src="js/utils.js"></script>
        <script src="js/analyser.js"></script>
        <!-- nice scrollbar -->
        <script src="js/perfect-scrollbar.min.js"></script>
        <script>
            var ps = new PerfectScrollbar("#sidebar");
        </script>
        <!-- custom js -->
        <script src="js/custom.js"></script>
        <script src="js/chart_custom_style1.js"></script>
        <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
        <script>
            function confirmDelete() {
                const checkboxes = document.querySelectorAll('input[name="employeeid"]:checked');
                if (checkboxes.length === 0) {
                    alert('Please select at least one employee to delete.');
                    return;
                }
                if (confirm('Are you sure you want to delete the selected employees?')) {
                    document.getElementById('deleteForm').submit();
                }
            }
        </script>
        <script>
            function editSelectedEmployee() {
                const checkboxes = document.querySelectorAll('input[name="employeeid"]:checked');
                if (checkboxes.length === 0) {
                    alert("Vui lòng chọn ít nhất một nhân viên để chỉnh sửa.");
                    return;
                }

                // Lấy ID nhân viên được chọn
                const employeeId = checkboxes[0].value; // Lấy ID của nhân viên đầu tiên được chọn
                window.location.href = `FormEdit.jsp?employeeid=${employeeid}`; // Chuyển hướng đến trang chỉnh sửa
            }
        </script>

    </body>

</html>