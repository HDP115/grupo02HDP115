function habilitarAgregarId(){

  $.ajax({
    type: "POST",
    url:"habilitarAgregarId",
    data: {opc : $("#listaAnios").val()},
    success: function(anios){
      //alert(anios);
      a = JSON.parse(anios);
      $("#listaAnios").prop('disabled', false);

      var options = "";
      for(i = 0; i < a.length; i++ ){
          options += '<option val ="' + i + '">'+a[i].pk+'</option>';
      }

      $("#listaAnios").append(options);
     },
});
}
