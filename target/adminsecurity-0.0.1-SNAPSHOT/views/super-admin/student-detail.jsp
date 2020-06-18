<%@include file="header.jsp"%>
<div class="main-content">
    <div class="section__content section__content--p30">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-9">
                    <div class="card">
                        <div class="card-header">Student Details</div>
                        <div class="card-body">
                            <div class="card-title">
                                <h3 class="text-center title-2">Details</h3>
                            </div>
                            <hr>

                            <fieldset class="fieldset-class">
                                <legend class="legend-class">Student Details</legend>
                                <div class="row">
                                    <div class="col-md-4 mb-3">Full Name :  ${detail.name}</div>
                                    <div class="col-md-4 mb-3">Year:  ${detail.year}</div>
                                    <div class="col-md-4 mb-3">School Name :  ${detail.schoolName}</div>
                                    <div class="col-md-4 mb-3">Roll No :     ${detail.rollNo}</div>
                                    <div class="col-md-4 mb-3">DOF :     ${detail.doB}</div>
                                    <div class="col-md-4 mb-3">Father Name :     ${detail.fatherName}</div>
                                    <div class="col-md-4 mb-3">Mother Name :     ${detail.motherName}</div>
                                    <div class="col-md-4 mb-3">English TH  :     ${detail.englishTh}</div>
                                    <div class="col-md-4 mb-3">English PR  :     ${detail.englishPr}</div>
                                    <div class="col-md-4 mb-3">Nepali TH  :     ${detail.nepaliTh}</div>
                                    <div class="col-md-4 mb-3">Nepali PR  :     ${detail.nepaliPr}</div>
                                    <div class="col-md-4 mb-3">Math TH    :     ${detail.mathTh}</div>
                                    <div class="col-md-4 mb-3">Science TH :     ${detail.scienceTh}</div>
                                    <div class="col-md-4 mb-3">Science PR :     ${detail.sciencePr}</div>
                                    <div class="col-md-4 mb-3">Social TH :     ${detail.socialTh}</div>
                                    <div class="col-md-4 mb-3">Social PR :     ${detail.socialPr}</div>
                                    <div class="col-md-4 mb-3">OBT Th :     ${detail.obtTh}</div>
                                    <div class="col-md-4 mb-3">OBT Pr :     ${detail.obtPr}</div>
                                    <div class="col-md-4 mb-3">Health Th :     ${detail.healthTh}</div>
                                    <div class="col-md-4 mb-3">Health Pr :     ${detail.healthPr}</div>
                                    <div class="col-md-4 mb-3">Moral Th :     ${detail.moralTh}</div>
                                    <div class="col-md-4 mb-3">Moral Pr :     ${detail.moralPr}</div>
                                    <div class="col-md-4 mb-3">OPT TH :     ${detail.optTh}</div>
                                    <div class="col-md-4 mb-3">OPT Pr :     ${detail.optPr}</div>


                                </div>
                            </fieldset>
                            <button id='btnSubmit' type="button"  ><a href="/pdfreport?id=${detail.id}" target="_blank">Download Result</a> </button>

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
