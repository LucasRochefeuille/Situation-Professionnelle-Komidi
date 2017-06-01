<?php
session_start();
$_SESSION = array();
session_destroy();
echo " Déconnexion réussite";
header("Location:index.php");
?>