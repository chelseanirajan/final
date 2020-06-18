package com.jugal.adminsecurity.user.repository;

import com.jugal.adminsecurity.model.User;
import com.jugal.adminsecurity.user.model.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TeacherRepository extends JpaRepository<Teacher,Long> {
    List<Teacher> findAllByUser(User user);

}
