<%@include file="header.jsp"%>
<div class="container bg-faded py-3">
    <legend class="legend-class">Student Details</legend>
    <h2 class="text-center text-uppercase">Rural Muncipality Examination Board</h2>
    <h3 class="text-center text-uppercase">Basic Level Examination, ${detail.year}</h3>
    <h5 class="text-center text-uppercase">Jugal Rural Muncipality Bagmati Provience,Nepal</h5>
    <br>
    <br>
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div style="margin: 3px; padding: 3px; min-height: 100px; text-align: left;background:lightpink">
                This is certify that Mr. | Miss.        ${detail.name}
                son|daughter of Mr.     ${detail.fatherName} and Mrs.     ${detail.motherName}
                .the student of ${user.schoolName} ${user.schoolAddress}
                has appeared in the Annual Examination of class Eight of sambat
                BS ${detail.year} and Completed Basic Level. According to school register his/her date
                of Birth is ${detail.doB} BS.
            </div>
        </div>
    </div>
    <br>
    <h4 class="text-center text-uppercase">Mark Sheet</h4>
    <P class="text-left">Symbol/Roll No. ${detail.rollNo}</P>
    <table class="table table-striped table-bordered table-hover table-responsive-md">
        <thead class="table-dark">
        <tr>
            <th rowspan="2">Id</th>
            <th rowspan="2">Subject</th>
            <th colspan="2">Marks Obtained</th>
            <th rowspan="2">Remark</th>

        </tr>
        <tr>
            <th>Th.</th>
            <th>Pr.</th>
        </tr>
        </thead>
        <tr>
            <td>1</td>
            <td>English</td>
            <td>${detail.englishTh}</td>
            <td>${detail.englishPr}</td>
            <td></td>
        </tr>
        <tr>
            <td>2</td>
            <td>Nepali</td>
            <td>${detail.nepaliTh}</td>
            <td>${detail.nepaliPr}</td>
            <td></td>
        </tr>
        <tr>
            <td>3</td>
            <td>Math</td>
            <td>${detail.mathTh}</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>4</td>
            <td>Science</td>
            <td>${detail.scienceTh}</td>
            <td>${detail.sciencePr}</td>
            <td></td>
        </tr>
        <tr>
            <td>5</td>
            <td>Social</td>
            <td>${detail.socialTh}</td>
            <td>${detail.socialPr}</td>
            <td></td>
        </tr>
        <tr>
            <td>6</td>
            <td>Occupation</td>
            <td>${detail.obtTh}</td>
            <td>${detail.obtPr}</td>
            <td></td>
        </tr>
        <tr>
            <td>7</td>
            <td>Health & Population</td>
            <td>${detail.healthTh}</td>
            <td>${detail.healthPr}</td>
            <td></td>
        </tr>
        <tr>
            <td>8</td>
            <td>Moral Studies</td>
            <td>${detail.moralTh}</td>
            <td>${detail.moralPr}</td>
            <td></td>
        </tr>
        <tr>
            <td>9</td>
            <td>Computer/Others</td>
            <td>${detail.optTh}</td>
            <td>${detail.optPr}</td>
            <td></td>
        </tr>
    </table>
    <br>
    <p>1. TH : Theory, PR : Practical</p>
    <br>
    <hr>
    <button id='btnSubmit' class="btn btn-success" type="button"  ><a href="/pdfreport?id=${detail.id}" target="_blank">Download Result</a> </button>
</div>
<%@include file="footer.jsp"%>
<script>
    function downloadDetail() {
        event.preventDefault();
        $("#btnSubmit").prop("disabled", true);
        $.ajax({
            type: "GET",
            url: "/api/download/user-detail?username=nirajan",
            dataType: 'json',
            processData: false, //prevent jQuery from automatically transforming the data into a query string
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (data) {
                // $("#result").text(data);
                $("#btnSubmit").prop("disabled", false);
                console.log("SUCCESS : ", data);
            },
            error: function (e) {
                //$("#result").text(e.responseText);
                console.log("ERROR : ", e);
                $("#btnSubmit").prop("disabled", false);
                // $("#btnSubmit").prop("disabled", false);
            }
        });
    }
</script>

