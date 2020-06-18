package com.jugal.adminsecurity.user.controller;

import com.jugal.adminsecurity.service.UserService;
import com.jugal.adminsecurity.user.model.Teacher;
import com.jugal.adminsecurity.user.service.TeacherServiceImpl;
import com.jugal.adminsecurity.validator.UserTeacherValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@PreAuthorize("hasRole('ROLE_USER')")
@Controller
@RequestMapping("/user/teacher")
public class UserTeacherController {
    @Autowired
    protected UserService userService;

    @Autowired
    protected TeacherServiceImpl teacherService;

    @Autowired
    private UserTeacherValidator validator;

    @GetMapping("")
    public String getForm(@ModelAttribute("userForm") Teacher userForm, Model model,
                          HttpServletRequest httpServletRequest) {
        model.addAttribute("teacher", teacherService.findAllByUser(userService.getCurrentUser()));
        return "/views/user/teacher/display_teacher";
    }
    @PostMapping("")
    public ModelAndView saveOrUpdateContact(@ModelAttribute("userForm") Teacher userForm,
                                            BindingResult result,
                                            HttpServletRequest httpServletRequest,
                                            RedirectAttributes redirectAttrs) {
        userForm.setUser(userService.getCurrentUser());
        //validator.validate(userForm, result);
        if (result.hasErrors()) {
            httpServletRequest.setAttribute("url", "userForm");
            return new ModelAndView("/views/user/teacher/add_teacher");
        }
        teacherService.save(userForm);
        redirectAttrs.addFlashAttribute("teacher",userForm);
        return new ModelAndView("/views/user/teacher/display_teacher");
    }
    @GetMapping("/add_teacher")
    public String addTeacher(@ModelAttribute("userForm") Teacher userForm,
                             BindingResult result,
                             Model model,
                             HttpServletRequest httpServletRequest) {
        if(result.hasErrors()){

        }
        //model.addAttribute("teacher", teacherService.findAllByUser(userService.getCurrentUser()));
        return "/views/user/teacher/add_teacher";
    }
    @GetMapping({"edit"})
    public String editStudent(@RequestParam("id") Long id, Model model) {
        Teacher teacher = teacherService.findById(id);
        model.addAttribute("userForm",teacher);
        //model.addAttribute("id",teacher.getId());
        return "/views/user/teacher/edit_teacher";
    }
    @PostMapping({"/update"})
    public ModelAndView updateContact(@Valid @ModelAttribute("userForm") Teacher userForm,
                                      BindingResult result,
                                      HttpServletRequest httpServletRequest,
                                      RedirectAttributes redirectAttrs) {
        userForm.setUser(userService.getCurrentUser());
        //validator.validate(userForm, result);
        if (result.hasErrors()) {
            httpServletRequest.setAttribute("url", "student");
            return new ModelAndView("/views/user/teacher/edit_teacher");
        }
        teacherService.save(userForm);
        //model.addAttribute("teacher", teacherService.findAllByUser(userService.getCurrentUser()));
        redirectAttrs.addFlashAttribute("teacher",userForm);
        return new ModelAndView("redirect:/user/teacher");
        //views/user/teacher/display_teacher
    }
    @GetMapping({"/delete"})
    public String deleteStudent(@RequestParam("id") Long id) {
        teacherService.deleteById(id);
        return "redirect:/user/teacher";
    }

}
