package com.jugal.adminsecurity.controller;

import com.jugal.adminsecurity.model.AppRole;
import com.jugal.adminsecurity.model.Role;
import com.jugal.adminsecurity.model.User;
import com.jugal.adminsecurity.repository.RoleRepository;
import com.jugal.adminsecurity.service.RoleService;
import com.jugal.adminsecurity.service.SecurityService;
import com.jugal.adminsecurity.service.UserService;
import com.jugal.adminsecurity.user.model.Student;
import com.jugal.adminsecurity.user.model.Teacher;
import com.jugal.adminsecurity.user.service.ParentsServiceImpl;
import com.jugal.adminsecurity.user.service.StudentServiceImpl;
import com.jugal.adminsecurity.user.service.TeacherServiceImpl;
import com.jugal.adminsecurity.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
@PreAuthorize("hasRole('ROLE_ADMIN')")
@RequestMapping("/super-admin")
public class SuperAdminController {
    @Autowired
    UserService userService;

    @Autowired
    RoleService roleService;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private StudentServiceImpl studentService;
    @Autowired
    protected TeacherServiceImpl teacherService;
    @Autowired
    protected ParentsServiceImpl parentsService;

    @Autowired
    private SecurityService securityService;


    @GetMapping()
    public String welcome(Model model) {
        if (!model.containsAttribute("userForm")) {
            model.addAttribute("userForm", new User());
        }
        model.addAttribute("userProfile", userService.getCurrentUser());
        model.addAttribute("student", studentService.findAll());
        model.addAttribute("teacher", teacherService.findAll());
        model.addAttribute("parent", parentsService.findAll());
        Role adminRole = roleService.findByRole(AppRole.ROLE_ADMIN.toString());
        model.addAttribute("admins", adminRole.getUsers());
        return "/views/super-admin/index";
    }

    @GetMapping({"/table"})
    public String table(Model model) {

        return "/views/super-admin/table";
    }

    @GetMapping({"/student"})
    public String student(Model model) {
        if (!model.containsAttribute("userForm")) {
            model.addAttribute("userForm", new User());
        }
        model.addAttribute("userProfile", userService.getCurrentUser());
        model.addAttribute("student", studentService.findAll());
        return "/views/super-admin/student";
    }

    @GetMapping({"/edit"})
    public String editStudent(@RequestParam("id") Long id, Model model) {
        Student student = studentService.findById(id);
        model.addAttribute("userForm", student);
        model.addAttribute("id", student.getId());
        return "/views/super-admin/edit-student";
    }

    @PostMapping({"/update"})
    public ModelAndView updateContact(@ModelAttribute("userForm") Student userForm,
                                      HttpServletRequest httpServletRequest,
                                      BindingResult result,
                                      RedirectAttributes redirectAttrs) {
        userForm.setUser(userService.getCurrentUser());
        if (result.hasErrors()) {
            httpServletRequest.setAttribute("url", "student");
            return new ModelAndView("/views/super-admin/edit-student");
        }
        studentService.save(userForm);
        redirectAttrs.addFlashAttribute("student", userForm);
        redirectAttrs.addAttribute("student", studentService.findAll());
        return new ModelAndView("redirect:/super-admin/student");
    }

    @GetMapping({"/details"})
    public String studentDetailsdById(@RequestParam("id") Long id, Model model) {
        Student student = studentService.findById(id);
        model.addAttribute("detail", student);
        return "/views/super-admin/student-detail";
    }

    @GetMapping({"/delete"})
    public String deleteStudent(@RequestParam("id") Long id) {
        studentService.deleteById(id);
        return "/views/super-admin/student";
    }

    @GetMapping({"/teacher"})
    public String teacher(Model model) {
        if (!model.containsAttribute("userForm")) {
            model.addAttribute("userForm", new User());
        }
        model.addAttribute("teacher", teacherService.findAll());
        return "/views/super-admin/teacher";

    }

    @GetMapping({"/teacher/edit"})
    public String editTeacher(@RequestParam("id") Long id, Model model) {
        Teacher teacher = teacherService.findById(id);
        model.addAttribute("userForm", teacher);
        //model.addAttribute("id",teacher.getId());
        return "/views/super-admin//edit-teacher";
    }

    @PostMapping({"teacher/update"})
    public ModelAndView updateContact(@ModelAttribute("userForm") Teacher userForm,
                                      HttpServletRequest httpServletRequest,
                                      BindingResult result,
                                      RedirectAttributes redirectAttrs) {
        userForm.setUser(userService.getCurrentUser());
        if (result.hasErrors()) {
            httpServletRequest.setAttribute("url", "student");
            return new ModelAndView("/views/super-admin/edit-teacher");
        }
        teacherService.save(userForm);
        //model.addAttribute("teacher", teacherService.findAllByUser(userService.getCurrentUser()));
        redirectAttrs.addFlashAttribute("teacher", userForm);
        return new ModelAndView("redirect:/super-admin/teacher");
        //views/user/teacher/display_teacher
    }

    @GetMapping({"/teacher/delete"})
    public String deleteTeacher(@RequestParam("id") Long id) {
        teacherService.deleteById(id);
        return "redirect:/super-admin/teacher";
    }

    @GetMapping({"/parent"})
    public String parent(Model model) {
        if (!model.containsAttribute("userForm")) {
            model.addAttribute("userForm", new User());
        }
        List<Student> students = studentService.findAll();
        students.forEach(student -> student.setParent(parentsService.findByStudent(student)));
        model.addAttribute("student", students);
        ///model.addAttribute("teacher",teacherService.findAll());
        return "/views/super-admin/parent";
    }

    @GetMapping({"/user"})
    public String user(Model model) {
        if (!model.containsAttribute("userForm")) {
            model.addAttribute("userForm", new User());
        }
        model.addAttribute("user", userService.findAll());
        return "/views/super-admin/user";
    }

    @PostMapping()
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, RedirectAttributes redirectAttrs) {
        userValidator.validate(userForm, bindingResult);
        if (bindingResult.hasErrors()) {
            redirectAttrs.addFlashAttribute("id", 123);
            redirectAttrs.addFlashAttribute("userForm", userForm);
            return "redirect:/super-admin";
        }
        Set<Role> roles = new HashSet<>();
        roles.add(roleRepository.findByName(AppRole.ROLE_ADMIN.toString()));
        userForm.setRoles(roles);
        userService.save(userForm);
        return "redirect:/super-admin";
    }

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "/views/super-admin/registration";
    }

    @PostMapping("/registration")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "/views/super-admin/registration";
        }
        Set<Role> roles = new HashSet<>();
        roles.add(roleRepository.findByName("ROLE_USER"));
        userForm.setRoles(roles);
        userService.save(userForm);
        //securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());
        return "redirect:/super-admin/user";
    }
}
