<?php
	require_once('./config.php');

	if (!isset($_GET['type']) || empty($_GET['type'])) {
		echo 'you should send a type';
		exit();
	}
	
	$mysqli = new mysqli( HOST, USER, PASS, DB);

	$type = $mysqli->real_escape_string($_GET['type']);

	if ($type == 'all') {
		$query = "SELECT l.id, l.name, l.description, w.words, w.id_lang FROM `Lesson` l LEFT JOIN `WordList` w ON w.id_lesson = l.id";
	} else if ($type == 'short') {
		$query = "SELECT id, name, description FROM `Lesson`";
	} else if ($type == 'detail') {
		if (!isset($_GET['id']) || empty($_GET['id'])) {
			echo 'you should send an lesson id';
			exit();
		}
		$id = $mysqli->real_escape_string($_GET['id']);
		$query = "SELECT words, id_lang FROM `WordList` WHERE id_lesson = $id";
	} else {
		echo 'type invalid';
		exit();
	}

	$result = $mysqli->query($query);
	$rows = array();
	while($row = $result->fetch_assoc()) {
		$rows[] = $row;
	}
	print json_encode($rows);
?>
