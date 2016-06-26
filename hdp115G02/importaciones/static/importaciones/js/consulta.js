function habilitar(){
  habilitarAnio();

  if($("#listaOpciones").val() != 'pib'){
    habilitarProducto();
  }
}

function habilitarAnio(){
  $.ajax({
    type: "POST",
    url:"habilitarConsulta",
    data: {tipo: 1},
    success: function(anios){
      $("#listaAnio").prop('disabled', false);
      $("#listaProductos").prop('disabled', true);

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

function habilitarProducto(){
  $.ajax({
    type: "POST",
    url: "habilitarConsulta",
    data: {tipo: 2},
    success: function(productos){
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

      if(tipo == 1){
        if(prod != 0){
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
