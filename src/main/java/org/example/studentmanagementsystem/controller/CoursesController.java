package org.example.studentmanagementsystem.controller;

import org.example.studentmanagementsystem.model.Courses;
import org.example.studentmanagementsystem.model.Students;
import org.example.studentmanagementsystem.repo.CoursesRepo;
import org.example.studentmanagementsystem.repo.StudentsRepo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ModelAttribute;
import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequestMapping("/course")
public class CoursesController {
    private final CoursesRepo coursesRepo;
    private final StudentsRepo studentsRepo;

    public CoursesController(CoursesRepo coursesRepo, StudentsRepo studentsRepo) {
        this.coursesRepo = coursesRepo;
        this.studentsRepo = studentsRepo;
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

    @GetMapping("/courses-detail/{courseId}")
    public String viewCourseDetails(
            @PathVariable int courseId, Model model) {

        Courses course = coursesRepo.findById(courseId)
                .orElseThrow(() ->
                        new RuntimeException("Course Not Found"));

        List<Students> students =
                studentsRepo.findByCourseId(courseId);

        model.addAttribute("course", course);
        model.addAttribute("students", students);

        return "courses-detail";
    }

    //POSTMAN
    @RequestMapping("courses")
    @ResponseBody
    public List<Courses> getAllCoursesToDropdown(){
        return (List<Courses>) coursesRepo.findAll();
    }

    @GetMapping("/view-courses/{courseId}")
    @ResponseBody
    public List<Students> getStudentsByCourseId(@PathVariable int courseId) {

        return studentsRepo.findByCourseId(courseId);
    }

}
