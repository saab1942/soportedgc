<?php
require('../Conexion/conexion.php');

$id = $_REQUEST['id'];
echo $id;


$cadena2= "DELETE FROM Estado WHERE idEstado ='$id'" ;
echo $cadena2;

$consulta=mysql_query($cadena2);

if (!$consulta)
{
	echo "<p>Ha habido un error al insertar los valores.</p>";
	echo mysql_errno($conexion) . ": " . mysql_error($conexion) . "\n";
} else {
	echo "<h1>Los datos han sido introducidos satisfactoriamente</h1>";
	header('Location: listar.php');
}


?>

