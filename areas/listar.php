<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="author" content="SAAB y RRP">
	<meta name="description" content="Formulario de Alta de Impresoras">
	<meta name="keywords" content="impresoras, accesible, formulario">
		<link href="../css/bootstrap.min.css" rel="stylesheet">
	<title>AREAS</title>

</head>


<body> 

<!--NAV/!-->
<?php include('../navbar.php'); ?>
<!--NAV/!-->


<div class="page-header">
  <h1> <small></small></h1>
</div>
<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - /!-->
<!--TABLA Modelos de Estado/!-->
<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - /!-->
	
	<table class="table table-striped table-hover ">

		<!--Cabecera Tabla/!-->

		<thead> 

			<title>
				AREAS
			</title>

			<tr> 
				<th>Id</th> 
				<th>area</th>

			</tr> 
		</thead>

		<!--Cuerpo de tabla/!-->
		<tbody>
		<!--Consulta a dispositivo y generacion de tabla con php/!-->		
		<?php 

			require('../Conexion/conexion.php'); //Archivo que configura la conexion
		
			$cadenaQuery = "SELECT * from area ";  

			$consulta = mysql_query($cadenaQuery);  
		
			while($row = mysql_fetch_array($consulta))
			{
				echo "<tr>";

				echo "<td> "  .$row["idarea"]. 				"</td>";			
				echo "<td> "  .$row["area"]. 				"</td>";
			
			
				echo "<td>  
				<a class='btn btn-s btn-warning' 
				href='modificar.php?id=".$row["idarea"]."'>
				<span class='glyphicon glyphicon-pencil'></span>
				</a>

				<a class='btn btn-s btn-danger' 
				href='funcionBorrar.php?id=".$row["idarea"]."'>
				<span class='glyphicon glyphicon-remove'></span>
				</a> 
				</td>";
	

			}

		?>

		</tbody>
	</table> 

<!--FIN  TABLA AREAS/!-->
<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - /!-->



<a class="btn btn-s btn-success" href="alta.php"> 
Agregar Area
</a>



    
    







</html> 

