<%@include file="header.jsp"%>

<div class="container">
    <div class="py-5 text-left">
        <h2>Edit Student</h2>
    </div>
    <form:form method="POST" action="/user/student/update?id=${userForm.id}" modelAttribute="userForm" class="form-signup">
        <input type="hidden" id='id' name="id" value="${userForm.id}">

        <div class="row">
            <div class="col-md-4 mb-3">
                <spring:bind path="name">
                    <div class="form-group required ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="name">Full Name:
                            <spring:message
                                    code=" " text="First Name"></spring:message>
                        </label>
                        <form:input type="text" path="name" class="form-control"
                                    autofocus="true"></form:input>
                        <form:errors cssClass="error-message" path="name"></form:errors>
                    </div>
                </spring:bind>
            </div>
            <div class="col-md-4 mb-3">
                <spring:bind path="year">
                    <div class="form-group  ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="year">Year:</label>
                        <form:input type="text" path="year" class="form-control"
                                    required="required"
                                    autofocus="true"></form:input>
                        <form:errors cssClass="error-message" path="year"></form:errors>
                    </div>
                </spring:bind>
            </div>
            <div class="col-md-4 mb-3">
                <spring:bind path="schoolName">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="schoolName">School Name:</label>
                        <form:input type="text" path="schoolName" class="form-control"
                                    placeholder="School Name"
                                    autofocus="true"></form:input>
                        <form:errors cssClass="error-message" path="schoolName"></form:errors>
                    </div>
                </spring:bind>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 mb-3">
                <spring:bind path="rollNo">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="rollNo">Roll No.:</label>
                        <form:input type="Number" path="rollNo" class="form-control"
                                    placeholder="Roll No."
                                    autofocus="true"></form:input>
                        <form:errors cssClass="error-message" path="rollNo"></form:errors>
                    </div>
                </spring:bind>
            </div>
            <div class="col-md-4 mb-3">
                <spring:bind path="doB">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="doB">Date Of Birth:</label>
                        <form:input type="text" path="doB" class="form-control"
                                    placeholder="Date Of Birth"
                                    autofocus="true"></form:input>
                        <form:errors cssClass="error-message" path="doB"></form:errors>
                    </div>
                </spring:bind>
            </div>
            <div class="col-md-4 mb-3">
                <spring:bind path="fatherName">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="fatherName">Father Name</label>
                        <form:input type="text" path="fatherName" class="form-control"
                                    placeholder="Father Name"
                                    autofocus="true"></form:input>
                        <form:errors cssClass="error-message" path="fatherName"></form:errors>
                    </div>
                </spring:bind>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 mb-3">
                <spring:bind path="motherName">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="motherName">Mother Name</label>
                        <form:input type="text" path="motherName" class="form-control"
                                    placeholder="Mother Name"
                                    autofocus="true"></form:input>
                        <form:errors cssClass="error-message" path="motherName"></form:errors>
                    </div>
                </spring:bind>
            </div>
            <div class="col-md-4 mb-3">
                <spring:bind path="englishTh">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="englishTh">English Th:</label>
                        <form:input type="text" path="englishTh" class="form-control"
                                    placeholder="Date Of Birth"
                                    autofocus="true"></form:input>
                        <form:errors cssClass="error-message" path="englishTh"></form:errors>
                    </div>
                </spring:bind>
            </div>
            <div class="col-md-4 mb-3">
                <spring:bind path="englishPr">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="englishPr">English Pr:</label>
                        <form:input type="text" path="englishPr" class="form-control"
                                    placeholder="English Pr"
                                    autofocus="true"></form:input>
                        <form:errors cssClass="error-message" path="englishPr"></form:errors>
                    </div>
                </spring:bind>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 mb-3">
                <spring:bind path="nepaliTh">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="nepaliTh">Nepali Pr:</label>
                        <form:input type="text" path="nepaliTh" class="form-control"
                                    placeholder="Nepali Pr"
                                    autofocus="true"></form:input>
                        <form:errors cssClass="error-message" path="nepaliTh"></form:errors>
                    </div>
                </spring:bind>
            </div>
            <div class="col-md-4 mb-3">
                <spring:bind path="nepaliPr">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="nepaliPr">Nepali Pr:</label>
                        <form:input type="text" path="nepaliPr" class="form-control"
                                    placeholder="Nepali Pr"
                                    autofocus="true"></form:input>
                        <form:errors cssClass="error-message" path="nepaliPr"></form:errors>
                    </div>
                </spring:bind>
            </div>
            <div class="col-md-4 mb-3">
                <spring:bind path="mathTh">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="mathTh">Math Th:</label>
                        <form:input type="text" path="mathTh" class="form-control"
                                    placeholder="Math TH"
                                    autofocus="true"></form:input>
                        <form:errors path="mathTh"></form:errors>
                    </div>
                </spring:bind>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 mb-3">
                <spring:bind path="sciencePr">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="sciencePr">Science Pr</label>
                        <form:input type="text" path="sciencePr" class="form-control"
                                    placeholder="Science Pr"
                                    autofocus="true"></form:input>
                        <form:errors cssClass="error-message" path="sciencePr"></form:errors>
                    </div>
                </spring:bind>
            </div>
            <div class="col-md-4 mb-3">
                <spring:bind path="scienceTh">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="scienceTh">scienceTh:</label>
                        <form:input type="text" path="scienceTh" class="form-control"
                                    placeholder="Science TH"
                                    autofocus="true"></form:input>
                        <form:errors cssClass="error-message" path="scienceTh"></form:errors>
                    </div>
                </spring:bind>
            </div>
            <div class="col-md-4 mb-3">
                <spring:bind path="socialTh">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="socialTh">Social Th:</label>
                        <form:input type="text" path="socialTh" class="form-control"
                                    placeholder="Social Th"
                                    autofocus="true"></form:input>
                        <form:errors cssClass="error-message" path="socialTh"></form:errors>
                    </div>
                </spring:bind>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 mb-3">
                <spring:bind path="socialPr">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="socialPr">Social Pr:</label>
                        <form:input type="text" path="socialPr" class="form-control"
                                    placeholder="Social Pr"
                                    autofocus="true"></form:input>
                        <form:errors cssClass="error-message" path="socialPr"></form:errors>
                    </div>
                </spring:bind>
            </div>
            <div class="col-md-4 mb-3">
                <spring:bind path="obtTh">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="obtTh">OBT Th:</label>
                        <form:input type="text" path="obtTh" class="form-control"
                                    placeholder="OBT Th"
                                    autofocus="true"></form:input>
                        <form:errors cssClass="error-message" path="obtTh"></form:errors>
                    </div>
                </spring:bind>
            </div>
            <div class="col-md-4 mb-3">
                <spring:bind path="obtPr">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="obtPr">OBT Pr:</label>
                        <form:input type="text" path="obtPr" class="form-control"
                                    placeholder="OBT pr"
                                    autofocus="true"></form:input>
                        <form:errors cssClass="error-message" path="obtPr"></form:errors>
                    </div>
                </spring:bind>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 mb-3">
                <spring:bind path="healthTh">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="healthTh">Health Th:</label>
                        <form:input type="text" path="healthTh" class="form-control"
                                    placeholder="Health Th"
                                    autofocus="true"></form:input>
                        <form:errors cssClass="error-message" path="healthTh"></form:errors>
                    </div>
                </spring:bind>
            </div>
            <div class="col-md-4 mb-3">
                <spring:bind path="healthPr">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="healthPr">Health Pr:</label>
                        <form:input type="text" path="healthPr" class="form-control"
                                    placeholder="Health pr"
                                    autofocus="true"></form:input>
                        <form:errors cssClass="error-message" path="healthPr"></form:errors>
                    </div>
                </spring:bind>
            </div>
            <div class="col-md-4 mb-3">
                <spring:bind path="moralTh">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="moralTh">Moral Th</label>
                        <form:input type="text" path="moralTh" class="form-control"
                                    placeholder="Moral Th"
                                    autofocus="true"></form:input>
                        <form:errors cssClass="error-message" path="moralTh"></form:errors>
                    </div>
                </spring:bind>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 mb-3">
                <spring:bind path="moralPr">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="moralPr">Moral Pr</label>
                        <form:input type="text" path="moralPr" class="form-control"
                                    placeholder="Moral pr"
                                    autofocus="true"></form:input>
                        <form:errors cssClass="error-message" path="moralPr"></form:errors>
                    </div>
                </spring:bind>
            </div>
            <div class="col-md-4 mb-3">
                <spring:bind path="optTh">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="optTh">Opt Th:</label>
                        <form:input type="text" path="optTh" class="form-control"
                                    placeholder="Opt Th"
                                    autofocus="true"></form:input>
                        <form:errors cssClass="error-message" path="optTh"></form:errors>
                    </div>
                </spring:bind>
            </div>
            <div class="col-md-4 mb-3">
                <spring:bind path="optPr">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="form-check-label" for="optPr">Opt Pr:</label>
                        <form:input type="text" path="optPr" class="form-control"
                                    placeholder="Opt pr"
                                    autofocus="true"></form:input>
                        <form:errors cssClass="error-message" path="optPr"></form:errors>
                    </div>
                </spring:bind>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">
            Submit
        </button>
    </form:form>
</div>
</div>
</div>
<%@include file="footer.jsp"%>
