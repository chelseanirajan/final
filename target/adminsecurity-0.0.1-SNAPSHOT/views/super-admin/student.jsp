<%@include file="header.jsp"%>

<!-- MAIN CONTENT-->
<div class="main-content">
    <div class="section__content section__content--p30">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <!-- DATA TABLE -->
                    <h3 class="title-5 m-b-35">student table</h3>
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
                        <form:form method="POST" action="/user/student/checked" id="formId" >
                        <table class="table table-data2">
                            <thead>
                            <tr>
                                <th>
                                    <input type="checkbox" id="select_all"/>
                                    <input type = "submit" id="uncheck" class="btn btn-success"  onclick="resetForm()" value = "CR" formtarget="_blank"/>

                                </th>
                                <th>name</th>
                                <th>symbol no</th>
                                <th>school name</th>
                                <th>added date</th>
                                <th>modified date</th>
                                <th>dob</th>
                                <th>roll no</th>
                                <th></th>
                            </tr>
                            </thead>
                            <c:forEach var="student" items="${student}" varStatus="loop">
                            <tbody>
                            <tr class="tr-shadow">
                                <td><input type="checkbox" name="checkIds" class="checkbox" value="${student.id}"> </td>
                                <td>${student.name}</td>
                                <td>${student.year}</td>
                                <td class="desc">${student.schoolName}</td>
                                <td>${student.addedDate}</td>
                                <td>${student.modifiedDate}</td>
                                <td>${student.doB}</td>
                                <td>${student.rollNo}</td>
                                <td>
                                    <div class="table-data-feature">
                                        <a href="${contextPath}/super-admin/edit?id=${student.id}"data-placement="top"
                                           title="edit" class="item" data-toggle="tooltip">
                                            <i class="zmdi zmdi-edit"></i>
                                        </a>
                                        <a href="${contextPath}/super-admin/details?id=${student.id}" data-placement="top"
                                           title="details" class="item" data-toggle="tooltip">
                                            <i class="fa fa-th-list"></i>
                                        </a>
                                        <a href="${contextPath}/super-admin/delete?id=${student.id}" data-placement="top"
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
                        </form:form>
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
