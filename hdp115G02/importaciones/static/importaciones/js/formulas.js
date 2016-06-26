//Crea la estructura común del layout de los botores.
function getBtn(btn){
  var string = '<div class="row"><div class="col-md-6"><div class="anio2014"><p>2014</p>' + btn;
  string += '</div></div><div class="col-md-6"><div class="anio2015"><p>2015</p>' + btn + '</div></div></div>';
  return string;
}

//Inserta los botones dentro de los div correspondientes.
$(document).on("ready", function(){
  //Para los div de importaciones, exportaciones y balanza comercial.
  var meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];

  //Crear el layout y los botones.
  var btnMeses = '<div class="row">';
  for(i=0; i<meses.length; i++){
    btnMeses += '<div class="col-md-4"><input type="button" value="'+ meses[i] +'" onclick="asignarVariable(this);"></div>';
    if ((i+1)%3 == 0 && i != meses.length){
      btnMeses += '</div><div class="row">';
    }
  }
  btnMeses += '</div>';
  btnMeses += '<div class="row"><div class="col-md-4"></div><div class="col-md-4"><input type="button" name="name" value="Anual" onclick="asignarVariable(this);"></div><div class="col-md-4"></div></div>';

  //Obtiene el layout y los botones, y los inserta en los div.
  var botonesMeses = getBtn(btnMeses);
  $("#imp").append(botonesMeses);
  $("#exp").append(botonesMeses);
  $("#bal").append(botonesMeses);


  //Para el div del pib
  var trimestres = ["I", "II", "III", "IV"];

  var btnTrimestres = '<div class="row"><div class="col-md-3"></div>';
  for(i=0; i<trimestres.length; i++){
    btnTrimestres += '<div class="col-md-3"><input type="button" value="'+ trimestres[i] +'" onclick="asignarVariable(this);"></div>';
    if ((i+1)%2 == 0 && i != trimestres.length){
      btnTrimestres += '</div><div class="row"><div class="col-md-3"></div>';
    }
  }
  btnTrimestres += '</div>';
  btnTrimestres += '<div class="row"><div class="col-md-4"></div><div class="col-md-4"><input type="button" name="name" value="Anual" onclick="asignarVariable(this);"></div><div class="col-md-4"></div></div>';

  //Obtener layout e insertar en el div
  var botonesTrimestres = getBtn(btnTrimestres);
  $("#pib").append(botonesTrimestres);


  //Agrega la clase btn a los input para darles estilo.
  $(".tab-content input").addClass("btn form-control");
});

//Crea el nombre de la variable seleccionada.
function asignarVariable(t){
  var value = ($(t).val());
  value = value.substring(0,3);
  var tipo = "";
  var variable = "";

  if($.contains((document.getElementById('imp')),t)){
    tipo = $("#imp .producto").val();
    if($.contains(document.querySelectorAll('#imp .anio2014')[0], t)){
      variable += "imp"+value+"14"+tipo;
    }
    if($.contains(document.querySelectorAll('#imp .anio2015')[0], t)){
      variable += "imp"+value+"15"+tipo;
    }
  }

  if($.contains((document.getElementById('exp')),t)){
    tipo = $("#exp .producto").val();
    if($.contains(document.querySelectorAll('#exp .anio2014')[0], t)){
      variable += "exp"+value+"14"+tipo;
    }
    if($.contains(document.querySelectorAll('#exp .anio2015')[0], t)){
      variable += "exp"+value+"15"+tipo;
    }
  }

  if($.contains((document.getElementById('bal')),t)){
    tipo = $("#bal .producto").val();
    if($.contains(document.querySelectorAll('#bal .anio2014')[0], t)){
      variable += "bal"+value+"14"+tipo;
    }
    if($.contains(document.querySelectorAll('#bal .anio2015')[0], t)){
      variable += "bal"+value+"15"+tipo;
    }
  }

  if($.contains((document.getElementById('pib')),t)){
    tipo = $("#pib .tipoPib").val();
    if($.contains(document.querySelectorAll('#pib .anio2014')[0], t)){
      variable += "pib"+value+"14"+tipo;
    }
    if($.contains(document.querySelectorAll('#pib .anio2015')[0], t)){
      variable += "pib"+value+"15"+tipo;
    }
  }

  agregarVariable(variable);
}

//Agrega la variable al text. 
function agregarVariable(v){
  var actValue = $("#formula").val();
  $("#formula").val(actValue + v);
}
