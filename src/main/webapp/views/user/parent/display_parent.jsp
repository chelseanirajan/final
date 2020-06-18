<%@include file="../header.jsp" %>
<div class="container">
    <div class="alter alert-info">Parent Info Here !</div>
    <hr>
    <table class="table table-bordered table-hover table-striped" >
            <tr>
                <th>name</th>
                <th>father name</th>
                <th>mother name</th>
                <th>phone</th>
                <th>address</th>
            </tr>
            <c:forEach var="student" items="${student}" varStatus="loop">
                <tr>
                    <td>${student.name}</td>
                    <td>${student.fatherName}</td>
                    <td>${student.motherName}</td>
                    <td class="process">${student.parent.phoneNo}</td>
                    <td>${student.parent.addressAddr}</td>
                </tr>
            </c:forEach>
    </table>

</div>
<%@include file="../footer.jsp"%>