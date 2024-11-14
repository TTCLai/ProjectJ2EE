<%-- 
    Document   : FormEdit
    Created on : Oct 19, 2024, 10:08:49 AM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
          <![endif]-->
        
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
                                            <a href="${pageContext.request.contextPath}/TaiNhanVien">Tài khoản nhân viên</a>

                                        </li>
                                        <li>
                                            <a href="media_gallery.html">> <span>Danh sách nhân viên</span></a>
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
                                    <a href="price.html"><i class="fa fa-cubes"></i>
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
                    <!-- end topbar -->
                    <!-- dashboard inner -->
                    <div class="midde_cont">
                        <div class="container-fluid">
                            <div class="row column_title">
                                <div class="col-md-12">
                                    <div class="page_title">
                                        <h2>Admin</h2>
                                    </div>
                                </div>
                            </div>
                            <!-- table section -->
                            <div class="col-md-16">
                                <div class="white_shd full margin_bottom_30">
                                    <div class="full graph_head">
                                        <div class="heading1 margin_0">

                                        </div>
                                    </div>
                                  
                                        <h2 style="margin-left: 20px ; margin-top: 50px;margin-bottom: -40px">Chỉnh sửa nhân viên</h2>
                                        <form action="SuaNhanVien" method="post" enctype="multipart/form-data">
                                            <div class="table_section padding_infor_info">
                                                <br/><br/>  <br/> <div class="mb-3">
                                                    <label for="employeeid" class="form-label">Mã Nhân Viên</label>
                                                    <input type="number" class="form-control" id="employeeid" name="employeeid" required placeholder="Nhập mã nhân viên"
                                                           value="${employee.employeeid}" readonly>
                                                </div>
                                                
                                                <div class="mb-3">
                                                    <label for="fullname" class="form-label">Họ Tên</label>
                                                    <input type="text" class="form-control" id="fullname" name="fullname" required placeholder="Nhập họ tên"
                                                           value="${employee.fulname}">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="img" class="form-label">Ảnh</label>
                                                    <input type="file" class="form-control" id="img" name="img" accept="image/*" required value="${detail.img}">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="password" class="form-label">Mật Khẩu</label>
                                                    <input type="password" class="form-control" id="password" name="password" required placeholder="Nhập mật khẩu"
                                                           value="${employee.password}">
                                                </div>
                                                <div class="mb-3">

                                                    <label for="gender" class="form-label">Giới Tính</label>
                                                    <select class="form-select" id="gender" name="gender" required ">
                                                        <option value="">Chọn giới tính</option>
                                                        <option value="0"<c:if test="${employee.gender == 0}">selected</c:if>>Nam</option>
                                                        <option value="1"<c:if test="${employee.gender == 1}">selected</c:if>>Nữ</option>
                                                    </select>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="birthday" class="form-label">Ngày Sinh</label>
                                                    <input type="date" class="form-control" id="birthday" name="birthday" required value="${employee.birthday}">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="phonenumber" class="form-label">Số Điện Thoại</label>
                                                    <input type="tel" class="form-control" id="phonenumber" name="phonenumber" required placeholder="Nhập số điện thoại"
                                                           value="${employee.phonenumber}">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="salary" class="form-label">Lương</label>
                                                    <input type="number" class="form-control" id="salary" name="salary" placeholder="Nhập lương" min="0" step="0.01"
                                                           value="${employee.salary}">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="address" class="form-label">Địa Chỉ</label>
                                                    <input type="text" class="form-control" id="address" name="address" placeholder="Nhập địa chỉ"
                                                           value="${employee.address}">
                                                </div>
                                                <button type="submit" value="submit" class="btn btn-primary">Edit</button>
                                                 <button type="button" class="btn btn-secondary" onclick="window.location.href='TaiNhanVien';">Close</button>
                                            </div>
                                        </form>
                                    </div>

                             

                            </div>
                        </div>
                        <!-- table section -->
                    </div>

                    <!-- end dashboard inner -->
                </div>
                <!--                <div>
                                    <button class="btn-admin btnAddAdmin">
                                        <a href="FormAdd.jsp">
                                            <i class="fa fa-plus"></i>
                                            <span class="btn-text">Create</span>
                                        </a>
                                    </button>
                                    <button class="btn-admin btnDelAdmin" onclick="confirmDelete()">
                
                                        <i class="fa fa-trash"></i>
                                        <span class="btn-text">Delete</span>
                
                                    </button>
                                </div>-->
            </div>
        </div>

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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </body>

</html>