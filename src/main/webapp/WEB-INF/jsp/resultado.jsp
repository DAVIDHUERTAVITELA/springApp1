<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Resultado del Triángulo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light p-4">

<div class="container text-center">
    <h2 class="text-primary">Resultados del Triángulo Isósceles</h2>
    <p class="mt-3">Área: <strong><%= request.getAttribute("area") %></strong></p>
    <p>Perímetro: <strong><%= request.getAttribute("perimetro") %></strong></p>

    <a href="/index.jsp" class="btn btn-secondary mt-3">Regresar</a>
</div>

</body>
</html>