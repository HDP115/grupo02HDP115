function habilitarConsultaP(){
           $.ajax({  
                url:"habilitarP",  
                method:"POST",   
                success:function(productos){  
                     $('#listaProducto').prop('disabled', false);  
                },  
           });
}




  


