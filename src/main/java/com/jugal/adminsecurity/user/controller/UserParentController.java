package com.jugal.adminsecurity.user.controller;

import com.jugal.adminsecurity.service.UserService;
import com.jugal.adminsecurity.user.model.Parent;
import com.jugal.adminsecurity.user.model.Student;
import com.jugal.adminsecurity.user.service.ParentsServiceImpl;
import com.jugal.adminsecurity.user.service.StudentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@PreAuthorize("hasRole('ROLE_USER')")
@Controller
@RequestMapping("/user/parent")
public class UserParentController {
    @Autowired
    protected UserService userService;

    @Autowired
    protected ParentsServiceImpl parentsService;

    @Autowired
    StudentServiceImpl studentService;

    /*
        @GetMapping({"add_parent"})
        public String editStudent(@RequestParam("id") Long id, Model model) {

            //Teacher teacher = teacherService.findById(id);
            //model.addAttribute("userForm",studentService.findById(id));
            //model.addAttribute("id",teacher.getId());
            return "/views/user/parent/add_parent";
        }

        /*

     */
    @GetMapping({"add_parent"})
    public String addParent(@RequestParam Long id, Model model,
                            HttpServletRequest httpServletRequest) {
        Student student = studentService.findById(id);
        Parent parent = parentsService.findByStudent(student);
        if (null == parent) {
            parent = new Parent();
            parent.setStudent(student);
        }
        model.addAttribute("userForm", parent);
        return "/views/user/parent/add_parent";
    }
    @GetMapping({"parent_list"})
    public String getParentList(@ModelAttribute("userForm") Student userForm, Model model, HttpServletRequest httpServletRequest) {
        List<Student> students = studentService.findAllByUser(userService.getCurrentUser());
        students.forEach(student -> student.setParent(parentsService.findByStudent(student)));
        model.addAttribute("student", students);
        ///model.addAttribute("teacher",teacherService.findAll());
        return "/views/user/parent/display_parent";
    }

    @PostMapping({"/update"})
    public String updateContact(@Valid @ModelAttribute("userForm")  Parent userForm,BindingResult result,
                                Model model,
                                HttpServletRequest httpServletRequest) {
        if (result.hasErrors()) {
            httpServletRequest.setAttribute("url", "userForm");
            return "/views/user/parent/add_parent";
        }
        parentsService.save(userForm);
        model.addAttribute("student", studentService.findAllByUser(userService.getCurrentUser()));
        return "/views/user/parent_list";
    }
/*
    @GetMapping("")
    public String getForm(@ModelAttribute("userForm") Teacher userForm, Model model,
                          HttpServletRequest httpServletRequest) {
        model.addAttribute("teacher", teacherService.findAllByUser(userService.getCurrentUser()));
        return "/views/user/teacher/display_teacher";
    }
    @PostMapping("")
    public ModelAndView saveOrUpdateContact(@ModelAttribute("userForm") Teacher userForm,
                                            HttpServletRequest httpServletRequest,
                                            BindingResult result,
                                            RedirectAttributes redirectAttrs) {
        userForm.setUser(userService.getCurrentUser());
        validator.validate(userForm, result);
        if (result.hasErrors()) {
            httpServletRequest.setAttribute("url", "userForm");
            return new ModelAndView("/views/user/teacher/add_teacher");
        }
        teacherService.save(userForm);
        redirectAttrs.addFlashAttribute("teacher",userForm);
        return new ModelAndView("/views/user/teacher/display_teacher");
    }
    @GetMapping("/add_teacher")
    public String addTeacher(@ModelAttribute("userForm") Teacher userForm, Model model,
                             HttpServletRequest httpServletRequest) {
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
    public ModelAndView updateContact(@ModelAttribute("userForm") Teacher userForm,
                                      HttpServletRequest httpServletRequest,
                                      BindingResult result,
                                      RedirectAttributes redirectAttrs) {
        userForm.setUser(userService.getCurrentUser());
        validator.validate(userForm, result);
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
*/
}
