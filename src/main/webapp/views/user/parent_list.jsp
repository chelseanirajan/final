<%@include file="header.jsp"%>
<div class="container">
    <a href="./" class="navbar-brand">${userProfile.username} Parents</a>
    <table class="table table-bordered table-hover table-striped" >
        <tr>
            <th>Id</th>
            <th>Student Name</th>
            <th>Father Name</th>
            <th>Mother Name</th>
            <th>Operation</th>
        </tr>
        <c:forEach var="student" items="${student}" varStatus="loop">

            <tr>
                <td>${student.id}</td>
                <td>${student.name}</td>
                <td>${student.fatherName}</td>
                <td>${student.motherName}</td>
                <td>
                    <a href="${contextPath}/user/parent/add_parent?id=${student.id}" class="btn btn-primary">
                        <span class="glyphicon glyphicon-plus"/>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>

</div>

<%@include file="footer.jsp"%>