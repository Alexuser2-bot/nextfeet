<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Clientes</title>
    <link rel="stylesheet" href="/css/nextfeet.css">
</head>
<body>
    <header>
        <h1>NextFeet</h1>
        <nav>
            <a href="/home">Inicio</a>
            <a href="/catalogo">Catálogo</a>
            <a href="/ofertas">Ofertas</a>
            <a href="/carrito">Carrito</a>

            <c:choose>
                <c:when test="${not empty sessionScope.usuario}">
                    <a href="/perfil">Mi perfil</a>
                    <a href="/pedidos">Mis pedidos</a>
                    <a href="/logout">Salir</a>
                </c:when>
                <c:otherwise>
                    <a href="/login">Ingresar</a>
                    <a href="/registro">Registrarse</a>
                </c:otherwise>
            </c:choose>
        </nav>
    </header>

    <main class="container">
        <h2>25 · Gestión de clientes</h2>

        <table>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Correo</th>
                <th>Teléfono</th>
                <th>Estado</th>
                <th></th>
            </tr>

            <c:forEach var="u" items="${usuarios}">
                <tr>
                    <td>${u.id}</td>
                    <td>${u.nombres} ${u.apellidos}</td>
                    <td>${u.correo}</td>
                    <td>${u.telefono}</td>
                    <td>${u.estado}</td>
                    <td>
                        <form method="post" action="/admin/clientes/desactivar">
                            <input type="hidden" name="id" value="${u.id}">
                            <button class="danger">Desactivar</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </main>

    <footer>NextFeet · E-commerce de zapatillas</footer>
</body>
</html>
