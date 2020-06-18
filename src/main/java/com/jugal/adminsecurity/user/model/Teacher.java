package com.jugal.adminsecurity.user.model;

import com.jugal.adminsecurity.model.User;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Calendar;
import java.util.Date;

@Entity
@Table(name = "teacherTable")
public class Teacher {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Valid
    @NotBlank(message = "Teacher name cannot be empty")
    private String fullName;
    //@Valid
    //@NotBlank(message = "Teacher address cannot be empty")
    private String address;
    @Valid
    @Size(min = 9,max = 13,message = "please enter the valid phone no.")
    private String phoneNo;
    @Valid
    @Email(message = "email should be valid")
    private String emailId;
    @Valid
    @NotBlank(message = "Subject cannot be empty.")
    private String subject;
    //@Basic(optional = false)
    //@CreationTimestamp
    @Column(name="added_date",updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date addedDate=new Date();
    //@UpdateTimestamp
    @Column(name = "modified_date",insertable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date modifiedDate=new Date();

    @ManyToOne()
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
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
}
