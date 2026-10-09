// Ventana de detalle sin salir del catálogo. Solo JavaScript básico.
const ventanaDetalle = document.getElementById('detalle-modal');
function verDetalle(boton) {
  document.getElementById('detalle-id').value = boton.dataset.id;
  document.getElementById('detalle-nombre').textContent = boton.dataset.name;
  document.getElementById('detalle-marca').textContent = boton.dataset.brand;
  document.getElementById('detalle-descripcion').textContent = boton.dataset.description;
  document.getElementById('detalle-precio').textContent = 'S/ ' + boton.dataset.price;
  const foto = document.getElementById('detalle-imagen');
  foto.onerror = function () { this.onerror = null; this.src = '/images/zapatilla.svg'; };
  foto.src = '/images/productos/' + boton.dataset.id + '.jpg';
  ventanaDetalle.showModal();
}
function cerrarDetalle() { ventanaDetalle.close(); }
ventanaDetalle.addEventListener('click', function (evento) {
  if (evento.target === ventanaDetalle) cerrarDetalle();
});
