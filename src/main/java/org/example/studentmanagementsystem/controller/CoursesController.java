package org.example.studentmanagementsystem.controller;

import org.example.studentmanagementsystem.model.Courses;
import org.example.studentmanagementsystem.repo.CoursesRepo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/courses")
public class CoursesController {
    private final CoursesRepo coursesRepo;

    public CoursesController(CoursesRepo coursesRepo) {
        this.coursesRepo = coursesRepo;
    }

    @GetMapping("allCourses")
    public List<Courses> getAllCourses(){
        return coursesRepo.findAll();
    }

    @RequestMapping("courses")
    @ResponseBody
    public List<Courses> getAllCoursesToDropdown(){
        return (List<Courses>) coursesRepo.findAll();
    }

}
