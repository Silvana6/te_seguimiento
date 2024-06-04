<%@page import="com.emergentes.entidades.Estudiante"%>
<%
    Estudiante est = (Estudiante) request.getAttribute("estudiante");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        
        <link rel="stylesheet" href="css/form.css"/>
    </head>
    <body>
        <h1>Registrar a un nuevo Estudiante</h1>

        <form action="EstudianteServlet" method="post">
            <input type="hidden" name="id" value="<%= est.getId() %>" >
            
            <div class="form-box">
                <label for="nombre" class="form-label">Nombre</label>
                <input type="text" class="form-control" name="nombre" value="<%= est.getNombre() %>">
            </div>
            
            <div class="form-box">
                <label for="apellidos" class="form-label">Nombre</label>
                <input type="text" class="form-control" name="apellidos" value="<%= est.getApellidos() %>">
            </div>
            
            <div class="form-box">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" name="email" value="<%= est.getEmail() %>">
            </div>
            
            <div class="form-box">
                <label for="fechaNac" class="form-label">Fecha de Nacimiento</label>
                <input type="date" class="form-control" name="fechaNacimiento" value="<%= est.getFechaNacimiento() %>">
            </div>
            
            <button type="submit" class="btn-submit">GUARDAR</button>
        </form>
    </body>
</html>
