<?php
require 'include/config.php'; 
$titretab = "Komidi Admin";

ob_start(); 
foreach($menupage as $page_name => $page_url) 
{
  $class = '';
  if ($current_page == $page_url) {
    $class = 'active';
  }
  echo "<li class='$class'>
    <a href='$page_url'>".$page_name ."</a>".
   "</li>";
}
$menupage = ob_get_clean();

ob_start(); 

echo '<html>
<head>

<style type="text/css">
<!--
.Style4 {font-size: 12px}
-->
</style>
</head>

<body>
<form id="form1" name="form1" method="post" >
  <table width="420" border="0">
    <tr>
      <td width="169" bgcolor="#CCFF00"><label>
        <input name="rechercher" type="submit" id="rechercher" value="Rechercher" />
      </label></td>
      <td width="369" bgcolor="#CCFF00"><label>
        <input name="t_rechercher" type="text" id="t_rechercher" />
        <span class="Style4">      Recherche par nom</span> </label></td>
    </tr>
    <tr>
      <td>Pseudo</td>
      <td><label>
        <input name="pseudo" type="text" id="pseudo" />
      </label></td>
    </tr>
    <tr>
      <td>Email</td>
      <td><label>
        <input name="mail" type="email" id="mail" />
      </label></td>
    </tr>
    <tr>
      <td>Mot de passe</td>
      <td><input name="mdp" type="text" id="mdp" /></td>
    </tr>
    <tr>
      <td colspan="2"><label>
        <input name="nouveau" type="reset" id="nouveau" value="Nouveau" />
        <input name="ajouter" type="submit" id="ajouter" value="Ajouter" />
        <input name="modidier" type="submit" id="modidier" value="Modifier" />
        <input name="supprimer" type="submit" id="supprimer" value="Supprimer" />
      </label></td>
    </tr>
  </table>
  <p> </p>
</form>'.

    $PARAM_sgbd         = "mysql";      // SGBDR
    $PARAM_hote         = "localhost";  // le chemin vers le serveur
    $PARAM_port         = "3306";       // Port de connexion
    $PARAM_nom_bd       = "db_komidi";  // le nom de votre base de données
    $PARAM_utilisateur  = "root";       // nom utilisateur
    $PARAM_mot_passe    = "btssio";     // mot de passe utilisateur
    // Nom de la source de données
    $PARAM_dsn          = $PARAM_sgbd.":host=".$PARAM_hote.";dbname=".$PARAM_nom_bd;
$dbh = new PDO($PARAM_dsn, $PARAM_utilisateur, $PARAM_mot_passe, $dboptions);
$stmt = $dbh->prepare("SELECT *FROM  membres");
$stmt->execute();

if(isset($_POST['ajouter'])){
    $strSQL  = "INSERT INTO membres (NULL, pseudo, mail , motdepasse) 
                VALUES (:pseudo,:mail,:motdepasse,:Spe_mes);";
    $requete=$cnx->prepare($strSQL);
    $requete->execute(array(
                        'pseudo'=>$_POST['pseudo'],
                        'mail'=>$_POST['mail'],
                        'motdepasse'=>$_POST['mdp']));
}


$contenupage = ob_get_clean();

require 'vue/vueSidebar.php';
require 'vue/template.tpl';
?>