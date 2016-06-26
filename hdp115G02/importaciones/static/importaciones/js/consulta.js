function habilitarConsulta(){

  $.ajax({
    type: "POST",
    url:"habilitarConsulta",
    data: {opc : $("#listaOpciones").val()},
    success: function(anios){
      //alert(anios);
      a = JSON.parse(anios);
      $("#listaAnio").prop('disabled', false);

      var options = "";
      for(i = 0; i < a.length; i++ ){
          options += '<option val ="' + i + '">'+a[i].pk+'</option>';
      }

      $("#listaAnio").append(options);        
     },
});
}
