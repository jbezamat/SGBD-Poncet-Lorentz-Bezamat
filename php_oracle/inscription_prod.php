<?php 
	require_once 'ConsultOracle.php';
	$get = new ConsultOracle();
	
	
	if (! session_id())
		session_start();
	$_SESSION['client_type'] = "prod";

?>
	
		<h2>Formulaire d'ajout d'un producteur.</h2>
	<form method="post">
			<input type = "text" name = "nom_pers" required placeholder="Nom"> Nom de la personne à ajouter <br>
			<input type = "text" name = "prenom" required placeholder = "Prenom"> Prénom de la personne à ajouter <br>
			<input type = "text" name = "tel" placeholder = "E.g: 06 00 00 00 00" pattern = "[0-9]{2} [0-9]{2} [0-9]{2} [0-9]{2} [0-9]{2}"> Téléphone <br>
			<input type = "email" name = "mail" placeholder = "exemple@exemple.com"> Adresse mail <br>
			<input type = "text" name = "adresse" required placeholder= "Adresse"> Adresse du producteur <br>
			<input type = "text" name = "ordre" required placeholder = "Ordre des chèques"> Ordre des chèques <br>
			<input type = "submit" name = "val"> 
	</form>
