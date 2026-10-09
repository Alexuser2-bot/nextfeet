# Carrito flotante NextFeet - explicación sencilla

**Qué hace:** muestra un carrito en la esquina inferior derecha que se abre y minimiza. Permite agregar, cambiar cantidad, quitar productos y vaciar sin abandonar la página.

**Archivos:** `js/carrito-panel.js` controla el clic y actualiza el contenido; `css/nextfeet.css` define tamaño, colores y responsive; `cliente/carrito-panel.jsp` muestra productos y total; `CarritoController.java` expone `/carrito/panel` reutilizando `CarritoService`.

**Cómo explicarlo:** "Usamos HTML y CSS para el panel; JavaScript `fetch()` envía el formulario sin cambiar de página; Spring Boot guarda el carrito en la base de datos a través del servicio existente. Luego el panel vuelve a consultar los productos y muestra el total actualizado".

**Responsive:** con `width:min(...)` y `@media` el panel se adapta a pantallas pequeñas.

**Importante:** para comprar se usa el botón 'Finalizar compra' y se pasa al checkout habitual. Las imágenes SVG incluidas son ilustrativas y pueden reemplazarse por fotos reales autorizadas.

**Prueba:** iniciar sesión, entrar al catálogo, abrir una zapatilla, elegir talla, agregar, abrir/minimizar, modificar cantidad, quitar y finalizar compra.
