<?php

	function checkVars($array,$type){
		foreach ($array as $value) {
			if(!isset($type[$value]) or empty($type[$value])){
				error('Some informations are missing: '.$value);
			}
		}
	}

	function error($msg){
		$xml = new SimpleXMLElement('<xml/>');
		$xml->addAttribute('encoding', 'UTF-8');
		$error = $xml->addChild('error', $msg);
		Header('Content-type: text/xml');
		print($xml->asXML());
		exit();
	}

	function connect(){
		$mysqli = new mysqli( HOST, USER, PASS, DB);
		if ($mysqli->connect_errno) {
			printf("Echec de la connexion: %s\n", $mysqli->connect_error);
			exit();
		}
		return $mysqli;
	}

?>