<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard</title>
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
        <h2>Panel de administración</h2>

        <div class="grid">
            <div class="card">
                <a href="/admin/administradores">Administradores</a>
            </div>
            <div class="card">
                <a href="/admin/clientes">Clientes</a>
            </div>
            <div class="card">
                <a href="/admin/categorias">Categorías</a>
            </div>
            <div class="card">
                <a href="/admin/zapatillas">Zapatillas</a>
            </div>
            <div class="card">
                <a href="/admin/pedidos">Pedidos</a>
            </div>
            <div class="card">
                <a href="/admin/ofertas">Ofertas</a>
            </div>
        </div>
    </main>

    <footer>NextFeet · E-commerce de zapatillas</footer>
</body>
</html>
