<?php

require_once 'include/fonction.php'; 

// Paramètres de connexion
    $PARAM_sgbd         = "mysql";      // SGBDR
    $PARAM_hote         = "localhost";  // le chemin vers le serveur
    $PARAM_port         = "3306";       // Port de connexion
    $PARAM_nom_bd       = "db_komidi";	// le nom de votre base de données
    $PARAM_utilisateur  = "root";       // nom utilisateur
    $PARAM_mot_passe    = "btssio";     // mot de passe utilisateur
    // Nom de la source de données
    $PARAM_dsn          = $PARAM_sgbd.":host=".$PARAM_hote.";dbname=".$PARAM_nom_bd; 

    $dboptions = array(
        PDO::ATTR_PERSISTENT => FALSE,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING,
        PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8",);

    try{
        $DB_cnx = new PDO($PARAM_dsn, $PARAM_utilisateur, $PARAM_mot_passe, $dboptions);
    }
    catch(PDOException $e){
        echo $e->getMessage();
    }
    
    require_once('modele/modele.class.php');

    $spectacles = new Spectacle($DB_cnx);

// Page courante
    $current_page = basename($_SERVER['PHP_SELF']); // Ex: index.php

// Paramètrage de la page
;
    $titretab = "Komidi";
    $menupage = array(
        'Accueil' => 'index.php?action=Accueil',
        'Rechercher' => '#Rechercher',
        'Noter' => 'index.php?action=Noter',
        'Connexion' => 'index.php?action=Connexion',
        'Inscription' => 'index.php?action=Inscription',
        'Administration' => 'index.php?action=Administration',

    );

    $titrepage = "Bienvenue sur KomidiScope !";
    $logopage  = "image/logoscope.png";

    $msgaccueilpage = "Découvrez notre <a href='search.php'>
                recherche</a> de spéctacle et les 
                <a href='news.php'>actualités</a> du festival.";
                
    $msgaccueilpage = "";

    $tailleresume = 255;
?>
