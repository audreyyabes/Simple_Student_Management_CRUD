package org.example.studentmanagementsystem.controller;

import org.example.studentmanagementsystem.model.Courses;
import org.example.studentmanagementsystem.model.Students;
import org.example.studentmanagementsystem.repo.CoursesRepo;
import org.example.studentmanagementsystem.repo.StudentsRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import java.util.List;

@Controller
@RequestMapping("/students")
public class StudentsController {
    @Autowired
    StudentsRepo studentsRepo;
    CoursesRepo coursesRepo;


    public StudentsController(StudentsRepo studentsRepo, CoursesRepo coursesRepo) {
        this.studentsRepo = studentsRepo;
        this.coursesRepo = coursesRepo;
    }

    @GetMapping("/add-students")
    public String viewCourses(Model model){
        model.addAttribute("courses", coursesRepo.findAll());
        return "add-students";
    }

    @GetMapping("/view-students")
    public String viewAllStudents(Model model){
        List<Students> students = studentsRepo.findAll();
        List<Courses> courses = coursesRepo.findAll();
        model.addAttribute("students", students);
        model.addAttribute("courses", courses);
        return "view-students";
    }


    // POST: Add to db
    @PostMapping("/add-students")
    public String saveStudent(Students students) {
        students.setIs_active(true);
        studentsRepo.save(students);
        return "redirect:/students/view-students";
    }

    //POSTMAN ~ GET /read
    @RequestMapping("/students-lists")
    @ResponseBody //Postman wont read if wala to
    public List<Students> getStudents(){
        return (List<Students>) studentsRepo.findAll();
    }

    @GetMapping("/student-detail/{studentId}")
    public String studentDetail(@PathVariable int studentId, Model model){
        List<Courses> courses = coursesRepo.findAll();
        Students students = studentsRepo.findById(studentId)
                .orElseThrow(() -> new RuntimeException("Student Not found"));
        model.addAttribute("students", students);
        model.addAttribute("courses", courses);
        return "student-detail";
    }
    //POSTMAN UPDATE/EDIT
    //Open edit page
    @GetMapping("/edit-student/{studentId}")
    public String updatePage(@PathVariable int studentId, Model model){
        List<Courses> courses = coursesRepo.findAll();
        Students students = studentsRepo.findById(studentId)
                .orElseThrow(() -> new RuntimeException("Student Not found"));
        model.addAttribute("students", students);
        model.addAttribute("courses", courses);
        return "edit-student";
    }
    //Update in edit page
    @PostMapping("/edit-student")
    public String updateStudent(Students students){
        studentsRepo.save(students);
        return "redirect:/students/view-students";
    }

    //POSTMAN DELETE
    @GetMapping("/delete-student/{studentId}")
    public String deleteStudent(@PathVariable int studentId){
        studentsRepo.deleteById(studentId);
        return "redirect:/students/view-students";
    }


}
