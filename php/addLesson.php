<?php

	require_once('./config.php');
	require_once('./utils.php');

	// Basic check
	checkVars(array('name','description','difficulty'),$_GET);

	// Assignement
	$name = $_GET['name'];
	$description = $_GET['description'];
	$difficulty = $_GET['difficulty'];

	// Extra checks
	$size = strlen($name);
	if ($size<3) error('The name should be at least 3 characters');
	else if ($size>32) error('The name should be 32 characters maximum');

	$size = strlen($description);
	if ($size<3) error('The description should be at least 3 characters');
	else if ($size>32) error('The description should be 255 characters maximum');

	if (!is_numeric($difficulty)) error('The difficulty should be an integer');
	else if ($difficulty<1 || $difficulty>3) error('The difficulty should be between 1 and 3');

	// Connect
	$mysqli = connect();

	// Escape string
	$name = $mysqli->real_escape_string($name);
	$description = $mysqli->real_escape_string($description);

	// Query
	$query = "INSERT INTO `Lesson` (`id`, `name`, `description`, `difficulty`) VALUES (NULL, '$name', '$description', $difficulty);";
	$result = $mysqli->query($query);
	if (!$result) error($mysqli->error);
	
	$rows = array();
	while($row = $result->fetch_assoc()) {
		$rows[] = $row;
	}
	
	print json_encode($rows);

?>