<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Score</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f5f5f5; }
        .header { background-color: #4CAF50; color: white; padding: 15px; text-align: center; margin-bottom: 20px; }
        .form-container { background-color: white; padding: 30px; border-radius: 10px; margin-bottom: 20px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        select, input[type="number"] { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px; }
        .btn { background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer; margin-right: 10px; text-decoration: none; display: inline-block; }
        .btn:hover { background-color: #45a049; }
        .btn-secondary { background-color: #6c757d; }
        .btn-secondary:hover { background-color: #5a6268; }
    </style>
</head>
<body>
    <div class="header">
        <h1>Add Score for Student</h1>
    </div>

    <div class="form-container">
        <form method="post" action="${pageContext.request.contextPath}/score">
            <div class="form-group">
                <label for="studentId">Select Student:</label>
                <select id="studentId" name="studentId" required>
                    <option value="">-- Select Student --</option>
                    <c:forEach var="student" items="${students}">
                        <option value="${student.studentId}">${student.studentCode} - ${student.fullName}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="subjectId">Select Subject:</label>
                <select id="subjectId" name="subjectId" required>
                    <option value="">-- Select Subject --</option>
                    <c:forEach var="subject" items="${subjects}">
                        <option value="${subject.subjectId}">${subject.subjectCode} - ${subject.subjectName}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="score1">Score 1:</label>
                <input type="number" id="score1" name="score1" step="0.1" min="0" max="10" required>
            </div>

            <div class="form-group">
                <label for="score2">Score 2:</label>
                <input type="number" id="score2" name="score2" step="0.1" min="0" max="10" required>
            </div>

            <button type="submit" class="btn">Add Score</button>
            <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">Back to Home</a>
        </form>
    </div>
</body>
</html>