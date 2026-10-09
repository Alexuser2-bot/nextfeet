<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Contacto</title>
    <link rel="stylesheet" href="/css/nextfeet.css">
</head>
<body>
    <header>
        <h1>NextFeet</h1>
        <nav>
            <a href="/home">Inicio</a>
            <a href="/catalogo">Catálogo</a>
            <a href="/ofertas">Ofertas</a>
            <a href="#" onclick="abrirCarrito();return false">Carrito</a>

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
        <div class="card">
            <h2>Contacto</h2>

            <form>
                <input placeholder="Nombre">
                <input placeholder="Correo">
                <input placeholder="Asunto">
                <textarea placeholder="Mensaje"></textarea>

                <button>Enviar mensaje</button>
            </form>
        </div>
    </main>

    <footer>NextFeet · E-commerce de zapatillas</footer>

    <div class="cart-widget" id="cart-widget">
        <button type="button"
                class="cart-toggle"
                id="cart-toggle"
                aria-expanded="false"
                aria-controls="cart-panel">
            🛒 <span>Mi carrito</span> <span id="cart-arrow">▲</span>
        </button>

        <section id="cart-panel" class="cart-panel" hidden>
            <div class="cart-heading">
                <strong>Tu carrito</strong>
                <button type="button" id="cart-close" aria-label="Minimizar carrito">−</button>
            </div>
            <div id="cart-content">Cargando...</div>
        </section>
    </div>

    <script src="/js/carrito-panel.js" defer></script>
</body>
</html>
