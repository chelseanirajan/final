package com.jugal.adminsecurity.validator;

import com.jugal.adminsecurity.service.UserService;
import com.jugal.adminsecurity.user.model.Student;
import com.jugal.adminsecurity.user.service.StudentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

@Component
public class UserStudentValidator {
    @Autowired
    private StudentServiceImpl studentService;

    public boolean supports(Class<?> paramClass) {
        return Student.class.equals(paramClass);
    }
    public void validate(Object obj, Errors errors) {
       /* Student std = (Student) obj;
        ValidationUtils.rejectIfEmpty(errors, "name", "NotEmpty.student.name");
        ValidationUtils.rejectIfEmpty(errors, "year", "NotEmpty.student.year");
        ValidationUtils.rejectIfEmpty(errors, "schoolName", "NotEmpty.student.schoolName");
        ValidationUtils.rejectIfEmpty(errors, "rollNo", "NotEmpty.student.rollNo");
        ValidationUtils.rejectIfEmpty(errors, "doB", "NotEmpty.student.doB");
        ValidationUtils.rejectIfEmpty(errors, "englishTh", "NotEmpty.student.englishTh");
        ValidationUtils.rejectIfEmpty(errors, "englishPr", "NotEmpty.student.englishPr");
        ValidationUtils.rejectIfEmpty(errors, "nepaliTh", "NotEmpty.student.nepaliTh");
        ValidationUtils.rejectIfEmpty(errors, "nepaliPr", "NotEmpty.student.nepaliPr");
        ValidationUtils.rejectIfEmpty(errors, "mathTh",   "NotEmpty.student.mathTh");
        ValidationUtils.rejectIfEmpty(errors, "scienceTh","NotEmpty.student.scienceTh");
        ValidationUtils.rejectIfEmpty(errors, "sciencePr","NotEmpty.student.sciencePr");
        ValidationUtils.rejectIfEmpty(errors, "socialTh", "NotEmpty.student.socialTh");
        ValidationUtils.rejectIfEmpty(errors, "socialPr", "NotEmpty.student.socialPr");
        ValidationUtils.rejectIfEmpty(errors, "obtTh", "NotEmpty.student.obtTh");
        ValidationUtils.rejectIfEmpty(errors, "obtPr", "NotEmpty.student.obtPr");
        ValidationUtils.rejectIfEmpty(errors, "healthTh", "NotEmpty.student.healthTh");
        ValidationUtils.rejectIfEmpty(errors, "healthPr", "NotEmpty.student.healthPr");
        ValidationUtils.rejectIfEmpty(errors, "moralTh", "NotEmpty.student.moralTh");
        ValidationUtils.rejectIfEmpty(errors, "moralPr", "NotEmpty.student.moralPr");
        ValidationUtils.rejectIfEmpty(errors, "optTh", "NotEmpty.student.optTh");
        ValidationUtils.rejectIfEmpty(errors, "optPr", "NotEmpty.student.optPr");

        */
    }
}
