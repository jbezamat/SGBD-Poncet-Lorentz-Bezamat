<head>

        <title>Les Petits Paniers Campus</title>
		<link rel="stylesheet" href="style.css">
        <meta charset="utf-8" />
</head>

    <?php require_once('ConsultOracle.php'); 




$get = new ConsultOracle();

if ( ((empty($_POST['numero_foyer'])) && (empty($_POST['numero_prod']))) && !isset($_SESSION['num_prod']) && !isset($_SESSION['num_foyer']) ) {
	if (isset($_POST['numero_foyer']) || isset($_POST['numero_prod']) )
		echo "Erreur d'identification, veuillez réessayer. ";
	?>
		
			Si vous êtes un foyer, veuillez entrer votre numéro de foyer: 
              <form  method="post">
                <p>
                  <input type="text" name="numero_foyer" />
                  <input type="submit" value="Valider" />
                </p>
              </form>
              
              </br>
				Si vous êtes un producteur, veuillez entrer votre numéro de producteur:
              <form   method="post">
                <p>
                  <input type="text" name="numero_prod" />
                  <input type="submit" value="Valider" />
                </p>
              </form>		
              
Pas encore inscrit? Vous pouvez vous inscrire <a href = inscription.php>ici</a>.
<?php
}

else {
	if ( ((!empty($_POST['numero_foyer'])) && (empty($_POST['numero_prod']))) || (isset($_SESSION['num_foyer'])) ){
		if (isset($_SESSION['num_foyer']) ){
			echo "Vous êtes connecté en tant que Foyer numéro ".$_SESSION['num_foyer'] . "<br>";
			echo "Lien vers la page de <a href=\"foyer.php\"> foyer</a>.";
	?>			
			<form method="post">
				<input type = "submit" name = "dec" value = "Se déconnecter">
			</form>
		
<?php		}
		else if (isset($_POST['numero_foyer']) && $get->estFoyer(intval($_POST['numero_foyer']))){
			if (! session_id())
				session_start();
			if (!isset($_SESSION['num_foyer']))
				$_SESSION['num_foyer'] = $_POST['numero_foyer'];
			echo "Vous êtes connecté en tant que Foyer numéro ".$_POST['numero_foyer'] . "<br>";
			echo "Lien vers la page de <a href=\"foyer.php\"> foyer</a>.";  ?>
				
			<form method="post">
				<input type = "submit" name = "dec" value = "Se déconnecter">
			</form>
<?php
		} 
		else 
			echo "Ce numéro de Foyer n'est pas valide . Voulez-vous vous inscrire <a href = inscription.php> ici? </a>";
	}

	if ( ((empty($_POST['numero_foyer'])) && (!empty($_POST['numero_prod']))) || (isset($_SESSION['num_prod'])) ){
		if (isset($_SESSION['num_prod'])){
			echo "Vous êtes connecté en tant que Producteur numéro ".$_SESSION['num_prod'] . "<br>";
			echo "Lien vers la page de <a href=\"producteur.php\"> producteur</a>.";
			?>
			<form method="post">
				<input type = "submit" name = "dec" value = "Se déconnecter">
			</form>
			
		<?php }
		else if	($get->estProd($_POST['numero_prod'])){
			if (! session_id())
				session_start();
			if (!isset($_SESSION['num_prod']))
				$_SESSION['num_prod'] = $_POST['numero_prod'];
			echo "Vous êtes connecté en tant que Producteur numéro ".$_SESSION['num_prod'] . "<br>";
			echo "Lien vers la page de <a href=\"producteur.php\"> producteur</a>.";
			?>
			<form method="post">
				<input type = "submit" name = "dec" value = "Se déconnecter">
			</form>

<?php
		}	
		else 
			echo "Ce numéro de Producteur n'est pas valable. Voulez vous vous inscrire <a href = inscription.php> ici? </a>";
	}

}
	if ( isset($_POST['dec']))
		session_destroy();

?>


