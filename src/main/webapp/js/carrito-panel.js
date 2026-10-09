// Panel de carrito: usa fetch para evitar cambiar de página.
const panel = document.getElementById('cart-panel');
const toggle = document.getElementById('cart-toggle');
const content = document.getElementById('cart-content');
function abrirCarrito() { panel.hidden = false; toggle.setAttribute('aria-expanded','true'); cargarCarrito(); }
function cerrarCarrito() { panel.hidden = true; toggle.setAttribute('aria-expanded','false'); }
async function cargarCarrito() {
  try {
    const respuesta = await fetch('/carrito/panel', {credentials:'same-origin'});
    if (respuesta.status === 401) { content.textContent = 'Inicia sesión para usar el carrito.'; return; }
    if (!respuesta.ok) throw new Error('No se pudo cargar el carrito');
    content.innerHTML = await respuesta.text();
  } catch (error) { content.textContent = error.message; }
}
toggle.addEventListener('click', () => panel.hidden ? abrirCarrito() : cerrarCarrito());
document.getElementById('cart-close').addEventListener('click', cerrarCarrito);
document.addEventListener('submit', async function(event) {
  const form = event.target;
  if (!form.matches('[data-cart-form], form[action="/carrito/agregar"]')) return;
  event.preventDefault();
  if (form.dataset.confirm && !confirm(form.dataset.confirm)) return;
  const boton = form.querySelector('button[type="submit"],button:not([type])');
  if (boton) boton.disabled = true;
  try {
    const respuesta = await fetch(form.action, {method:'POST',body:new FormData(form),credentials:'same-origin'});
    if (!respuesta.ok) throw new Error('No se pudo actualizar el carrito. Revisa la talla y el stock.');
    if (respuesta.redirected && respuesta.url.includes('/login')) { location.href='/login'; return; }
    if (typeof ventanaDetalle !== "undefined" && ventanaDetalle.open) ventanaDetalle.close();
    abrirCarrito();
  } catch (error) { alert(error.message); }
  finally { if (boton) boton.disabled = false; }
});
