<%@include file="header.jsp"%>
<div class="main-content">
    <div class="section__content section__content--p30">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <!-- DATA TABLE -->
                    <h3 class="title-5 m-b-35">Teacher Records</h3>
                    <div class="table-data__tool">
                        <div class="table-data__tool-left">
                            <div class="rs-select2--light rs-select2--md">
                                <select class="js-select2" name="property">
                                    <option selected="selected">All Properties</option>
                                    <option value="">Option 1</option>
                                    <option value="">Option 2</option>
                                </select>
                                <div class="dropDownSelect2"></div>
                            </div>
                            <div class="rs-select2--light rs-select2--sm">
                                <select class="js-select2" name="time">
                                    <option selected="selected">Today</option>
                                    <option value="">3 Days</option>
                                    <option value="">1 Week</option>
                                </select>
                                <div class="dropDownSelect2"></div>
                            </div>
                            <button class="au-btn-filter">
                                <i class="zmdi zmdi-filter-list"></i>filters</button>
                        </div>
                        <div class="table-data__tool-right">
                            <button class="au-btn au-btn-icon au-btn--green au-btn--small">
                                <i class="zmdi zmdi-plus"></i>add item</button>
                            <div class="rs-select2--dark rs-select2--sm rs-select2--dark2">
                                <select class="js-select2" name="type">
                                    <option selected="selected">Export</option>
                                    <option value="">Option 1</option>
                                    <option value="">Option 2</option>
                                </select>
                                <div class="dropDownSelect2"></div>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive table-responsive-data2">
                        <table class="table table-data2">
                            <thead>
                            <tr>
                                <th>name</th>
                                <th>phone no</th>
                                <th>email</th>
                                <th>added date</th>
                                <th>modified date</th>
                                <th>subject</th>
                                <th>address</th>
                                <th></th>
                            </tr>
                            </thead>
                            <c:forEach var="teacher" items="${teacher}" varStatus="loop">
                                <tbody>
                                <tr class="tr-shadow">
                                    <td>${teacher.fullName}</td>
                                    <td class="desc">${teacher.phoneNo}</td>
                                    <td>${teacher.emailId}</td>
                                    <td>${teacher.addedDate}</td>
                                    <td>${teacher.modifiedDate}</td>
                                    <td>${teacher.subject}</td>
                                    <td>${teacher.address}</td>
                                    <td>
                                        <div class="table-data-feature">
                                            <a href="${contextPath}/super-admin/teacher/edit?id=${teacher.id}" data-placement="top"
                                               title="edit" class="item" data-toggle="tooltip">
                                                <i class="zmdi zmdi-edit"></i>
                                            </a>
                                            <a href="${contextPath}/super-admin/teacher/delete?id=${teacher.id}" data-placement="top"
                                               title="delete" class="item" data-toggle="tooltip" onclick="return confirm('Do you want to delete?')">
                                                <i class="zmdi zmdi-delete"></i>
                                            </a>
                                            <a href="#" data-placement="top"
                                               title="more" class="item" data-toggle="tooltip">
                                                <i class="zmdi zmdi-more"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="spacer"></tr>
                                </tbody>
                            </c:forEach>

                        </table>
                    </div>
                    <!-- END DATA TABLE -->
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="copyright">
                        <p>Copyright © 2018 Colorlib. All rights reserved. Template by <a href="https://colorlib.com">Colorlib</a>.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%@include file="footer.jsp"%>