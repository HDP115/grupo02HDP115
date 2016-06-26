//Copia la tabla d euna pantalla a otra.
function copiarTabla(){
  string = String($("#tablaDatos").html());
  string = string.replace(/(\r\n|\n|\r)/gm,"");
  string = $.trim(string);
  $.redirect('graficar', {table : string});
}

//Función para graficar, utilizando la libreia highchart.
function graficar(){
  $('#grafica').highcharts({
        data: {
            table: 'datatable'
        },
        title: {
            text: 'Grafica de datos'
        },
        yAxis: {
            allowDecimals: false,
            title: {
                text: '$'
            }
        },
        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + '</b><br/>' +
                    this.point.y + ' ' + this.point.name.toLowerCase();
            }
        }
    });
}
