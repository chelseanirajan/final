<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=utf-8" language="java" pageEncoding="UTF-8" %>
<c:set var="tab" value="${pageContext.request.getAttribute('url')}"/>
<c:set var="userProfile" value="${pageContext.request.session.getAttribute('userProfile')}"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>Registration</title>

    <!-- Fontfaces CSS-->
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
                            <img src="images/icon/logo.png" alt="CoolAdmin">
                        </a>
                    </div>
                    <div class="login-form">

                        <form:form action="/super-admin/registration" method="POST" modelAttribute="userForm" class="form-signin">
                            <h2 class="form-signin-heading">Create your account</h2>
                            <spring:bind path="username">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="username" class="form-control" placeholder="Username"
                                                autofocus="true"></form:input>
                                    <form:errors path="username"></form:errors>
                                </div>
                            </spring:bind>

                            <spring:bind path="email">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="email" class="form-control" placeholder="Enter Email Address"
                                                autofocus="true"></form:input>
                                    <form:errors path="email"></form:errors>
                                </div>
                            </spring:bind>



                            <spring:bind path="mobileNo">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="mobileNo" class="form-control" placeholder="PrinciplecMobile No"
                                                autofocus="true"></form:input>
                                    <form:errors path="mobileNo"></form:errors>
                                </div>
                            </spring:bind>


                            <spring:bind path="schoolName">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="schoolName" class="form-control" placeholder="Full School Name"
                                                autofocus="true"></form:input>
                                    <form:errors path="schoolName"></form:errors>
                                </div>
                            </spring:bind>
                            <spring:bind path="schoolAddress">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="schoolAddress" class="form-control" placeholder="School Address"
                                                autofocus="true"></form:input>
                                    <form:errors path="schoolAddress"></form:errors>
                                </div>
                            </spring:bind>

                            <spring:bind path="password">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
                                    <form:errors path="password"></form:errors>
                                </div>
                            </spring:bind>


                            <spring:bind path="passwordConfirm">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="password" path="passwordConfirm" class="form-control"
                                                placeholder="Confirm your password"></form:input>
                                    <form:errors path="passwordConfirm"></form:errors>
                                </div>
                            </spring:bind>
                            <div class="login-checkbox">
                                <label>
                                    <input type="checkbox" name="aggree">Agree the terms and policy
                                </label>
                            </div>
                            <button class="btn btn-lg btn-success btn-block" type="submit">Submit</button>
                            <div class="social-login-content">
                                <div class="social-button">
                                    <button class="au-btn au-btn--block au-btn--blue m-b-20">register with facebook</button>
                                    <button class="au-btn au-btn--block au-btn--blue2">register with twitter</button>
                                </div>
                            </div>
                        </form:form>
                        <div class="register-link">
                            <p>
                                Already have account?
                                <a href="#">Sign In</a>
                            </p>
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