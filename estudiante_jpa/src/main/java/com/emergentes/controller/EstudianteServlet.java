package com.emergentes.controller;

import com.emergentes.bean.BeanEstudiante;
import com.emergentes.entidades.Estudiante;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EstudianteServlet", urlPatterns = {"/EstudianteServlet"})
public class EstudianteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BeanEstudiante daoEstudiante = new BeanEstudiante();

        Estudiante est = new Estudiante();
        int id;

        String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

        switch (action) {
            case "add":
                request.setAttribute("estudiante", est);
                request.getRequestDispatcher("Registro.jsp").forward(request, response);
                break;

            case "edit":
                id = Integer.parseInt(request.getParameter("id"));
                est = daoEstudiante.buscar(id);
                request.setAttribute("estudiante", est);
                request.getRequestDispatcher("Registro.jsp").forward(request, response);
                break;

            case "dele":
                id = Integer.parseInt(request.getParameter("id"));
                daoEstudiante.eliminar(id);
                response.sendRedirect("EstudianteServlet");
                break;

            case "view":
                List<Estudiante> lista = daoEstudiante.listarTodos();
                request.setAttribute("estudiante", lista);
                request.getRequestDispatcher("Seguimiento.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BeanEstudiante daoEstudiante = new BeanEstudiante();

        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String email = request.getParameter("email");
        String fechaNac = request.getParameter("fechaNacimiento");

        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        Date fechaN;
        try {
            fechaN = sdf.parse(fechaNac);
        } catch (ParseException e) {
            e.printStackTrace();
            return;
        }

        Estudiante est = new Estudiante();
        est.setId(id);
        est.setNombre(nombre);
        est.setApellidos(apellidos);
        est.setEmail(email);
        est.setFechaNacimiento(fechaN);

        if (id > 0) {
            daoEstudiante.editar(est);
        } else {
            daoEstudiante.insertar(est);
        }

        response.sendRedirect("EstudianteServlet");
    }
}