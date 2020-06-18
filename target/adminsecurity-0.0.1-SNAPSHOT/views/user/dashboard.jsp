<%@include file="header.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="overview-wrap">
                <h2 class="title-1">overview</h2>
                <button class="au-btn au-btn-icon au-btn--blue">
                    <a style="color: white" href="/user/student"><i class="zmdi zmdi-plus"></i>add student</a>
                </button>
            </div>
        </div>
    </div>
    <br>
    <hr>
    <%--
    <div class="row m-t-25">
        <div class="col-sm-6 col-lg-3">
            <div class="overview-item overview-item--c1">
                <div class="overview__inner">
                    <div class="overview-box clearfix">
                        <div class="icon">
                            <i class="zmdi zmdi-local-library"></i>
                        </div>
                        <div class="text">
                            <h2>10368</h2>
                            <span>students online</span>
                        </div>
                    </div>
                    <div class="overview-chart">
                        <canvas id="widgetChart1"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-3">
            <div class="overview-item overview-item--c2">
                <div class="overview__inner">
                    <div class="overview-box clearfix">
                        <div class="icon">
                            <i class="zmdi zmdi-account-o"></i>
                        </div>
                        <div class="text">
                            <h2>388</h2>
                            <span>total teachers</span>
                        </div>
                    </div>
                    <div class="overview-chart">
                        <canvas id="widgetChart2"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-3">
            <div class="overview-item overview-item--c3">
                <div class="overview__inner">
                    <div class="overview-box clearfix">
                        <div class="icon">
                            <i class="zmdi zmdi-calendar-note"></i>
                        </div>
                        <div class="text">
                            <h2>1,086</h2>
                            <span>subject</span>
                        </div>
                    </div>
                    <div class="overview-chart">
                        <canvas id="widgetChart3"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-3">
            <div class="overview-item overview-item--c4">
                <div class="overview__inner">
                    <div class="overview-box clearfix">
                        <div class="icon">
                            <i class="zmdi zmdi-accounts-alt"></i>
                        </div>
                        <div class="text">
                            <h2>1,060</h2>
                            <span>total parents</span>
                        </div>
                    </div>
                    <div class="overview-chart">
                        <canvas id="widgetChart4"></canvas>
                    </div>
                </div>
            </div>

        </div>
        </div>
         --%>

        <form:form action="${applicationContext}/user/student/search">
            <div class="input-group" style="width: 50%;">
                <select name="searchName" class="form-control">
                    <option value="">Please Select Year............</option>
                    <c:forEach items="${category}" var="category">
                        <option value="${category.longValue()}">
                                ${category.longValue()}
                        </option>
                    </c:forEach>
                </select>
                <div class="input-group-btn">
                    <button class="btn btn-primary" type="submit" onclick="resetForm()">
                        <i class="glyphicon glyphicon-search"></i></button>
                </div>
            </div>

        </form:form>
    <br>

    <form:form method="POST" action="/user/student/checked" id="formId" >
    <form:errors class="error-message" path="checkbox"></form:errors>
    <table class="table table-bordered table-hover table-striped" >
        <thead class="table-dark">
        <tr>
            <th>Name</th>
            <th>Year</th>
            <th>Father Name</th>
            <th>Roll No</th>
            <th>Date of Birth</th>
            <th>Added Date</th>
            <th>Modified Date</th>
            <th>Operation</th>
            <th><input type="checkbox" id="select_all"/>|
                <input type = "submit" class="btn-success" id="checkbox"  onsubmit="return validateform()"
                       onclick="resetForm()" value = "C R" formtarget="_blank"/>
            </th>
        </tr>
        </thead>
        <c:forEach var="student" items="${student}" varStatus="loop">

            <tr>
                <td>${student.name}</td>
                <td>${student.year}</td>
                <td>${student.fatherName}</td>
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
                <td><input type="checkbox" name="checkIds" id="ck" class="checkbox" value="${student.id}">  </td>
            </tr>
        </c:forEach>
    </table>
    </form:form>
</div>
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
