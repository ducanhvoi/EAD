package com.hust.servlet;

import com.hust.dao.StudentDAO;
import com.hust.entity.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/student")
public class StudentServlet extends HttpServlet {
    private StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Student> students = studentDAO.findAll();
        request.setAttribute("students", students);
        request.getRequestDispatcher("/WEB-INF/views/student-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String studentCode = request.getParameter("studentCode");
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");

        Student student = new Student(studentCode, fullName, address);
        studentDAO.save(student);

        response.sendRedirect(request.getContextPath() + "/student");
    }
}