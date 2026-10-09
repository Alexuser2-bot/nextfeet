<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Categorías</title>
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
        <h2>28 · Categorías</h2>

        <div class="card">
            <form method="post" action="/admin/categorias/crear">
                <input name="nombre" placeholder="Nombre">
                <input name="descripcion" placeholder="Descripción">

                <button>Registrar categoría</button>
            </form>
        </div>

        <table>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Estado</th>
                <th></th>
            </tr>

            <c:forEach var="c" items="${categorias}">
                <tr>
                    <td>${c.id}</td>
                    <td>${c.nombre}</td>
                    <td>${c.descripcion}</td>
                    <td>${c.estado}</td>
                    <td>
                        <form method="post" action="/admin/categorias/desactivar">
                            <input type="hidden" name="id" value="${c.id}">
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
