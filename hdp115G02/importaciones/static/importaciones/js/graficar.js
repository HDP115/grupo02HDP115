function copiarTabla(){
  string = String($("#tablaDatos").html());
  string = string.replace(/(\r\n|\n|\r)/gm,"");
  string = $.trim(string);
  $.redirect('graficar', {table : string});
}

function graficar(){
  $('#grafica').highcharts({
        data: {
            table: 'datatable'
        },
        title: {
            text: 'Data extracted from a HTML table in the page'
        },
        yAxis: {
            allowDecimals: false,
            title: {
                text: 'Units'
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
