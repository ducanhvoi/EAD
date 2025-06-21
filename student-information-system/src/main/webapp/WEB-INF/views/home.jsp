<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Information System</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f5f5f5; }
        .header { background-color: #4CAF50; color: white; padding: 15px; text-align: center; margin-bottom: 20px; }
        .buttons { margin-bottom: 20px; }
        .btn { background-color: #4CAF50; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px; margin-right: 10px; }
        .btn:hover { background-color: #45a049; }
        table { border-collapse: collapse; width: 100%; background-color: white; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #4CAF50; color: white; }
        tr:nth-child(even) { background-color: #f2f2f2; }
        .grade-A { color: #4CAF50; font-weight: bold; }
        .grade-B { color: #2196F3; font-weight: bold; }
        .grade-D { color: #FF9800; font-weight: bold; }
        .grade-F { color: #F44336; font-weight: bold; }
    </style>
</head>
<body>
    <div class="header">
        <h1>Student Information System</h1>
        <h2>Student Information</h2>
    </div>

    <div class="buttons">
        <a href="${pageContext.request.contextPath}/student" class="btn">+ Student</a>
        <a href="${pageContext.request.contextPath}/score" class="btn">+ Score</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>Student Id</th>
                <th>Student Name</th>
                <th>Subject Name</th>
                <th>Score 1</th>
                <th>Score 2</th>
                <th>Credit</th>
                <th>Grade</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="score" items="${scoreViews}" varStatus="status">
                <tr>
                    <td>${score.studentCode}</td>
                    <td>${score.fullName}</td>
                    <td>${score.subjectName}</td>
                    <td><fmt:formatNumber value="${score.score1}" pattern="#0.0"/></td>
                    <td><fmt:formatNumber value="${score.score2}" pattern="#0.0"/></td>
                    <td>${score.credit}</td>
                    <td class="grade-${score.letterGrade}">${score.letterGrade}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>