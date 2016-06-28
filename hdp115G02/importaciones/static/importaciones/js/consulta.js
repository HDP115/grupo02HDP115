function validar(){
  var opc = $("#listaOpciones").val();
  var anio = $("#listaAnio").val();
  var prod = $("#listaProductos").val();

  //alert(opc +" asd "+ anio + " asdf " + prod);

  var resp = false;

  if(!opc){
    alert("Elija una opcion!");
  }
  else{
    if(opc == 'pib'){
      if(!anio){
        alert("Elija un año!");
      }
      else{
        resp = true;
      }
    }
    else{
      if(!anio || !prod){
        alert("Elija un producto y un año!")
      }
      else{
        resp = true;
      }
    }
  }

  if(resp){
    buscar();
  }
}

// Habilita los select requeridos.
function habilitar(){
  //Para cualquier opción, habilita los años.
  habilitarAnio();

  //Habilita los prouctos si no se elije pib.
  if($("#listaOpciones").val() != 'pib'){
    habilitarProducto();
  }
  //Desahabilita los productos al elegir pib.
  else {
    $("#listaProductos").prop('disabled', true);
  }
}

//Habilita la selección de año.
function habilitarAnio(){
  $.ajax({
    type: "POST",
    url:"habilitarConsulta",
    data: {tipo: 1},
    success: function(anios){
      //Habilita el select
      $("#listaAnio").prop('disabled', false);

      //Convierte la respuesta del servidor a un formato JSON
      a = JSON.parse(anios);

      var options = '<option value="0" selected="true" disabled="true">Seleccionar...</option>';
      for(i = 0; i < a.length; i++ ){
          options += '<option value ="' + a[i].pk + '">'+a[i].pk+'</option>';
      }

      $("#listaAnio option").remove();
      $("#listaAnio").append(options);
     },
   });
}

//Habilita selección de productos.
function habilitarProducto(){
  $.ajax({
    type: "POST",
    url: "habilitarConsulta",
    data: {tipo: 2},
    success: function(productos){
      //Habilita select
      $("#listaProductos").prop('disabled', false);

      p = JSON.parse(productos);

      var options = '<option value="0" selected="true" disabled="true">Seleccionar...</option>';
      for(i = 0; i < p.length; i++ ){
          if(p[i].pk != 0){
              options += '<option>'+p[i]['fields'].nombre_producto+'</option>';
          }
      }
      options += '<option value="0">Los 5 productos </option>';

      $("#listaProductos option").remove();
      $("#listaProductos").append(options);

    },
  });
}

//Realiza la consulta.
function buscar(){
  var opc = $("#listaOpciones").val();
  var anio = $("#listaAnio").val();
  var prod = $("#listaProductos").val();

  var tipo = 1;

  if(opc == 'pib'){
    tipo = 2;
  }

  $.ajax({
    type: "POST",
    url: "buscar",
    data: {
      tipo : tipo,
      anio : anio,
      producto : prod,
    },
    success: function(result){
      //Crea la tabla con los datos recibidos.

      //Caption de la tabla.
      var table ='<table id="datatable" class="table table-striped">';
      if(opc == 'imp'){
        table += '<caption>Importaciones del ' + anio + '</caption>';
      }
      if(opc == 'exp'){
        table += '<caption>Exportaciones del ' + anio + '</caption>';
      }
      if(opc == 'bal'){
        table += '<caption>Balanza comercial del ' + anio + '</caption>';;
      }
      if(opc == 'pib'){
        table += '<caption>PIB del ' + anio + '</caption>';;
      }

      //Crea el contenido de la tabla según el tipo de consulta realizada.

      if(tipo == 1){
        if(prod != 0){

        //Tabla para un solo producto.
          table += '<theah><tr><th>Mes</th><th>'+prod+'</th></tr></thead>';
          table += '<tbody>';
          for(i=0; i<result.length; i++){
            table += '<tr><th>'+result[i].periodomensual__mes+'</th>';
            if(opc == 'imp'){
              table += '<td>'+result[i].importacion+'</td>';
            }
            if(opc == 'exp'){
              table += '<td>'+result[i].exportacion+'</td>';
            }
            if(opc == 'bal'){
              var dato = result[i].exportacion-result[i].importacion;
              table += '<td>'+dato.toFixed(2)+'</td>';
            }
            table += '</tr>';
          }
          table += '</tbody>';
        }
        else{

          //Tabla para todos los productos.
          table += '<theah><tr><th>Mes</th>';
          for(i=0; i<5; i++){
            table += '<th>'+result[i].codigo_producto__nombre_producto+'</th>'
          }
          table += '</tr></thead>';

          table += '<tbody>';
          for(i=0; i<result.length; i++){
            if(i%5==0){
              table += '<tr><th>'+result[i].periodomensual__mes+'</th>';
            }
            if(opc == 'imp'){
              table += '<td>'+result[i].importacion+'</td>';
            }
            if(opc == 'exp'){
              table += '<td>'+result[i].exportacion+'</td>';
            }
            if(opc == 'bal'){
              var dato = result[i].exportacion-result[i].importacion;
              table += '<td>'+dato.toFixed(2)+'</td>';
            }
            if((i+1)%5==0){
              table += '</tr>';
            }
          }
          table += '</tbody>';
        }
      }
      else{
        //Tabla para el PIB
        table += '<theah><tr><th>Trimestre</th><th>Corriente</th><th>Constante</th></thead>';
        table += '<tbody>';
        for(i=0; i<result.length; i++){
          if(i%2==0){
            table += '<tr><th>'+result[i].periodotrimestral__trimestre+'</th>';
          }
          table += '<td>'+result[i].cantidad+'</td>';
          if((i+1)%2==0){
            table += '</tr>';
          }
        }
        table += '</tbody>';
      }

      table += '</table>';

      $("#tablaDatos table").remove();
      $("#tablaDatos").append(table);
    },
  });
}
