package org.example.studentmanagementsystem.controller;

import org.example.studentmanagementsystem.model.Courses;
import org.example.studentmanagementsystem.repo.CoursesRepo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

@Controller
@RequestMapping("/course")
public class CoursesController {
    private final CoursesRepo coursesRepo;

    public CoursesController(CoursesRepo coursesRepo) {
        this.coursesRepo = coursesRepo;
    }

    //Path Mappings
    @GetMapping("view-courses")
    public String getAllCourses(Model model){
        List<Courses> courses = coursesRepo.findAll();
        model.addAttribute("courses", courses);
        return "view-courses";
    }

    @GetMapping("/add-courses")
    public String mappingToAddCourses(Model model) {
        model.addAttribute("courses", coursesRepo.findAll());
        return "add-courses";
    }

    @GetMapping("/edit-course/{courseId}")
    public String mappingToEditCourses(@PathVariable int courseId, Model model) {
        Courses courses = coursesRepo.findById(courseId)
                .orElseThrow(() -> new RuntimeException("Course Not Found"));
        model.addAttribute("course", courses);
        return "edit-course";
    }

    //in actual web
    @PostMapping("/edit-course")
    public String updateCourse(@ModelAttribute Courses courses){
        coursesRepo.save(courses);
        return "redirect:/course/view-courses";
    }

    @PostMapping("/add-course")
    public String addCourse(@ModelAttribute Courses courses) {
        coursesRepo.save(courses);
        return "redirect:/course/view-courses";
    }

    @GetMapping("/delete-course/{courseId}")
    public String deleteCourse(@PathVariable int courseId){
        coursesRepo.deleteById(courseId);
        return "redirect:/course/view-courses";
    }

    //POSTMAN
    @RequestMapping("courses")
    @ResponseBody
    public List<Courses> getAllCoursesToDropdown(){
        return (List<Courses>) coursesRepo.findAll();
    }

}
