<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<html>
<head>
    <title>Triángulo Isósceles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light p-4">

<div class="container">
    <h1 class="text-center mb-4">Cálculo de Triángulo Isósceles</h1>

    <%
        HttpSession sesion = request.getSession();
        String usuario = (String) sesion.getAttribute("usuario");
        if (usuario == null) {
    %>
    <form action="calcularTriangulo" method="post" class="mb-3">
        <div class="mb-3">
            <label class="form-label">Por favor, ingresa tu nombre:</label>
            <input type="text" class="form-control" name="nombre" required>
        </div>
        <button type="submit" class="btn btn-primary">Guardar nombre y continuar</button>
    </form>
    <%
    } else {
    %>
    <h3 class="text-success">¡Bienvenido de nuevo, <%= usuario %>!</h3>
    <%
        }
    %>

    <%
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            String base = null, altura = null, area = null, perimetro = null;
            for (Cookie c : cookies) {
                switch (c.getName()) {
                    case "base": base = c.getValue(); break;
                    case "altura": altura = c.getValue(); break;
                    case "area": area = c.getValue(); break;
                    case "perimetro": perimetro = c.getValue(); break;
                }
            }
            if (base != null) {
    %>
    <div class="alert alert-info">
        <strong>Último cálculo guardado:</strong><br>
        Base: <%= base %><br>
        Altura: <%= altura %><br>
        Área: <%= area %><br>
        Perímetro: <%= perimetro %>
    </div>
    <%
            }
        }
    %>

    <form action="calcularTriangulo" method="post" class="card p-3 shadow-sm">
        <div class="mb-3">
            <label class="form-label">Base:</label>
            <input type="number" name="base" step="0.01" required class="form-control">
        </div>
        <div class="mb-3">
            <label class="form-label">Altura:</label>
            <input type="number" name="altura" step="0.01" required class="form-control">
        </div>
        <button type="submit" class="btn btn-success w-100">Calcular</button>
    </form>
</div>
</body>
</html>