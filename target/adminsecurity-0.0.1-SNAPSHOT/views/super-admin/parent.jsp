<%@include file="header.jsp"%>
<div class="main-content">
    <div class="section__content section__content--p30">
        <div class="container-fluid">

            <div class="row m-t-30">
                <div class="col-md-12">
                    <!-- DATA TABLE-->
                    <div class="table-responsive m-b-40">
                        <table class="table table-borderless table-data3">
                            <thead>
                            <tr>
                                <th>name</th>
                                <th>father name</th>
                                <th>mother name</th>
                                <th>phone</th>
                                <th>address</th>
                            </tr>
                            </thead>
                            <c:forEach var="student" items="${student}" varStatus="loop">
                            <tbody>
                            <tr>
                                <td>${student.name}</td>
                                <td>${student.fatherName}</td>
                                <td>${student.motherName}</td>
                                <td class="process">${student.parent.phoneNo}</td>
                                <td>${student.parent.addressAddr}</td>
                            </tr>
                            </tbody>
                            </c:forEach>
                        </table>
                    </div>
                    <!-- END DATA TABLE-->
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