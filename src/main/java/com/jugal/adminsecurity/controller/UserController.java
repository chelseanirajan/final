package com.jugal.adminsecurity.controller;
import com.jugal.adminsecurity.service.UserService;
import com.jugal.adminsecurity.user.model.Student;
import com.jugal.adminsecurity.user.service.StudentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;

@PreAuthorize("hasRole('ROLE_USER')")
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    protected UserService userService;

@Autowired
protected StudentServiceImpl studentService;


    @GetMapping({""})
    public String dashboard(@ModelAttribute("userForm") Student userForm, Model model, HttpServletRequest httpServletRequest) {
        model.addAttribute("student", studentService.findAllByUser(userService.getCurrentUser()));
        model.addAttribute("category",studentService.findNonReferencedYear());
        httpServletRequest.setAttribute("url", "dashboard");
        return "/views/user/dashboard";
    }


}
