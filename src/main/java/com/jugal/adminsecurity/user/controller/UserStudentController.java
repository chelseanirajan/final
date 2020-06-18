package com.jugal.adminsecurity.user.controller;

import com.jugal.adminsecurity.service.UserService;
import com.jugal.adminsecurity.user.model.Student;
import com.jugal.adminsecurity.user.service.ParentsServiceImpl;
import com.jugal.adminsecurity.user.service.StudentServiceImpl;
import com.jugal.adminsecurity.validator.UserStudentValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@PreAuthorize("hasRole('ROLE_USER')")
@Controller
@RequestMapping("/user/student")
public class UserStudentController {

    @Autowired
    protected UserService userService;

    @Autowired
    protected StudentServiceImpl studentService;

    @Autowired
    protected ParentsServiceImpl parentsService;

    @Autowired
    private UserStudentValidator validator;

    @GetMapping("")
    public String getForm(@ModelAttribute("userForm") Student userForm,Model model,
                          HttpServletRequest     httpServletRequest) {

        // userform vanne chahinxa ra use vako  xaina  tah? yeslegarda  ho issue ako ho tara bind bha
        //User user =userService.getCurrentUser();
        //Student userForm = studentService.findByUser(user);
        //model.addAttribute("student", userForm);
        return "views/user/add_student";
    }
    @PostMapping({"search"})
    public String searchStudent(@RequestParam("searchName") Long searchName, Model model){
        if(searchName==null) {
            model.addAttribute("student", studentService.findAll());
            return "/views/user/dashboard";
        }

        model.addAttribute("student",studentService.findByYear(searchName));
        model.addAttribute("category",studentService.findNonReferencedYear());
        return "/views/user/dashboard";

    }
/*
    @PostMapping({"yearsearch"})
    public String searchYearStudent(@RequestParam("yearSearch") String yearSearch, Model model){
        model.addAttribute("student",studentService.findByYear(yearSearch));
        return "/views/user/dashboard";
    }
     */
   /* @PostMapping({"searching"})
    public String findStudent(@ModelAttribute("userForm") Student userForm, Model model){
        //model.addAttribute("student",studentService.findAll());
        return "/views/user/dashboard";
    } */
    /*@PostMapping("/checked")
    public String postCheckedStudent(@RequestParam("checkIds") List<Long> ids,Model model,
                          HttpServletRequest httpServletRequest) {
        //User user =userService.getCurrentUser();
        //Student userForm = studentService.findByUser(user);
        //model.addAttribute("student", userForm);
        List<Student> std = studentService.findAllById(ids); //parsing garnu parxa ki k ho
        std.stream().forEach(System.out::println);
        System.out.println(ids);
        return "redirect:/";  //yo  page xa ki  nai?xa
    }
*/

    /*
    public String contact(Model model, HttpServletRequest httpServletRequest) {
        userService.getCurrentUser();
        //User user =
       /* Student student = studentService.findByUser(user);
        if (null == student) {
            return "/views/user/dashboard";
        }
        if (!model.containsAttribute("userForm")) {
            Student userForm = studentService.findByUser(user);
            if (null == userForm) {
                userForm = new Student();
            }
            model.addAttribute("userForm", userForm);
        }
        //Student userForm = studentService.findByUser(user);
       // model.addAttribute("userForm", userForm);
        //httpServletRequest.setAttribute("url", "student");
        return "/views/user/add_product";
    }
*/
    @PostMapping("")
    public ModelAndView saveOrUpdateContact(@Valid @ModelAttribute("userForm") Student userForm,
                                            BindingResult result,
                                            HttpServletRequest httpServletRequest,
                                            RedirectAttributes redirectAttrs) {
        userForm.setUser(userService.getCurrentUser());
        //validator.validate(userForm, result);
        if (result.hasErrors()) {
            httpServletRequest.setAttribute("url", "userForm");
            return new ModelAndView("views/user/add_student");
        }
        studentService.save(userForm);
        redirectAttrs.addFlashAttribute("student",userForm);
        return new ModelAndView("redirect:/");
    }


    @GetMapping({"/edit"})
    public String editStudent(@RequestParam("id") Long id, Model model) {
        Student student = studentService.findById(id);
        model.addAttribute("userForm",student);
        model.addAttribute("id",student.getId());
        return "/views/user/edit-student";
    }
    @PostMapping({"/update"})
    public ModelAndView updateContact(@Valid @ModelAttribute("userForm") Student userForm,
                                            BindingResult result,
                                            HttpServletRequest httpServletRequest,
                                            RedirectAttributes redirectAttrs) {
        userForm.setUser(userService.getCurrentUser());
        //validator.validate(userForm, result);
        if (result.hasErrors()) {
            httpServletRequest.setAttribute("url", "student");
            return new ModelAndView("views/user/add_student");
        }
        studentService.save(userForm);
        redirectAttrs.addFlashAttribute("student",userForm);
        return new ModelAndView("redirect:/");
    }
    @GetMapping({"/delete"})
    public String deleteStudent(@RequestParam("id") Long id) {
        studentService.deleteById(id);
        return "redirect:/";
    }
    @GetMapping({"/details"})
    public String studentDetailsdById(@RequestParam("id") Long id, Model model) {
        Student student = studentService.findById(id);
        model.addAttribute("detail", student);
        model.addAttribute("user",userService.getCurrentUser());
        return "/views/user/detail-student";
    }
    @GetMapping({"excel"})
    public String getExcel() {
        return "/views/user/add-excel";
    }

    @GetMapping({"dow_excel"})
    public String getExcelSheet(Model model) {
        model.addAttribute("student",studentService.findNonReferencedYear());
        return "/views/user/excel_download";
    }
    @GetMapping({"contact"})
    public String getContact(Model model) {
        return "/views/user/contact_info";
    }

    @PostMapping({"/nn"})
    public ModelAndView updateFile(@RequestParam("uploadfile") MultipartFile file,
                                 //  @ModelAttribute("studentList") Student studentList,
                                   HttpServletRequest httpServletRequest,

                                   RedirectAttributes redirectAttrs) {

      /*
      validation
       */
        if(file.getSize() == 0){
            httpServletRequest.setAttribute("url", "student");
            return new ModelAndView("/views/user/add-excel");
        }

     //   studentList.setUser(userService.getCurrentUser());
        //validator.validate(studentList, result);
//        if (result.hasErrors()) {
//            httpServletRequest.setAttribute("url", "student");
//            return new ModelAndView("/views/user/add-excel");
//        }
       // try {
           // userForm.setUser(userService.findByUsername(httpServletRequest.getUserPrincipal().getName()));
            studentService.store(file);
            redirectAttrs.addFlashAttribute("message","File Uploaded Successfully!");
       // } catch (Exception e) {
         redirectAttrs.addFlashAttribute("message","Fail! -> Uploaded filename: " + file.getOriginalFilename());

        //}
        return new ModelAndView("redirect:/");
    }
    @GetMapping({"parent_info"})
    public String getParentInfo(@ModelAttribute("userForm") Student userForm, Model model, HttpServletRequest httpServletRequest) {
        model.addAttribute("student", studentService.findAllByUser(userService.getCurrentUser()));

        return "/views/user/parent_list";
    }





}
