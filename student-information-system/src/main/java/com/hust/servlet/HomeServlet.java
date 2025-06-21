package com.hust.servlet;

import com.hust.dao.StudentDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/")
public class HomeServlet extends HttpServlet {
    private StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Object[]> studentScoreDetails = studentDAO.getStudentScoreDetails();
        List<StudentScoreView> scoreViews = new ArrayList<>();

        for (Object[] row : studentScoreDetails) {
            StudentScoreView view = new StudentScoreView();
            view.setStudentCode((String) row[0]);
            view.setFullName((String) row[1]);
            view.setSubjectName((String) row[2]);
            view.setScore1((BigDecimal) row[3]);
            view.setScore2((BigDecimal) row[4]);
            view.setCredit((Integer) row[5]);
            scoreViews.add(view);
        }

        request.setAttribute("scoreViews", scoreViews);
        request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
    }

    // Inner class for view
    public static class StudentScoreView {
        private String studentCode;
        private String fullName;
        private String subjectName;
        private BigDecimal score1;
        private BigDecimal score2;
        private Integer credit;

        public BigDecimal getFinalGrade() {
            if (score1 == null || score2 == null) return BigDecimal.ZERO;
            return score1.multiply(new BigDecimal("0.3")).add(score2.multiply(new BigDecimal("0.7")));
        }

        public String getLetterGrade() {
            BigDecimal finalGrade = getFinalGrade();
            if (finalGrade.compareTo(new BigDecimal("8.0")) >= 0) return "A";
            if (finalGrade.compareTo(new BigDecimal("6.0")) >= 0) return "B";
            if (finalGrade.compareTo(new BigDecimal("4.0")) >= 0) return "D";
            return "F";
        }

        // Getters and Setters
        public String getStudentCode() { return studentCode; }
        public void setStudentCode(String studentCode) { this.studentCode = studentCode; }

        public String getFullName() { return fullName; }
        public void setFullName(String fullName) { this.fullName = fullName; }

        public String getSubjectName() { return subjectName; }
        public void setSubjectName(String subjectName) { this.subjectName = subjectName; }

        public BigDecimal getScore1() { return score1; }
        public void setScore1(BigDecimal score1) { this.score1 = score1; }

        public BigDecimal getScore2() { return score2; }
        public void setScore2(BigDecimal score2) { this.score2 = score2; }

        public Integer getCredit() { return credit; }
        public void setCredit(Integer credit) { this.credit = credit; }
    }
}