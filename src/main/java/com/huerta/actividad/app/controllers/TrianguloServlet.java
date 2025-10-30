package com.huerta.actividad.app.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/calcularTriangulo")
public class TrianguloServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String nombreUsuario = request.getParameter("nombre");

        if (nombreUsuario != null && !nombreUsuario.isEmpty()) {
            session.setAttribute("usuario", nombreUsuario);
        } else if (session.getAttribute("usuario") == null) {
            session.setAttribute("usuario", "Invitado");
        }

        double base = Double.parseDouble(request.getParameter("base"));
        double altura = Double.parseDouble(request.getParameter("altura"));

        Triangulo t = new Triangulo(base, altura);
        double area = t.calcularArea();
        double perimetro = t.calcularPerimetro();

        // Guardar resultados en cookies
        response.addCookie(new Cookie("base", String.valueOf(base)));
        response.addCookie(new Cookie("altura", String.valueOf(altura)));
        response.addCookie(new Cookie("area", String.valueOf(area)));
        response.addCookie(new Cookie("perimetro", String.valueOf(perimetro)));

        // Enviar resultados a la JSP
        request.setAttribute("area", area);
        request.setAttribute("perimetro", perimetro);
        request.getRequestDispatcher("/WEB-INF/jsp/resultado.jsp").forward(request, response);
    }
}