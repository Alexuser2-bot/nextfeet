<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Zapatillas</title>
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
        <h2>32 · Gestión de zapatillas</h2>

        <div class="card">
            <form method="post" action="/admin/zapatillas/crear">
                <input name="sku" placeholder="SKU">
                <input name="nombre" placeholder="Nombre">
                <input name="marca" placeholder="Marca">
                <input name="precio" type="number" step="0.01" placeholder="Precio">
                <input name="categoriaId" type="number" placeholder="ID categoría">
                <textarea name="descripcion" placeholder="Descripción"></textarea>
                <input name="materiales" placeholder="Materiales">
                <input name="colores" placeholder="Colores">

                <button>Registrar zapatilla</button>
            </form>
        </div>

        <table>
            <tr>
                <th>ID</th>
                <th>SKU</th>
                <th>Nombre</th>
                <th>Marca</th>
                <th>Precio</th>
                <th>Estado</th>
                <th></th>
            </tr>

            <c:forEach var="z" items="${zapatillas}">
                <tr>
                    <td>${z.id}</td>
                    <td>${z.sku}</td>
                    <td>${z.nombre}</td>
                    <td>${z.marca}</td>
                    <td>${z.precio}</td>
                    <td>${z.estado}</td>
                    <td>
                        <form method="post" action="/admin/zapatillas/desactivar">
                            <input type="hidden" name="id" value="${z.id}">
                            <button>Desactivar</button>
                        </form>

                        <form method="post" action="/admin/zapatillas/eliminar">
                            <input type="hidden" name="id" value="${z.id}">
                            <button class="danger">Eliminar</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </main>

    <footer>NextFeet · E-commerce de zapatillas</footer>
</body>
</html>
