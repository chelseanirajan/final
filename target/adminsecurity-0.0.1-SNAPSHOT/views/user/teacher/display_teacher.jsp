<%@include file="../header.jsp" %>
<div class="container">
    <a href="./" class="navbar-brand">${userProfile.username} TEACHER</a>
    <div class="pull-right">
        <p>
            <a href="${contextPath}/user/teacher/add_teacher" class="btn btn-primary">
                <span class="glyphicon glyphicon-plus"/>
            </a>
        </p>
    </div>

    <table class="table table-bordered table-hover table-striped" >
        <tr>
            <th>id</th>
            <th>Full Name</th>
            <th>Address</th>
            <th>Phone No.</th>
            <th>Email ID</th>
            <th>Added_Date</th>
            <th>Modified_Date</th>
            <th>Subject</th>

            <th>Operation</th>
        </tr>
        <c:forEach var="teacher" items="${teacher}" varStatus="loop">

            <tr>
                <td>${teacher.id}</td>
                <td>${teacher.fullName}</td>
                <td>${teacher.address}</td>
                <td>${teacher.phoneNo}</td>
                <td>${teacher.emailId}</td>
                <td>${teacher.addedDate}</td>
                <td>${teacher.modifiedDate}</td>
                <td>${teacher.subject}</td>
                <td>
                    <a href="${contextPath}/user/teacher/edit?id=${teacher.id}" class="btn btn-primary btn-sm">
                        <span class="glyphicon glyphicon-pencil"></span>
                    </a>
                    <a href="${contextPath}/user/teacher/delete?id=${teacher.id}" class="btn btn-danger btn-sm" onclick="return confirm('Do you want to delete?')">
                        <span class="glyphicon glyphicon-trash"></span>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>

</div>
<%@include file="../footer.jsp"%>