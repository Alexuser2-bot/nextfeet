# NextFeet: guía para exposición e imágenes

## Cómo agregar fotos reales
1. Abre `src/main/webapp/images/productos/`.
2. Guarda las fotos con el **ID de la zapatilla** de la base de datos: `1.jpg`, `2.jpg`, `3.jpg`, etc.
3. Reinicia la aplicación (o recompila si no se actualiza) y abre el catálogo.
4. Si no existe la foto, se mostrará la imagen ilustrativa predeterminada.

Las JSP utilizan `src="/images/productos/${z.id}.jpg"` para relacionar cada producto con su foto. En la ficha de producto se usa `${zapatilla.id}`. No es necesario modificar Java.

## ¿Y si quiero usar enlaces externos?
En vez de `src="/images/productos/${z.id}.jpg"` puedes usar `src="https://sitio-ejemplo.com/foto.jpg"`, siempre que tengas permiso para usar la imagen y que la URL sea una imagen pública directa. Para una exposición, las fotos locales son más confiables.

## Qué explicar
- `position: sticky` mantiene el menú arriba al desplazarse.
- `position: fixed` mantiene el carrito abajo a la derecha sin desplazarse con el contenido.
- `z-index` coloca el carrito encima de las tarjetas.
- `grid-template-columns` alinea productos en columnas.
- `object-fit: contain` muestra las zapatillas completas dentro de cada tarjeta.
- `@media` adapta el diseño a celular y tablet.
- `fetch()` actualiza el carrito sin redirigir al cliente.

## Importante
Las imágenes locales se organizan por ID y los datos (nombre, precio, talla y stock) siguen viniendo de Spring Boot y de la base de datos. El diseño no modifica los repositorios ni servicios.
