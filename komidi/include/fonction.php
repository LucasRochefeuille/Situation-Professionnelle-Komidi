<?php
include_once 'config.php';



function debug($tableau) {
	echo '<pre>'.print_r($tableau, true).'</pre>';
}

function getCover($spec_id = 0) {
	$picture = 'image/'.$spec_id;
	if (file_exists($picture)) {
		return $picture;
	}
	return 'image/defaut.png';
}

function redirectJS($url, $delay = 1) {
	echo '<script>
		  setTimeout(function() {
		  		location.href = "'.$url.'"; }
		  , '.($delay * 1000).');
		  </script>';
}

function Accueil() {
  require './vue/vueAccueil.php';
}

function Noter() {
  require './vue/vueNoter.php';
}

function Admin() {
  require './vue/vueAMD.php';
}
function Connexion() {
  require './vue/vueConnexion.php';
}
function Inscription() {
	require './vue/vueInscription.php';
}
function Administration() {
	require './vue/administration.php';
}
/*
function displayList($title, $items, $class = 'default') {

	$html = '<div class="panel panel-'.$class.'">
		<div class="panel-heading">'.$title.'</div>
		<div class="list-group">';

		foreach($items as $key => $item) {
				$title = $item['title'];
			$html .= '<a href="movie.php?id='.$item['id'].'" class="list-group-item">'.$title.'</a>';
		}

	$html .= '</div>
	</div>';

	return $html;
}
*/

function displayList($title, $items, $class = 'default', $url = 'movie.php') {

	static $allowed_classes = array('default', 'info', 'primary', 'warning', 'danger', 'success');
	if (!in_array($class, $allowed_classes)) {
		$class = 'default';
	}

	include 'partials/list-panel.php';
}