<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="com.emergentes.entidades.Estudiante"%>
<%
    List<Estudiante> est = (List<Estudiante>) request.getAttribute("estudiante");
%>

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
        
        <a href="EstudianteServlet?action=add">NUEVO REGISTRO</a>
        
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>NOMBRE</th>
                    <th>APELLIDOS</th>
                    <th>EMAIL</th>
                    <th>FECHA NAC.</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${est}">
                
                <tr>
                    <td>${item.id}</td>
                    <td>${item.nombre}</td>
                    <td>${item.apellidos}</td>
                    <td>${item.email}</td>
                    <td>${item.fechaNacimiento}</td>
                    <td><a href="EstudianteServlet?action=edit&id=${item.id}">EDITAR</a></td>
                    <td><a href="EstudianteServlet?action=dele&id=v${item.id}">ELIMINAR</a></td>
                </tr>
            
            </c:forEach>
                </tbody>
        </table>
    </body>
</html>
