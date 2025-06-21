package com.hust.dao;

import com.hust.entity.Student;
import com.hust.entity.StudentScore;
import javax.persistence.EntityManager;
import java.util.List;

public class StudentDAO extends GenericDAO<Student> {

    public StudentDAO() {
        super(Student.class);
    }

    public List<StudentScore> getStudentScores(Integer studentId) {
        EntityManager em = getEntityManager();
        try {
            return em.createQuery(
                            "SELECT ss FROM StudentScore ss " +
                                    "JOIN FETCH ss.subject " +
                                    "WHERE ss.student.studentId = :studentId", StudentScore.class)
                    .setParameter("studentId", studentId)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public List<Object[]> getStudentScoreDetails() {
        EntityManager em = getEntityManager();
        try {
            return em.createQuery(
                            "SELECT s.studentCode, s.fullName, sub.subjectName, " +
                                    "ss.score1, ss.score2, sub.credit " +
                                    "FROM Student s " +
                                    "JOIN s.studentScores ss " +
                                    "JOIN ss.subject sub " +
                                    "ORDER BY s.studentCode, sub.subjectName", Object[].class)
                    .getResultList();
        } finally {
            em.close();
        }
    }
}