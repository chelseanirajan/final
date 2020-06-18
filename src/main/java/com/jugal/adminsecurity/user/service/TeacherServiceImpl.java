package com.jugal.adminsecurity.user.service;

import com.jugal.adminsecurity.model.User;
import com.jugal.adminsecurity.service.UserService;
import com.jugal.adminsecurity.user.model.Teacher;
import com.jugal.adminsecurity.user.repository.TeacherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherServiceImpl {
    @Autowired
    protected UserService userService;
    @Autowired
    protected TeacherRepository teacherRepository;

    public Teacher save(Teacher teacher){
        return teacherRepository.save(teacher);
    }
    public List<Teacher> findAll(){
        return teacherRepository.findAll();
    }
    public Teacher findById(Long id){
        return teacherRepository.findById(id).get();
    }
    public void deleteById(Long id){
        teacherRepository.deleteById(id);
    }
    public List<Teacher> findAllByUser(User user){
        return teacherRepository.findAllByUser(user);
    }

}
