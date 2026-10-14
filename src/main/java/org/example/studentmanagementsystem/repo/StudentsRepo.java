package org.example.studentmanagementsystem.repo;

import org.example.studentmanagementsystem.model.Students;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StudentsRepo extends JpaRepository<Students, Integer> {

}
