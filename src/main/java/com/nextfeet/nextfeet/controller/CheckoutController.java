package com.nextfeet.nextfeet.controller;

import com.nextfeet.nextfeet.cart.CarritoService;
import com.nextfeet.nextfeet.model.Pedido;
import com.nextfeet.nextfeet.model.Usuario;
import com.nextfeet.nextfeet.model.Zapatilla;
import com.nextfeet.nextfeet.service.PedidoService;
import jakarta.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.List;
import java.util.UUID;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/checkout")
public class CheckoutController {
    private final CarritoService carrito;
    private final PedidoService pedidos;
    private final JdbcTemplate db;

    public CheckoutController(CarritoService carrito, PedidoService pedidos, JdbcTemplate db) {
        this.carrito = carrito;
        this.pedidos = pedidos;
        this.db = db;
    }

    private Usuario usuario(HttpSession sesion) {
        return (Usuario) sesion.getAttribute("usuario");
    }

    @GetMapping("/direccion")
    public String direccion(HttpSession sesion, Model modelo) {
        Usuario usuario = usuario(sesion);
        if (usuario == null) return "redirect:/login";
        if (carrito.listar(usuario.getId()).isEmpty()) return "redirect:/catalogo";
        modelo.addAttribute("total", carrito.total(usuario.getId()));
        return "cliente/direccion";
    }

    @PostMapping("/pagar")
    @Transactional
    public String pagar(@RequestParam String ciudad,
                        @RequestParam String distrito,
                        @RequestParam String direccionExacta,
                        @RequestParam(required = false, defaultValue = "") String referencias,
                        @RequestParam String metodoPago,
                        HttpSession sesion, Model modelo) {
        Usuario usuario = usuario(sesion);
        if (usuario == null) return "redirect:/login";
        List<Zapatilla> productos = carrito.listar(usuario.getId());
        if (productos.isEmpty()) return "redirect:/catalogo";
        if (ciudad.isBlank() || distrito.isBlank() || direccionExacta.isBlank()) {
            modelo.addAttribute("error", "Completa los datos de entrega.");
            modelo.addAttribute("total", carrito.total(usuario.getId()));
            return "cliente/direccion";
        }

        // Comprobar existencias antes de registrar el pedido.
        for (Zapatilla producto : productos) {
            Integer stock = db.query("SELECT cantidad FROM stock_talla WHERE zapatilla_id=? AND talla=?",
                    (rs, fila) -> rs.getInt(1), producto.getId(), producto.getTalla())
                    .stream().findFirst().orElse(0);
            if (producto.getCantidad() <= 0 || stock < producto.getCantidad()) {
                modelo.addAttribute("error", "Stock insuficiente para " + producto.getNombre()
                        + " (talla " + producto.getTalla() + ").");
                modelo.addAttribute("total", carrito.total(usuario.getId()));
                return "cliente/direccion";
            }
        }

        KeyHolder llaveDireccion = new GeneratedKeyHolder();
        db.update(conexion -> {
            PreparedStatement ps = conexion.prepareStatement(
                    "INSERT INTO direccion(usuario_id,ciudad,distrito,direccion_exacta,referencias) VALUES(?,?,?,?,?)",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, usuario.getId());
            ps.setString(2, ciudad.trim());
            ps.setString(3, distrito.trim());
            ps.setString(4, direccionExacta.trim());
            ps.setString(5, referencias.trim());
            return ps;
        }, llaveDireccion);

        Pedido pedido = new Pedido();
        pedido.setCodigo("NF-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        pedido.setUsuarioId(usuario.getId());
        pedido.setDireccionId(llaveDireccion.getKey().intValue());
        pedido.setTotal(carrito.total(usuario.getId()));
        pedido.setMetodoPago(metodoPago);
        pedido.setEstado("EN_PREPARACION");
        Integer pedidoId = pedidos.crear(pedido);

        for (Zapatilla producto : productos) {
            BigDecimal precio = producto.getPrecio();
            db.update("INSERT INTO detalle_pedido(pedido_id,zapatilla_id,talla,cantidad,precio_unitario,subtotal) VALUES(?,?,?,?,?,?)",
                    pedidoId, producto.getId(), producto.getTalla(), producto.getCantidad(), precio,
                    precio.multiply(BigDecimal.valueOf(producto.getCantidad())));
            int actualizadas = db.update("UPDATE stock_talla SET cantidad=cantidad-? WHERE zapatilla_id=? AND talla=? AND cantidad>=?",
                    producto.getCantidad(), producto.getId(), producto.getTalla(), producto.getCantidad());
            if (actualizadas != 1) throw new IllegalStateException("El stock cambió durante la compra.");
        }
        carrito.vaciar(usuario.getId());
        modelo.addAttribute("pedido", pedidos.obtener(pedidoId));
        return "cliente/comprobante";
    }
}
