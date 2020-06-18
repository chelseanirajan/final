package com.jugal.adminsecurity.user.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jugal.adminsecurity.model.User;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.*;
import java.util.Date;

@Entity
@Table(name = "studentTable")
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private long id;
    @Valid
    @NotBlank(message = "Enter the full name")
    @Column(name = "student_name")
    private  String name;
    @Valid
    @Min(value = 2070, message = "year must be in valid format")
    @Max(value = 3070, message = "year must be in valid format")
    private  Long year;
    @Valid
    @Size(min = 10,max = 45)
    private String schoolName;
    @Min(value = 1, message = "The value must be positive")
    private int rollNo;
    @Valid
    @NotBlank(message = "Enter the valid date")
    //@Pattern(regexp="([0-9]{4})[-/.]([0-12]{2})[-/.][0-32]{2}", message = "please enter date in yyyy/mm/dd format")
    private String doB;
    private String fatherName;
    private String motherName;
    @Column(name="added_date",updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date addedDate=new Date();
    //@UpdateTimestamp
    @Column(name = "modified_date",insertable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date modifiedDate=new Date();
    @Valid
    @Max(value = 75, message = "You exceeded full marks")
    private float  englishTh;
    @Valid
    @Max(value = 25, message = "You exceeded full marks")
    private float  englishPr;
    @Valid
    @Max(value = 75, message = "You exceeded full marks")
    private float  nepaliTh;
    @Valid
    @Max(value = 25, message = "You exceeded full marks")
    private float  nepaliPr;
    @Valid
    @Max(value = 100, message = "You exceeded full marks")
    private float  mathTh;
    @Valid
    @Max(value = 75, message = "You exceeded full marks")
    private float  scienceTh;
    @Valid
    @Max(value = 25, message = "You exceeded full marks")
    private float  sciencePr;
    @Valid
    @Max(value = 75, message = "You exceeded full marks")
    private float  socialTh;
    @Valid
    @Max(value = 25, message = "You exceeded full marks")
    private float  SocialPr;
    @Valid
    @Max(value = 50, message = "You exceeded full marks")
    private float  obtTh;
    @Valid
    @Max(value = 50, message = "You exceeded full marks")
    private float  obtPr;
    @Valid
    @Max(value = 25, message = "You exceeded full marks")
    private float  healthTh;
    @Valid
    @Max(value = 25, message = "You exceeded full marks")
    private float  healthPr;
    @Valid
    @Max(value = 25, message = "You exceeded full marks")
    private float  moralTh;
    @Valid
    @Max(value = 25, message = "You exceeded full marks")
    private float  moralPr;
    @Valid
    @Max(value = 50, message = "You exceeded full marks")
    private float  optTh;
    @Valid
    @Max(value = 50, message = "You exceeded full marks")
    private float  optPr;

    @ManyToOne()
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @OneToOne(cascade = CascadeType.ALL)
    private Parent parent;


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public int getRollNo() {
        return rollNo;
    }

    public void setRollNo(int rollNo) {
        this.rollNo = rollNo;
    }

    public String getDoB() {
        return doB;
    }

    public void setDoB(String doB) {
        this.doB = doB;
    }

    public String getFatherName() {
        return fatherName;
    }

    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }

    public String getMotherName() {
        return motherName;
    }

    public void setMotherName(String motherName) {
        this.motherName = motherName;
    }

    public float getEnglishTh() {
        return englishTh;
    }

    public void setEnglishTh(float englishTh) {
        this.englishTh = englishTh;
    }

    public float getEnglishPr() {
        return englishPr;
    }

    public void setEnglishPr(float englishPr) {
        this.englishPr = englishPr;
    }

    public float getNepaliTh() {
        return nepaliTh;
    }

    public void setNepaliTh(float nepaliTh) {
        this.nepaliTh = nepaliTh;
    }

    public float getNepaliPr() {
        return nepaliPr;
    }

    public void setNepaliPr(float nepaliPr) {
        this.nepaliPr = nepaliPr;
    }

    public float getMathTh() {
        return mathTh;
    }

    public void setMathTh(float mathTh) {
        this.mathTh = mathTh;
    }

    public float getScienceTh() {
        return scienceTh;
    }

    public void setScienceTh(float scienceTh) {
        this.scienceTh = scienceTh;
    }

    public float getSciencePr() {
        return sciencePr;
    }

    public void setSciencePr(float sciencePr) {
        this.sciencePr = sciencePr;
    }

    public float getSocialTh() {
        return socialTh;
    }

    public void setSocialTh(float socialTh) {
        this.socialTh = socialTh;
    }

    public float getSocialPr() {
        return SocialPr;
    }

    public void setSocialPr(float socialPr) {
        SocialPr = socialPr;
    }

    public float getObtTh() {
        return obtTh;
    }

    public void setObtTh(float obtTh) {
        this.obtTh = obtTh;
    }

    public float getObtPr() {
        return obtPr;
    }

    public void setObtPr(float obtPr) {
        this.obtPr = obtPr;
    }

    public float getHealthTh() {
        return healthTh;
    }

    public void setHealthTh(float healthTh) {
        this.healthTh = healthTh;
    }

    public float getHealthPr() {
        return healthPr;
    }

    public void setHealthPr(float healthPr) {
        this.healthPr = healthPr;
    }

    public float getMoralTh() {
        return moralTh;
    }

    public void setMoralTh(float moralTh) {
        this.moralTh = moralTh;
    }

    public float getMoralPr() {
        return moralPr;
    }

    public void setMoralPr(float moralPr) {
        this.moralPr = moralPr;
    }

    public float getOptTh() {
        return optTh;
    }

    public void setOptTh(float optTh) {
        this.optTh = optTh;
    }

    public float getOptPr() {
        return optPr;
    }

    public void setOptPr(float optPr) {
        this.optPr = optPr;
    }

    public Long getYear() {
        return year;
    }

    public void setYear(Long year) {
        this.year = year;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getAddedDate() {
        return addedDate;
    }

    public void setAddedDate(Date addedDate) {
        this.addedDate = addedDate;
    }

    public Date getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(Date modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public Parent getParent() {
        return parent;
    }

    public void setParent(Parent parent) {
        this.parent = parent;
    }
}
