<?php

	
	$mysql_host = "localhost";
	$mysql_database = "ab95503_tracker";
	$mysql_user = "ab95503_juancho";
	$mysql_password = "Jpjpjuancho1995";
	$DB_Table = "markers";
	
	// latitud
	if (isset ($_GET["lat"]))
		$lat = $_GET["lat"];
	else
		$lat = "FAILLAT";
		
	//longitud
	if (isset ($_GET["lng"]))
		$lng = $_GET["lng"];
	else
		$lng = "FAILLNG";


		
	//infoUno
	if (isset ($_GET["address"]))
		$address = $_GET["address"];
	else
		$address = "FAILADDRESS";
	
	//infoDos
	
if (isset ($_GET["name"]))
		$name = $_GET["name"];
	else
		$name = "FAILNAME";

	
		
		
		
		
	// CONEXION MYSQL	
	$con = mysql_connect($mysql_host,$mysql_user,$mysql_password ) or die(mysql_error()); 
	mysql_select_db($mysql_database,$con) or die(mysql_error()); 

	$sql = "insert into $DB_Table (name,address,lat,lng,type) values('$name','$address','$lat','$lng', 'sanpedro');";
	$res = mysql_query($sql,$con) or die(mysql_error());
	
	mysql_close($con);
	if ($res) {
		echo "success";
	}else{
		echo "failed";
	}// end else
	
?>