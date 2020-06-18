<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Log in with your account</title>

    <!-- Fontfaces CSS-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/myCss.css"/>
    <link href="${contextPath}/views/super-admin/css/font-face.css" rel="stylesheet" media="all">
    <link href="${contextPath}/views/super-admin/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="${contextPath}/views/super-admin/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="${contextPath}/views/super-admin/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="${contextPath}/views/super-admin/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="${contextPath}/views/super-admin/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="${contextPath}/views/super-admin/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="${contextPath}/views/super-admin/vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="${contextPath}/views/super-admin/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="${contextPath}/views/super-admin/vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="${contextPath}/views/super-admin/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="${contextPath}/views/super-admin/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="${contextPath}/views/super-admin/css/theme.css" rel="stylesheet" media="all">

</head>
<body class="animsition">
<div class="page-wrapper">
    <div class="page-content--bge5">
        <div class="container">
            <div class="login-wrap">
                <div class="login-content">
                    <div class="login-logo">
                        <a href="#">
                            <img src="${contextPath}/views/super-admin/images/icon/logos.png" alt="CoolAdmin">
                        </a>
                    </div>
                    <div class="login-form">
                        <form method="POST" action="${contextPath}/login">
                            <div class="form-group ${error != null ? 'has-error' : ''}">
                                <span>${message}</span>
                                <a><span class="error-message">${error}</span></a>
                                <div class="form-group">
                                    <label>User Name:</label>
                                    <input class="au-input au-input--full" type="username" name="username" placeholder="Username" autofocus="true" />
                                </div>
                                    <div class="form-group">
                                        <label>Password </label>
                                        <input class="au-input au-input--full" type="password" name="password" placeholder="Password">
                                    </div>


                                <div class="login-checkbox">
                                    <label>
                                        <input type="checkbox" name="remember">Remember Me
                                    </label>
                                    <label>
                                        <a href="#">Forgotten Password?</a>
                                    </label>
                                </div>

                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button class="btn btn-lg btn-success btn-block" type="submit">Submit</button>
                                <div class="social-login-content">
                                    <div class="social-button">
                                        <button class="au-btn au-btn--block au-btn--blue m-b-20">register with facebook</button>
                                        <button class="au-btn au-btn--block au-btn--blue2">register with twitter</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="register-link">
                            <p>
                                Already have account?
                                <a href="#">Sign In</a>
                            </p>
                            <p class="mt-5 mb-3 text-muted">&copy; 2019-2020</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- Jquery JS-->
<script src="${contextPath}/views/super-admin/vendor/jquery-3.2.1.min.js"></script>
<!-- Bootstrap JS-->

<script src="${contextPath}/views/super-admin/vendor/bootstrap-4.1/bootstrap.min.js"></script>
<!-- Vendor JS       -->
<script src="${contextPath}/views/super-admin/vendor/slick/slick.min.js">
</script>
<script src="${contextPath}/views/super-admin/vendor/wow/wow.min.js"></script>
<script src="${contextPath}/views/super-admin/vendor/animsition/animsition.min.js"></script>
<script src="${contextPath}/views/super-admin/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
</script>
<script src="${contextPath}/views/super-admin/vendor/counter-up/jquery.waypoints.min.js"></script>
<script src="${contextPath}/views/super-admin/vendor/counter-up/jquery.counterup.min.js">
</script>
<script src="${contextPath}/views/super-admin/vendor/circle-progress/circle-progress.min.js"></script>
<script src="${contextPath}/views/super-admin/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="${contextPath}/views/super-admin/vendor/chartjs/Chart.bundle.min.js"></script>
<script src="${contextPath}/views/super-admin/vendor/select2/select2.min.js">

</script>

<!-- Main JS-->
<script src="${contextPath}/views/super-admin/js/main.js"></script>

</body>

</html>
<!-- end document-->