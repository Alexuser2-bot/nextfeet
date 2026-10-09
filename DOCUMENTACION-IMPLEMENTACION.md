# NextFeet — implementación basada en la documentación

La estructura conserva el patrón del proyecto de ejemplo: **Controller -> Service -> ServiceImpl -> DAO -> Repository**, con JSP para las interfaces y `schema.sql/data.sql` para persistencia inicial.

## Módulos implementados
- Módulo 1: Autenticación y cuenta de cliente (F01-F05)
- Módulo 2: Catálogo, búsqueda y detalle (F06-F10)
- Módulo 3: Carrito (F11-F15)
- Módulo 4: Checkout, pedido y seguimiento (F16-F20)
- Módulo 5: Administración de usuarios/clientes (F21-F28)
- Módulo 6: Categorías (F29-F32)
- Módulo 7: Inventario de zapatillas (F33-F38)
- Módulo 8: Pedidos administrativos (F39-F41)
- Módulo 9: Ofertas (F42-F45)

## Interfaces
Las vistas JSP están organizadas en `WEB-INF/views`, separando cliente y administración. Las interfaces I01-I38 de la documentación quedan representadas por las vistas y rutas correspondientes.

## Nota de alcance
La documentación original excluye pasarelas de pago reales, notificaciones automatizadas y autenticación de correo. Por ello, el checkout usa un pago simulado y no integra proveedores externos.

## Credenciales de prueba
- Administrador: `admin@nextfeet.com` / `admin123`
- Cliente: `cliente@nextfeet.com` / `123456`

## Ejecución
```bash
mvn clean test
mvn spring-boot:run
```
