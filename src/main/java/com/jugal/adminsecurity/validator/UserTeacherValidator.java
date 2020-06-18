package com.jugal.adminsecurity.validator;

import com.jugal.adminsecurity.user.model.Student;
import com.jugal.adminsecurity.user.model.Teacher;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

@Component
public class UserTeacherValidator {
    public boolean supports(Class<?> paramClass) {
        return Teacher.class.equals(paramClass);
    }
    public void validate(Object obj, Errors errors) {
       // ValidationUtils.rejectIfEmpty(errors, "fullName", "NotEmpty.teacher.fullName");

    }
    }

