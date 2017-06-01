<?php
session_start();


require "vue/template.tpl"; 

//Titre onglet
$titretab = "Komidi Connexion administrateur";

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



// connexion à la base de données

$bdd = new PDO('mysql:host=127.0.0.1;dbname=db_komidi', 'root', 'btssio');

//action si le formulaire de connexion est valider

if(isset($_POST['formconnexion'])) {
   $mailconnect = htmlspecialchars($_POST['mailconnect']);
   $mdpconnect = sha1($_POST['mdpconnect']);
   
   //action si le mail de connexion et le mot de passe ne sont pas vides

   if(!empty($mailconnect) AND !empty($mdpconnect)) {
      $requser = $bdd->prepare("SELECT * FROM administrateur WHERE mail = ? AND motdepasse = ?");
      $requser->execute(array($mailconnect, $mdpconnect));
      $userexist = $requser->rowCount();
      if($userexist == 1) {
         $userinfo = $requser->fetch();
         $_SESSION['id'] = $userinfo['id'];
         $_SESSION['pseudo'] = $userinfo['pseudo'];
         $_SESSION['mail'] = $userinfo['mail'];
         header("Location: administration.php?id=".$_SESSION['id']);
      } else { // action si erreur lors de la saisie du mot de passe
         $erreur = "Mauvais mail ou mot de passe !";
      }
   } else {// action si un des champs ou les deux ne sont pas remplis
      $erreur = "Tous les champs doivent être complétés !";
   }
}
?>
<html>
   <head>

      <meta charset="utf-8">
   </head>
   <body>
      <div align="center">
         <h2>Connexion Administrateur</h2>
         <br /><br />


         <form method="POST" action=""> 
            <input type="email" name="mailconnect" placeholder="Mail" />
            <input type="password" name="mdpconnect" placeholder="Mot de passe" />
            <br /><br />
            <input type="submit" name="formconnexion" value="Se connecter !" />
         </form>
         <?php
         if(isset($erreur)) { // affichage de l'erreur
            echo '<font color="red">'.$erreur."</font>";
         }
         ?>
      </div>
      
   </body>
</html>