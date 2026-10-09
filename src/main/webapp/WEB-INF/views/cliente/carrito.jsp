<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Carrito</title>
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
        <h2>Carrito</h2>

        <table>
            <tr>
                <th>Producto</th>
                <th>Talla</th>
                <th>Cantidad</th>
                <th>Precio</th>
                <th>Acción</th>
            </tr>

            <c:forEach var="i" items="${items}">
                <tr>
                    <td>${i.nombre}</td>
                    <td>${i.talla}</td>
                    <td>
                        <form method="post" action="/carrito/actualizar">
                            <input type="hidden" name="zapatillaId" value="${i.id}">
                            <input type="hidden" name="talla" value="${i.talla}">
                            <input name="cantidad" value="${i.cantidad}" type="number" min="1">

                            <button>Actualizar</button>
                        </form>
                    </td>
                    <td>S/ ${i.precio}</td>
                    <td>
                        <form method="post" action="/carrito/eliminar">
                            <input type="hidden" name="zapatillaId" value="${i.id}">
                            <input type="hidden" name="talla" value="${i.talla}">

                            <button class="danger">Eliminar</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <div class="card">
            <h3>Total: S/ ${total}</h3>

            <form method="post" action="/carrito/vaciar">
                <button class="danger">Vaciar carrito</button>
            </form>

            <a href="/checkout/direccion">Continuar checkout</a>
        </div>
    </main>

    <footer>NextFeet · E-commerce de zapatillas</footer>
</body>
</html>
