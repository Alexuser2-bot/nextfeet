<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:choose>
    <c:when test="${empty items}">
        <p class="cart-empty">
            Tu carrito está vacío. Explora las zapatillas y agrega tus favoritas.
        </p>
    </c:when>

    <c:otherwise>
        <c:forEach var="i" items="${items}">
            <div class="mini-item">
                <div class="mini-icon">👟</div>

                <div class="mini-info">
                    <strong><c:out value="${i.nombre}"/></strong>
                    <small>
                        Talla <c:out value="${i.talla}"/> · S/ <c:out value="${i.precio}"/>
                    </small>

                    <form action="/carrito/actualizar" method="post" data-cart-form>
                        <input type="hidden" name="zapatillaId" value="${i.id}">
                        <input type="hidden" name="talla" value="${i.talla}">

                        <label>
                            Cantidad
                            <input type="number" name="cantidad" min="1" max="99"
                                   value="${i.cantidad}" aria-label="Cantidad">
                        </label>

                        <button type="submit" class="mini-btn">Actualizar</button>
                    </form>

                    <form action="/carrito/eliminar" method="post" data-cart-form>
                        <input type="hidden" name="zapatillaId" value="${i.id}">
                        <input type="hidden" name="talla" value="${i.talla}">

                        <button type="submit" class="mini-remove">Quitar producto</button>
                    </form>
                </div>
            </div>
        </c:forEach>

        <div class="mini-total">
            <span>Total</span>
            <strong>S/ <c:out value="${total}"/></strong>
        </div>

        <form action="/carrito/vaciar" method="post" data-cart-form data-confirm="¿Vaciar el carrito?">
            <button class="mini-clear">Vaciar carrito</button>
        </form>

        <a class="checkout-btn" href="/checkout/direccion">Finalizar compra →</a>
    </c:otherwise>
</c:choose>
