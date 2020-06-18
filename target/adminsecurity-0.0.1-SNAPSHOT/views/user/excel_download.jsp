<%@include file="header.jsp"%>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="overview-wrap">
                    <h2 class="title-1">Get Formatted Blank Sheet</h2>
                    <button class="au-btn au-btn-icon au-btn--blue">
                        <a style="color: white" href="/file"><i class="zmdi zmdi-minus"></i>Blank Sheet</a>
                    </button>
                </div>
            </div>
        </div>
        <br>
        <hr style="color: red; background: red; border: 1px solid red">
        <br>
        <div class="row">
            <div class="col-md-12">
                <h2>
                    Get Yearly ledger Records.
                </h2>
            </div>
        </div>
        <hr>
            <form:form action="${applicationContext}/file/download">
                <div class="input-group" style="width: 50%;">
                    <select name="searchName" class="form-control">
                        <c:forEach items="${student}" var="category">
                            <option value="${category.longValue()}">
                                    ${category.longValue()}
                            </option>
                        </c:forEach>
                    </select>
                    <div class="input-group-btn">
                        <button class="btn btn-primary" type="submit" onclick="resetForm()">
                            <i class="glyphicon glyphicon-list"> Yearly Ledger</i></button>
                    </div>
                </div>

            </form:form>
    </div>
<%@include file="footer.jsp"%>
