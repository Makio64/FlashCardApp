<?php
	require_once('./config.php');
	
	$mysqli = new mysqli( HOST, USER, PASS, DB);
	$result = $mysqli->query("SELECT * FROM `Lang`");
	$rows = array();
	while($row = $result->fetch_assoc()) {
		$rows[] = $row;
	}
	print json_encode($rows);
?>