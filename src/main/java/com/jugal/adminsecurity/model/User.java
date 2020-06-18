package com.jugal.adminsecurity.model;

import com.jugal.adminsecurity.user.model.Student;
import com.jugal.adminsecurity.user.model.Teacher;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

    @Entity
    @Table(name = "user")
    public class User {
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;

        private String username;

        private String email;
        private String mobileNo;
        private String schoolName;
        private String schoolAddress;
        private String password;

        @Transient
        private String passwordConfirm;

        @OneToMany(cascade = CascadeType.ALL)
        private List<Student> students;

        @OneToMany(cascade = CascadeType.ALL)
        private List<Teacher> teachers;

        @ManyToMany
        private Set<Role> roles;


        public Long getId() {
            return id;
        }

        public void setId(Long id) {
            this.id = id;
        }

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }


        public Set<Role> getRoles() {
            return roles;
        }

        public void setRoles(Set<Role> roles) {
            this.roles = roles;
        }
        public String getPasswordConfirm() {
            return passwordConfirm;
        }

        public void setPasswordConfirm(String passwordConfirm) {
            this.passwordConfirm = passwordConfirm;
        }

        public List<Student> getStudents() {
            return students;
        }

        public void setStudents(List<Student> students) {
            this.students = students;
        }

        public List<Teacher> getTeachers() {
            return teachers;
        }

        public void setTeachers(List<Teacher> teachers) {
            this.teachers = teachers;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public String getMobileNo() {
            return mobileNo;
        }

        public void setMobileNo(String mobileNo) {
            this.mobileNo = mobileNo;
        }

        public String getSchoolAddress() {
            return schoolAddress;
        }

        public void setSchoolAddress(String schoolAddress) {
            this.schoolAddress = schoolAddress;
        }

        public String getSchoolName() {
            return schoolName;
        }

        public void setSchoolName(String schoolName) {
            this.schoolName = schoolName;
        }
    }


