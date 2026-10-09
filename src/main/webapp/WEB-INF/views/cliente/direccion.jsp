<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dirección</title>
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
            <h2>Dirección de entrega</h2>

            <c:if test="${not empty error}">
                <p class="checkout-error"><c:out value="${error}"/></p>
            </c:if>
            <p>Revisa tus datos de entrega antes de confirmar el pedido.</p>
            <form method="post" action="/checkout/pagar">
                <label>
                    Ciudad
                    <input name="ciudad" placeholder="Ej. Huancayo" maxlength="100" required>
                </label>

                <label>
                    Distrito
                    <input name="distrito" placeholder="Ej. El Tambo" maxlength="100" required>
                </label>

                <label>
                    Dirección exacta
                    <input name="direccionExacta" placeholder="Calle, número y referencia" maxlength="250" required>
                </label>

                <label>
                    Referencias (opcional)
                    <input name="referencias" placeholder="Cerca de..." maxlength="500">
                </label>

                <label>
                    Método de pago (simulado)
                    <select name="metodoPago">
                        <option>Tarjeta</option>
                        <option>Yape/Plin</option>
                        <option>Transferencia</option>
                    </select>
                </label>

                <p><strong>Total: S/ <c:out value="${total}"/></strong></p>

                <div class="checkout-actions">
                    <a href="/carrito">← Volver al carrito</a>
                    <button type="submit">Confirmar pedido</button>
                </div>
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
