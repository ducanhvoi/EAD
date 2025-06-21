<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f5f5f5; }
        .header { background-color: #4CAF50; color: white; padding: 15px; text-align: center; margin-bottom: 20px; }
        .form-container { background-color: white; padding: 30px; border-radius: 10px; margin-bottom: 20px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input[type="text"] { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px; }
        .btn { background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer; margin-right: 10px; text-decoration: none; display: inline-block; }
        .btn:hover { background-color: #45a049; }
        .btn-secondary { background-color: #6c757d; }
        .btn-secondary:hover { background-color: #5a6268; }
        table { border-collapse: collapse; width: 100%; background-color: white; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #4CAF50; color: white; }
        tr:nth-child(even) { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <div class="header">
        <h1>Add New Student</h1>
    </div>

    <div class="form-container">
        <form method="post" action="${pageContext.request.contextPath}/student">
            <div class="form-group">
                <label for="studentCode">Student Code:</label>
                <input type="text" id="studentCode" name="studentCode" required>
            </div>

            <div class="form-group">
                <label for="fullName">Full Name:</label>
                <input type="text" id="fullName" name="fullName" required>
            </div>

            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address">
            </div>

            <button type="submit" class="btn">Add Student</button>
            <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">Back to Home</a>
        </form>
    </div>

    <h2>Current Students</h2>
    <table>
        <thead>
            <tr>
                <th>Student Code</th>
                <th>Full Name</th>
                <th>Address</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="student" items="${students}">
                <tr>
                    <td>${student.studentCode}</td>
                    <td>${student.fullName}</td>
                    <td>${student.address}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>