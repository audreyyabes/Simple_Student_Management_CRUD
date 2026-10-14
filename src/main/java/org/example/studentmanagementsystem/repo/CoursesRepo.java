package org.example.studentmanagementsystem.repo;

import org.example.studentmanagementsystem.model.Courses;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CoursesRepo extends JpaRepository<Courses, Long> {
}
