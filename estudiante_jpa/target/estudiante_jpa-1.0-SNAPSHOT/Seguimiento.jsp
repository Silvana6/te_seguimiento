<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="com.emergentes.entidades.Estudiante"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seguimiento</title>

        <link rel="stylesheet" href="css/seguimiento.css"/>
    </head>
    <body>
        <h1>Lista de Estudiantes</h1>

        <a class="new-btn" href="EstudianteServlet?action=add">NUEVO REGISTRO</a>
        <div class="container">
            <table border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>NOMBRE</th>
                        <th>APELLIDOS</th>
                        <th>EMAIL</th>
                        <th>FECHA NACIMIENTO</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${estudiantes}">

                        <tr>
                            <td>${item.id}</td>
                            <td>${item.nombre}</td>
                            <td>${item.apellidos}</td>
                            <td>${item.email}</td>
                            <td><fmt:formatDate value="${item.fechaNacimiento}" pattern="dd-MM-yyyy" /></td>
                            <td><a href="EstudianteServlet?action=edit&id=${item.id}">EDITAR</a></td>
                            <td><a href="EstudianteServlet?action=dele&id=${item.id}">ELIMINAR</a></td>
                        </tr>

                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
