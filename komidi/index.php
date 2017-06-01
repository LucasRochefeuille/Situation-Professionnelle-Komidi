<?php 	
	//require 'include/config.php';  

	require('./include/fonction.php');

  if (isset($_GET['action']))
  {
      if ($_GET['action'] == 'Accueil') {
        Accueil() ; // Acceuil du site
        exit;
      }
       if ($_GET['action'] == 'Rechercher') {
        Rechercher() ; // Page rechercher du site
        exit;
      }
      if ($_GET['action'] == 'Noter') {
        Noter(); // page de notations de spectacle
        exit;
      }
      if ($_GET['action'] == 'Connexion') {
        Connexion(); // page de connexion
        exit;
      }
      if ($_GET['action'] == 'Inscription') {
        Inscription();  //page d'inscription au site
        exit;
      }
       if ($_GET['action'] == 'Administration') {
        Administration();  //page d'administration du site
        exit;
      }

   }
   else{
   	 Accueil() ; //par défaut on affiche l'accueil du site
   }

?>
