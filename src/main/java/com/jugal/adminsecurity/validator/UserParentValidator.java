package com.jugal.adminsecurity.validator;

import com.jugal.adminsecurity.user.model.Parent;
import com.jugal.adminsecurity.user.model.Teacher;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

@Component
public class UserParentValidator {
    public boolean supports(Class<?> paramClass) {
        return Parent.class.equals(paramClass);
    }
    public void validate(Object obj, Errors errors) {
       // ValidationUtils.rejectIfEmpty(errors, "addressAddr", "NotEmpty.parent.addressAddr");

    }
}
