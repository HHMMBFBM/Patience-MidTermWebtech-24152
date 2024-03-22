package com.mugabo.service;

import com.mugabo.controller.StudentDao;
import com.mugabo.domain.Student;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {

    private StudentDao studentDao = new StudentDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "delete":
                    deleteStudent(request, response);
                    break;
                case "list":
                    listStudents(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                default:
                    listStudents(request, response);
                    break;
            }
        } else {
            listStudents(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "add":
                    addStudent(request, response);
                    break;
                case "update":
                    updateStudent(request, response);
                    break;
                default:
                    listStudents(request, response);
                    break;
            }
        } else {
            listStudents(request, response);
        }
    }

    private void addStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String regno = request.getParameter("regno");
        String fullname = request.getParameter("fullname");
        String dateofbirth = request.getParameter("dateofbirth"); // Ensure this matches your Student entity and database

        Student student = new Student();
        student.setRegno(regno);
        student.setFullname(fullname);
        student.setDateofbirth(dateofbirth); // Adjust this line according to your Student class constructor or setters

        studentDao.saveStudent(student);
        response.sendRedirect("StudentServlet?action=list"); // Redirect to list all students after adding
    }

    private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String regno = request.getParameter("regno");
        String fullname = request.getParameter("fullname");
        String dateofbirth = request.getParameter("dateofbirth"); // Same note as above

        Student student = studentDao.getStudentById(regno);
        if (student != null) {
            student.setFullname(fullname);
            student.setDateofbirth(dateofbirth); // Adjust according to your Student class
            studentDao.updateStudent(student);
        }
        response.sendRedirect("StudentServlet?action=list"); // Redirect after update
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String regno = request.getParameter("regno");
        studentDao.deleteStudent(regno);
        response.sendRedirect("StudentServlet?action=list"); // Redirect after deletion
    }


    private void listStudents(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> students = studentDao.getAllStudents();
        request.setAttribute("students", students);
        request.getRequestDispatcher("studentList.jsp").forward(request, response); // Forward to JSP page to show all students
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String regno = request.getParameter("regno");
        Student existingStudent = studentDao.getStudentById(regno);
        request.setAttribute("student", existingStudent);
        request.getRequestDispatcher("editStudent.jsp").forward(request, response); // Forward to the edit form
    }

}
