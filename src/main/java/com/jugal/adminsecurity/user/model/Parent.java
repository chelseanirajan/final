package com.jugal.adminsecurity.user.model;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name = "parentTable")
public class Parent {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String emailId;

    @Valid
    @NotBlank(message = "Phone number cannot be empty.")
    @Size(min = 9,max = 13,message = "please enter the valid phone no.")
    private String phoneNo;
    @Valid
    @NotBlank(message = "Address cannot be empty.")
    private String addressAddr;

    @OneToOne()
    @JoinColumn(name = "student_id", unique = true, nullable = false)
    private Student student;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getAddressAddr() {
        return addressAddr;
    }

    public void setAddressAddr(String addressAddr) {
        this.addressAddr = addressAddr;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }
}
