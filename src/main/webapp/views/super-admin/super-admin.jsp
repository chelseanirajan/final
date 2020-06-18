<%@include file="header.jsp"%>
<div class="container">
    <div class="d-inline-block bg-warning" style="width:170px; height: 80px;">
        <h3 style="padding-left: 20px">10 <span class="glyphicon glyphicon-user" style="float:right; padding-right: 20px"></span> </h3>
        <p style="padding-left: 20px">Parent</p>
    </div>
    <div class="d-inline-block bg-info" style="margin-left: 100px; width:170px; height: 80px;">
        <h3 style="padding-left: 20px">15 <span class="glyphicon glyphicon-book" style="float:right; padding-right: 20px"></span> </h3>
        <p style="padding-left: 20px">Student</p>
    </div>
    <div class="d-inline-block bg-success" style="margin-left: 100px; width:170px; height: 80px;">
        <h3 style="padding-left: 20px">20 <span class="glyphicon glyphicon-education" style="float:right; padding-right: 20px"></span> </h3>
        <p style="padding-left: 20px">Teacher</p>
    </div>
    <div class="d-inline-block bg-secondary" style="margin-left: 100px; width:170px; height: 80px;">
        <h3 style="padding-left: 20px">20 <span class="glyphicon glyphicon-tasks" style="float:right; padding-right: 20px"></span> </h3>
        <p style="padding-left: 20px"> Subject</p>
    </div>
    <br/><br/>
    <center>
        <form:form action="${applicationContext}/user/student/search">
            <input type="text" name="searchName" placeholder="Search user" />
            <i class="fa fa-search"></i><input type="submit" value="Search" />
        </form:form>

        <form:form action="${applicationContext}/user/student/yearsearch" method="post">
            Select a Category:&nbsp;
            <select name="yearSearch">
                <c:forEach items="${student}" var="category">
                    <option value="${category.year}">
                            ${category.year}
                    </option>
                </c:forEach>
            </select>
            <br/><br/>
            <input type="submit" value="Submit" onclick="resetForm()"/>
        </form:form>
    </center>
    <br>
    <form:form method="POST" action="/user/student/checked" id="formId" >
        <table class="table table-bordered table-hover table-striped" >
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Year</th>
                <th>School Name</th>
                <th>Roll No</th>
                <th>Date of Birth</th>
                <th>Added Date</th>
                <th>Modified Date</th>
                <th>Operation</th>
                <th><input type="checkbox" id="select_all"/> | <input type = "submit" class="uncheck"  onclick="resetForm()" value = "Checked Result" formtarget="_blank"/>
                </th>
            </tr>
            <c:forEach var="student" items="${student}" varStatus="loop">

                <tr>
                    <td>${student.id}</td>
                    <td>${student.name}</td>
                    <td>${student.year}</td>
                    <td>${student.schoolName}</td>
                    <td>${student.rollNo}</td>
                    <td>${student.doB}</td>
                    <td>${student.addedDate}</td>
                    <td>${student.modifiedDate}</td>
                    <td>
                        <a href="/user/student/edit?id=${student.id}" class="btn btn-primary btn-sm">
                            <span class="glyphicon glyphicon-pencil"></span>
                        </a>
                        <a href="/user/student/details?id=${student.id}" class="btn btn-info btn-sm">
                            <span class="glyphicon glyphicon-list-alt"></span>
                        </a>
                        <a href="/user/student/delete?id=${student.id}" class="btn btn-danger btn-sm" onclick="return confirm('Do you want to delete?')">
                            <span class="glyphicon glyphicon-trash"></span>
                        </a>
                    </td>
                    <td><input type="checkbox" name="checkIds" class="checkbox" value="${student.id}">  </td>
                </tr>
            </c:forEach>
        </table>
    </form:form>
</div>

<h1>${message}</h1>
<%@include file="footer.jsp"%>
<script>
    $(document).ready(function(){
        $('#select_all').on('click',function(){
            if(this.checked){
                $('.checkbox').each(function(){
                    this.checked = true;
                });
            }else{
                $('.checkbox').each(function(){
                    this.checked = false;
                });
            }
        });

        $('.checkbox').on('click',function(){
            if($('.checkbox:checked').length == $('.checkbox').length){
                $('#select_all').prop('checked',true);
            }else{
                $('#select_all').prop('checked',false);
            }
        });
    });
    function resetForm() {
        // either you can reload current page or manually uncheck checkboxes.

        window.location.reload();
    }

</script>
