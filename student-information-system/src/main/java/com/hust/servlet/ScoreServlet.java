package com.hust.servlet;

import com.hust.dao.StudentDAO;
import com.hust.dao.StudentScoreDAO;
import com.hust.dao.SubjectDAO;
import com.hust.entity.Student;
import com.hust.entity.StudentScore;
import com.hust.entity.Subject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/score")
public class ScoreServlet extends HttpServlet {
    private StudentDAO studentDAO = new StudentDAO();
    private SubjectDAO subjectDAO = new SubjectDAO();
    private StudentScoreDAO studentScoreDAO = new StudentScoreDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Student> students = studentDAO.findAll();
        List<Subject> subjects = subjectDAO.findAll();

        request.setAttribute("students", students);
        request.setAttribute("subjects", subjects);
        request.getRequestDispatcher("/WEB-INF/views/score-form.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer studentId = Integer.parseInt(request.getParameter("studentId"));
        Integer subjectId = Integer.parseInt(request.getParameter("subjectId"));
        BigDecimal score1 = new BigDecimal(request.getParameter("score1"));
        BigDecimal score2 = new BigDecimal(request.getParameter("score2"));

        Student student = studentDAO.findById(studentId);
        Subject subject = subjectDAO.findById(subjectId);

        StudentScore studentScore = new StudentScore(student, subject, score1, score2);
        studentScoreDAO.save(studentScore);

        response.sendRedirect(request.getContextPath() + "/");
    }
}