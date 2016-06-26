// Habilita los meses al escoger el año.
function habilitarMeses(){
  $.ajax({
    type: "POST",
    url:"habilitarMeses",
    data: {anio: $("#listaAnios").val()},
    //Si se recupera la lista de meses.
    success: function(meses){

      $("#listaMeses").prop('disabled', false);

      var options = '<option value="0" selected="true" disabled="true">Seleccionar...</option>';
      for(i = 0; i < meses.length; i++ ){
          options += '<option value ="' + meses[i].mes + '">'+meses[i].mes+'</option>';
      }

      //anexa las opciones.
      $("#listaMeses option").remove();
      $("#listaMeses").append(options);
     },
   });
}

//Guarda el dato ingresado.
function guardar(){
  $.ajax({
    type: "POST",
    url: "guardar",
    data: {
      anio: $("#listaAnios").val(),
      mes: $("#listaMeses").val(),
      producto: $("#listaProductos").val(),
      val: $("#txtDato").val(),
    },
    //Mensaje de exito
    success: function(a){
      alert("Dato guardado exitosamente.");
     },
  });
}
