<%@include file="../header.jsp" %>
<div class="container">
    <div class="py-5 text-left">
        <h2>Add Parent Record</h2>
    </div>
    <form:form method="post" action="${contextPath}/user/parent/update" modelAttribute="userForm" class="form-signup">
        <div class="row">
            <div class="col-md-4 mb-3">
                <spring:bind path="emailId">
                    <div class="form-group required ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="emailId">Email ID:
                        </label>
                        <form:input type="text" path="emailId" class="form-control"
                                    placeholder="Enter Email Id"
                                    autofocus="true"></form:input>
                        <form:errors class="error-message" path="emailId"></form:errors>
                    </div>
                </spring:bind>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 mb-3">
                <spring:bind path="phoneNo">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="phoneNo">Phone No:</label>
                        <form:input type="text" path="phoneNo" class="form-control"
                                    placeholder="Phone No"
                                    autofocus="true"></form:input>
                        <form:errors cssClass="error-message" path="phoneNo"></form:errors>
                    </div>
                </spring:bind>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 mb-3">
                <spring:bind path="addressAddr">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="addressAddr">Address</label>
                        <form:input type="text" path="addressAddr" class="form-control"
                                    placeholder="Address"
                                    autofocus="true"></form:input>
                        <form:errors cssClass="error-message" path="addressAddr"></form:errors>
                    </div>
                </spring:bind>
            </div>
            <form:hidden path="student" value="${userForm.student.id}"/>
            <form:hidden path="id" value="${userForm.id}"/>
        </div>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-primary">Submit</button>
        <button type="button" class="btn btn-secondary"
                name="back"
                onclick="window.history.back()">Back
        </button>
    </form:form>
</div>
<%@include file="../footer.jsp" %>