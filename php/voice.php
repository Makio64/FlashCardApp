<?php
$url = 'http://translate.google.com/translate_tts?tl='.$_GET['tl'].'&ie=UTF-8&q='.$_GET['q'];
$voice = file_get_contents($url); 
echo $voice;
?>