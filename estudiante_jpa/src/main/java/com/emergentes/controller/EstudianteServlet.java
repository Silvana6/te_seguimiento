package com.emergentes.controller;

import com.emergentes.bean.BeanEstudiante;
import com.emergentes.entidades.Estudiante;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
        BeanEstudiante dao = new BeanEstudiante();

        Estudiante estudiante = new Estudiante();
        int id;

        String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
        
        System.out.println(action);
        
        switch (action) {
            case "add":
                request.setAttribute("estudiante", estudiante);
                request.getRequestDispatcher("Registro.jsp").forward(request, response);
                break;

            case "edit":
                id = Integer.parseInt(request.getParameter("id"));
                estudiante = dao.buscar(id);
                request.setAttribute("estudiante", estudiante);
                request.getRequestDispatcher("Registro.jsp").forward(request, response);
                break;

            case "dele":
                id = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(id);
                response.sendRedirect(request.getContextPath() + "/EstudianteServlet");
                break;

            case "view":
                List<Estudiante> lista = dao.listarTodos();
                request.setAttribute("estudiantes", lista);
                request.getRequestDispatcher("Seguimiento.jsp").forward(request, response);
                break;
                
            default:
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String email = request.getParameter("email");
        String fechaNacimiento = request.getParameter("fechaNacimiento");

        Estudiante estudiante = new Estudiante();
        
        estudiante.setId(id);
        estudiante.setNombre(nombre);
        estudiante.setApellidos(apellidos);
        estudiante.setEmail(email);
        estudiante.setFechaNacimiento(convertirFecha(fechaNacimiento));

        BeanEstudiante dao = new BeanEstudiante();
        
        if (id == 0) {
            
            try {
                dao.insertar(estudiante);
                response.sendRedirect(request.getContextPath() + "/EstudianteServlet");
            } catch (Exception ex) {
                System.out.println("Error " + ex.getMessage());
            }
        } else {
            
            try {
                dao.editar(estudiante);
                response.sendRedirect(request.getContextPath() + "/EstudianteServlet");
            } catch (Exception e) {
                System.out.println("Error " + e.getMessage());
            }
        }

    }
    
    public Date convertirFecha(String fecha){
        Date fechaBD = null;
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        
        java.util.Date fechaTMP;
        try {
            fechaTMP = formato.parse(fecha);
            fechaBD = new Date(fechaTMP.getTime());
        } catch (ParseException ex) {
            Logger.getLogger(EstudianteServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
              
        return fechaBD;
    }
}