# NextFeet - mejoras de experiencia de usuario

## Cliente
- **Catálogo:** Ver detalle abre una ventana superpuesta (`dialog`) sin salir del catálogo. Cerrar con X, Escape, pulsar fuera o Seguir comprando.
- **Agregar al carrito:** botón directamente debajo de Ver detalle. Seleccionar talla y pulsar agregar. El carrito se actualiza en una esquina sin recargar la página.
- **Detalle independiente:** botón Volver al catálogo y Seguir comprando.
- **Barra y carrito:** navegación sticky y carrito fixed, visibles al desplazarse.
- **Sesión:** menú Ingresar/Registrarse para visitantes; Perfil/Pedidos/Salir cuando hay sesión.

## Administrador - sugerencias para la exposición (sin nuevas dependencias)
- Confirmar antes de eliminar un producto o categoría.
- Mostrar stock bajo con un texto de advertencia.
- Ordenar los pedidos por fecha y estado.
- Añadir mensajes de confirmación después de guardar.
Estas mejoras se pueden implementar gradualmente sin modificar la arquitectura por capas.

## Imágenes
Coloca imágenes JPG en `src/main/webapp/images/productos/` con el nombre del ID del producto: `1.jpg`, `2.jpg`, etc. Si falta una imagen se usa `/images/zapatilla.svg`. Se recomienda usar fotos propias o con permiso.

## Explicación técnica
HTML/JSP dibuja las tarjetas; CSS Grid organiza las columnas; `dialog` muestra y oculta el detalle; JavaScript lee los atributos `data-*` del botón y rellena el detalle; `fetch` envía los formularios al controlador existente, sin cambiar de página. No se han añadido frameworks.
