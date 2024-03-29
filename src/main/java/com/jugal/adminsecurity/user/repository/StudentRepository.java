package com.jugal.adminsecurity.user.repository;

import com.jugal.adminsecurity.model.User;
import com.jugal.adminsecurity.user.model.Student;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StudentRepository extends JpaRepository<Student, Long> {
    Student findByUser(User user);

    List<Student> findByNameLike(String name);

    List<Student> findByYear(Long year);

    List<Student> findAllByUser(User user);

    @Query("select p from Student p where p.id in(:ids)")
    List<Student> findAllById(@Param("ids") List<Long> ids);

    @Query("SELECT DISTINCT year FROM Student")
    List<Long> findNonReferencedYear();
    /*
    @Query("SELECT DISTINCT a.symbolNo FROM Student a")
    List<Student> findDistinctCity(@RequestParam("yearSearch") List<Student> yearSearch);

     */
}
