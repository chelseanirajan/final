package com.jugal.adminsecurity.user.repository;

import com.jugal.adminsecurity.user.model.Parent;
import com.jugal.adminsecurity.user.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ParentsRepository extends JpaRepository<Parent, Long> {
    Parent findByStudent(Student student);
}
