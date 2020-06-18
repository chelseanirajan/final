<%@include file="header.jsp" %>
<div class="main-content">
    <div class="section__content section__content--p30">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-9">
                    <!-- USER DATA-->
                    <div class="user-data m-b-30">
                        <h3 class="title-3 m-b-30">
                            <i class="zmdi zmdi-account-calendar"></i>user data</h3>
                        <div class="filters m-b-45">
                            <div class="rs-select2--dark rs-select2--md m-r-10 rs-select2--border">
                                <select class="js-select2" name="property">
                                    <option selected="selected">All Properties</option>
                                    <option value="">Students</option>
                                    <option value="">Teachers</option>
                                </select>
                                <div class="dropDownSelect2"></div>
                            </div>
                            <div class="rs-select2--dark rs-select2--sm rs-select2--border">
                                <select class="js-select2 au-select-dark" name="time">
                                    <option selected="selected">All Time</option>
                                    <option value="">By Month</option>
                                    <option value="">By Day</option>
                                </select>
                                <div class="dropDownSelect2"></div>
                            </div>
                        </div>
                        <div class="table-responsive table-data">
                            <table class="table">
                                <thead>
                                <tr>
                                    <td>
                                        <label class="au-checkbox">
                                            <input type="checkbox">
                                            <span class="au-checkmark"></span>
                                        </label>
                                    </td>
                                    <td>name</td>
                                    <td>role</td>
                                    <td>type</td>
                                    <td></td>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="user" items="${user}" varStatus="loop">
                                <tr>
                                    <td>
                                        <label class="au-checkbox">
                                            <input type="checkbox">
                                            <span class="au-checkmark"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <div class="table-data__info">
                                            <h6>${user.username}</h6>
                                            <span> <a href="#">${user.email}</a></span>
                                        </div>
                                    </td>
                                    <td>
                                        <span class="role admin">
                                         <c:forEach var="role" items="${user.roles}" varStatus="loop">
                                             <h5>${role.name}</h5>
                                         </c:forEach>
                                    </span>
                                    </td>
                                    <td>
                                        <div class="rs-select2--trans rs-select2--sm">
                                            <select class="js-select2" name="property">
                                                <option selected="selected">Full Control</option>
                                                <option value="">Post</option>
                                                <option value="">Watch</option>
                                            </select>
                                            <div class="dropDownSelect2"></div>
                                        </div>
                                    </td>
                                    <td>
                                                        <span class="more">
                                                            <i class="zmdi zmdi-more"></i>
                                                        </span>
                                    </td>
                                </tr>
                                </tbody>
                                </c:forEach>
                            </table>
                        </div>
                        <div class="user-data__footer">
                            <button class="au-btn au-btn-load">load more</button>
                        </div>
                    </div>
                    <!-- END USER DATA-->
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="copyright">
                        <p>Copyright © 2018 Colorlib. All rights reserved. Template by <a href="https://colorlib.com">Colorlib</a>.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>