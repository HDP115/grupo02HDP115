function getBtn(btn){
  var string = '<div class="row"><div class="col-md-6"><div class="anio2014"><p>2014</p>' + btn;
  string += '</div></div><div class="col-md-6"><div class="anio2015"><p>2015</p>' + btn + '</div></div></div>';
  return string;
}

$(document).on("ready", function(){
  var meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];

  var btnMeses = '<div class="row">';
  for(i=0; i<meses.length; i++){
    btnMeses += '<div class="col-md-4"><input type="button" value="'+ meses[i] +'"></div>';
    if ((i+1)%3 == 0 && i != meses.length){
      btnMeses += '</div><div class="row">';
    }
  }
  btnMeses += '</div>';
  btnMeses += '<div class="row"><div class="col-md-4"></div><div class="col-md-4"><input type="button" name="name" value="Anual"></div><div class="col-md-4"></div></div>';

  var trimestres = ["I", "II", "III", "IV"];

  var btnTrimestres = '<div class="row"><div class="col-md-3"></div>';
  for(i=0; i<trimestres.length; i++){
    btnTrimestres += '<div class="col-md-3"><input type="button" value="'+ trimestres[i] +'"></div>';
    if ((i+1)%2 == 0 && i != trimestres.length){
      btnTrimestres += '</div><div class="row"><div class="col-md-3"></div>';
    }
  }
  btnTrimestres += '</div>';
  btnTrimestres += '<div class="row"><div class="col-md-4"></div><div class="col-md-4"><input type="button" name="name" value="Anual"></div><div class="col-md-4"></div></div>';


  botonesMeses = getBtn(btnMeses);
  botonesTrimestres = getBtn(btnTrimestres);

  $("#imp").append(botonesMeses);
  $("#exp").append(botonesMeses);
  $("#bal").append(botonesMeses);
  $("#pib").append(botonesTrimestres);

  $(".tab-content input").addClass("btn form-control");
});

/*
<div class="row">
  <div class="col-md-6">
    <div class="anio2014">
      <p>2014</p>

      <div class="row">
        <div class="col-md-4"><input type="button" value="Enero"></div>
        <div class="col-md-4"><input type="button" value="Febrero"></div>
        <div class="col-md-4"><input type="button" value="Marzo"></div>
      </div>
      <div class="row">
        <div class="col-md-4"><input type="button" name="name" value="Abril"></div>
        <div class="col-md-4"><input type="button" name="name" value="Mayo"></div>
        <div class="col-md-4"><input type="button" name="name" value="Junio"></div>
      </div>
      <div class="row">
        <div class="col-md-4"><input type="button" name="name" value="Julio"></div>
        <div class="col-md-4"><input type="button" name="name" value="Agosto"></div>
        <div class="col-md-4"><input type="button" name="name" value="Septiembre"></div>
      </div>
      <div class="row">
        <div class="col-md-4"><input type="button" name="name" value="Octubre"></div>
        <div class="col-md-4"><input type="button" name="name" value="Noviembre"></div>
        <div class="col-md-4"><input type="button" name="name" value="Diciembre"></div>
      </div>
      <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4"><input type="button" name="name" value="Anual"></div>
        <div class="col-md-4"></div>
      </div>

    </div>
  </div>
  <div class="col-md-6">
    <div class="anio2015">
      <p>2015</p>

      <div class="row">
        <div class="col-md-4"><input type="button" value="Enero"></div>
        <div class="col-md-4"><input type="button" value="Febrero"></div>
        <div class="col-md-4"><input type="button" value="Marzo"></div>
      </div>
      <div class="row">
        <div class="col-md-4"><input type="button" name="name" value="Abril"></div>
        <div class="col-md-4"><input type="button" name="name" value="Mayo"></div>
        <div class="col-md-4"><input type="button" name="name" value="Junio"></div>
      </div>
      <div class="row">
        <div class="col-md-4"><input type="button" name="name" value="Julio"></div>
        <div class="col-md-4"><input type="button" name="name" value="Agosto"></div>
        <div class="col-md-4"><input type="button" name="name" value="Septiembre"></div>
      </div>
      <div class="row">
        <div class="col-md-4"><input type="button" name="name" value="Octubre"></div>
        <div class="col-md-4"><input type="button" name="name" value="Noviembre"></div>
        <div class="col-md-4"><input type="button" name="name" value="Diciembre"></div>
      </div>
      <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4"><input type="button" name="name" value="Anual"></div>
        <div class="col-md-4"></div>
      </div>

    </div>
  </div>
</div>
*/
