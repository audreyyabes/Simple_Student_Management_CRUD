package org.example.studentmanagementsystem.repo;

import org.example.studentmanagementsystem.model.Students;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface StudentsRepo extends JpaRepository<Students, Integer> {
    List<Students> findByCourseId(int courseId);

}
