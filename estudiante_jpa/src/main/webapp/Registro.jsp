<%@page import="com.emergentes.entidades.Estudiante"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>

        <link rel="stylesheet" href="css/form.css"/>
    </head>
    <body>
        <h1>
            <c:if test="${estudiante.id == null}"></c:if>
            <c:if test="${estudiante.id != null}"></c:if>

            Registrar a un nuevo Estudiante
        </h1>
        <div class="form-container">
            <div class="form">
                <form action="EstudianteServlet" method="post">
                    <c:if test="${estudiante.id == null}"><input type="hidden" name="id" value="0"> </c:if>
                    <c:if test="${estudiante.id != null}"><input type="hidden" name="id" value="${estudiante.id}"> </c:if>

                    <div class="form-box">
                        <label for="nombre" class="form-label">Nombres</label>
                        <input type="text" class="form-control" name="nombre" id="nombre" value="${estudiante.nombre}">
                    </div>

                    <div class="form-box">
                        <label for="apellidos" class="form-label">Apellidos</label>
                        <input type="text" class="form-control" name="apellidos" id="apellidos" value="${estudiante.apellidos}">
                    </div>

                    <div class="form-box">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" name="email" id="email" value="${estudiante.email}">
                    </div>

                    <div class="form-box">
                        <label for="fechaNacimiento" class="form-label">Fecha de Nacimiento:</label>
                        <input type="date" name="fechaNacimiento" class="form-control" id="fechaNacimiento" value="${estudiante.fechaNacimiento}" required>
                    </div>

                    <div clsss="form-btn">
                        <button type="submit" class="btn-submit">GUARDAR</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
