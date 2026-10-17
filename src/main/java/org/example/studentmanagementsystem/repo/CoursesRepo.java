package org.example.studentmanagementsystem.repo;

import org.example.studentmanagementsystem.model.Courses;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CoursesRepo extends JpaRepository<Courses, Integer> {
}
