

<?php
	require_once('ConsultOracle.php');
	$get = new ConsultOracle();
	
	echo "<h3>Formulaire d'inscription personne</h3>";

?>

<p>Veuillez indiquer si vous souhaitez créer un Foyer ou rejoindre un Foyer existant.
<?php
	if (!session_id())
		session_start();
	$_SESSION['client_type'] = "pers";
?>

<form method="post">
	<input type="checkbox" name="pers_type" value="new"> Nouveau Foyer 
	<input type="checkbox" name="pers_type" value="add"> Foyer Existant
	<input type="submit" name="submit" value="Valider">
</form>

<?php if (isset($_POST['pers_type']) && ($_POST['pers_type'] == "new") ){ ?>
	
	<h2>Formulaire de création de foyer.</h2>

		<form method="post">
			<input type = "text" name = "nom_foyer" required placeholder="Nom"> Nom du nouveau foyer <br>
			<input type = "submit" name = "val"> 
		</form>

<?php 
}
else if (isset($_POST['pers_type']) && ($_POST['pers_type'] == "add") ) { ?>
	
	<h2>Formulaire d'ajout d'une personne à un foyer existant.</h2>
	<form method="post">
			<input type = "text" name = "nom_pers" required placeholder="Nom"> Nom de la personne à ajouter <br>
			<input type = "text" name = "prenom" required placeholder = "Prenom"> Prénom de la personne à ajouter <br>
			<input type = "text" name ="num_foyer" required placeholder = "Numéro du foyer"> Numéro du foyer auquel se rajouter <br>
			<input type = "text" name = "tel" placeholder = "E.g: 06 00 00 00 00" pattern = "[0-9]{2} [0-9]{2} [0-9]{2} [0-9]{2} [0-9]{2}"> Téléphone <br>
			<input type = "email" name = "mail" placeholder = "exemple@exemple.com"> Adresse mail <br>
			<input type = "submit" name = "val"> 
	</form>
	
	
	
	
<?php 
}
?>
</p>
