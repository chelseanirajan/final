package com.jugal.adminsecurity.user.service;

import com.jugal.adminsecurity.user.model.Parent;
import com.jugal.adminsecurity.user.model.Student;
import com.jugal.adminsecurity.user.repository.ParentsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ParentsServiceImpl {
    @Autowired
    protected ParentsRepository parentRepository;

    public Parent save(Parent parent) {
        return parentRepository.save(parent);
    }

    public Parent findByStudent(Student student) {
        return parentRepository.findByStudent(student);
    }

    public List<Parent> findAll() {
        return parentRepository.findAll();
    }

    public Optional<Parent> findById(Long id) {
        return parentRepository.findById(id);
    }

    public void deleteById(Long id) {
        parentRepository.deleteById(id);
    }

}
