<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Registra Proveedor</title>
</head>
<body>

<div class="container">
<h1>Registra Proveedor</h1>

	<c:if test="${sessionScope.MENSAJE != null}">
		<div class="alert alert-success fade in" id="success-alert">
		 <a href="#" class="close" data-dismiss="alert">&times;</a>
		 <strong>${sessionScope.MENSAJE}</strong>
		</div>
	</c:if>
	<c:remove var="MENSAJE" />

	<form action="registraProveedor" id="id_form" method="post"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_raz_social_proveedor">Razon social</label>
				<input class="form-control" type="text" id="id_raz_social_proveedor" name="raz_social_proveedor" placeholder="Ingrese la razon social">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_dir_proveedor">Direccion</label>
				<input class="form-control" id="id_dir_proveedor" name="dir_proveedor" placeholder="Ingrese la dirección" type="text" />
			</div>
			<div class="form-group">
				<label class="control-label" for="id_ruc_proveedor">Ruc</label>
				<input class="form-control" id="id_ruc_proveedor" name="ruc_proveedor" placeholder="Ingrese el ruc" type="text" />
			</div>
			<div class="form-group">
				<label class="control-label" for="id_fec_reg_proveedor">Fecha registro</label>
				<input class="form-control" id="id_fec_reg_proveedor" name="fec_reg_proveedor" placeholder="Ingrese la fecha de registro" type="text" />
			</div>
			
			
			
			
			<div class="form-group">
				<label class="control-label" for="id_categoria">Categoria</label>
				<select id="id_categoria" name="categoria.cod_categoria" class='form-control'>
					<option value=" ">[Seleccione]</option>    
				</select>
		    </div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Crea Proveedor</button>
			</div>
	</form>
</div>

<script type="text/javascript">
console.log("inicio");
$.getJSON("cargaCategoria", {}, function(data){
	console.log("inicio2");
	$.each(data, function(index,item){
		$("#id_categoria").append("<option value="+item.cod_categoria+">"+ item.nom_categoria +"</option>");
	});
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">

$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	raz_social_proveedor: {
    		selector : '#id_raz_social_proveedor',
            validators: {
                notEmpty: {
                    message: 'El nombre es un campo obligatorio'
                },
                stringLength :{
                	message:'El nombre es de 3 a 40 letras',
                	min : 3,
                	max : 40
                }
             
            }
        },
        ruc_proveedor: {
    		selector : '#id_ruc_proveedor',
            validators: {
                notEmpty: {
                    message: 'El número de ruc es un campo obligatorio'
                },

                digits: {
	                message: 'El ruc debe ser un digito'
	            },	
                
	            stringLength :{
                	message:'El ruc debe contener 11 digitos',
                	min : 11,
                	max : 11
                }
            }
        },
        dir_proveedor: {
    		selector : '#id_dir_proveedor',
            validators: {
            	notEmpty: {
                    message: 'La dirección es un campo obligatorio'
                },
                stringLength :{
                	message:'La dirección es de 3 a 40 letras',
                	min : 3,
                	max : 40
                }
                
            }
        },
       

        fec_reg_proveedor: {
    		selector:"#id_fec_reg_proveedor",
            validators: {

                date: {
                    format: 'YYYY-MM-DD',
                    	message: 'El formato es Año-mes-dia'    
                },
                
                notEmpty: {
                    message: 'La fecha es un campo obligatorio'
                    
                }

            }
        }
        
    	
    }   
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

</body>
</html>




