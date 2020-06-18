<%@include file="header.jsp"%>
<div class="main-content">
    <div class="section__content section__content--p30">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">Edit Teacher</div>
                        <div class="card-body">
                            <div class="card-title">
                                <h3 class="text-center title-2">Edit</h3>
                            </div>
                            <hr>
                            <form:form method="POST" action="${contextPath}/super-admin/teacher/update?id=${userForm.id}" modelAttribute="userForm" class="form-signup">
                                <input type="hidden" id='id' name="id" value="${userForm.id}">
                                <div class="row">
                                    <div class="col-md-4 mb-3">
                                        <spring:bind path="fullName">
                                            <div class="form-group required ${status.error ? 'has-error' : ''}">
                                                <label class="form-check-label" for="fullName">Full Name:
                                                    <spring:message
                                                            code="" text=""></spring:message>
                                                </label>
                                                <form:input type="text" path="fullName" class="form-control"
                                                            placeholder="Full Name"
                                                            autofocus="true"></form:input>
                                                <form:errors class="error-message" path="fullName"></form:errors>
                                            </div>
                                        </spring:bind>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 mb-3">
                                        <spring:bind path="address">
                                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                                <label class="form-check-label" for="address">Address</label>
                                                <form:input type="text" path="address" class="form-control"
                                                            placeholder="Address"
                                                            autofocus="true"></form:input>
                                                <form:errors path="address"></form:errors>
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
                                                <form:errors path="phoneNo"></form:errors>
                                            </div>
                                        </spring:bind>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 mb-3">
                                        <spring:bind path="emailId">
                                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                                <label class="form-check-label" for="emailId">Email Id:</label>
                                                <form:input type="text" path="emailId" class="form-control"
                                                            placeholder="Email ID"
                                                            autofocus="true"></form:input>
                                                <form:errors path="emailId"></form:errors>
                                            </div>
                                        </spring:bind>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 mb-3">
                                        <spring:bind path="subject">
                                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                                <label class="form-check-label" for="subject">Subject:</label>
                                                <form:input type="text" path="subject" class="form-control"
                                                            placeholder="Subject"
                                                            autofocus="true"></form:input>
                                                <form:errors path="subject"></form:errors>
                                            </div>
                                        </spring:bind>
                                    </div>
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <button type="submit" class="btn btn-primary">Submit</button>
                                <button type="button" class="btn btn-secondary"
                                        name="back"
                                        onclick="window.history.back()">Back</button>
                            </form:form>
                        </div>
                    </div>
                </div>
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
<%@include file="footer.jsp"%>