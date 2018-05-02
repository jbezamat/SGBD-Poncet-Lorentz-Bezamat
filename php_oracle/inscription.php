<head>

        <title>Les Petits Paniers Campus</title>
		<link rel="stylesheet" href="style.css">
        <meta charset="utf-8" />

    </head>

	<div id="ret_accueil">
			<a href = "index.php">
				<img src="paniers.jpg">
			</a>
		</div>

		        <div id="identif">
			<?php  
				include 'identification.php';
              ?>      

        </div>

<h1> Formulaire d'inscription au système de Paniers AMAP.</h1>

Veuillez indiquer si vous êtes un producteur ou une personne, possédant déjà ou non un foyer. <br>


<form method="post">
	<input type="checkbox" name="client_type" value="prod"> Producteur
	<input type="checkbox" name="client_type" value="pers"> Personne 
	<input type="submit" name="submit" value="Valider">
</form>

<?php 
	if (!session_id())
		session_start();

	$res = 0;

	if ( (isset($_POST['client_type']) && ($_POST['client_type'] == "pers")) || (isset($_SESSION['client_type']) && ($_SESSION['client_type'] == "pers")) ) {
		include  'inscription_pers.php';
		 
		if ( (isset($_POST['nom_foyer'])) && (! empty($_POST['nom_foyer'])) ){   
			$req = "INSERT INTO foyers VALUES (numero_foyer_seq.nextval, '" . $_POST['nom_foyer'] . "')" ;
			$get->execReq($req);	
	
			$req = "SELECT numero_foyer FROM foyers WHERE nom_foyer = '". $_POST['nom_foyer'] ."'";
			$name = "NUMERO_FOYER";
			echo "Création du foyer réussie. Numéro associé: " ; 
			$res = $get->getNumber($req,$name);
			echo $res;
			
		}

		else if ( (isset($_POST['nom_pers']) && ! empty($_POST['nom_pers'])) && (isset($_POST['prenom']) && ! empty($_POST['prenom']))){
			if ( (!isset($_POST['tel']) && !isset($_POST['mail'])) || (empty($_POST['tel']) && empty($_POST['mail'])) )
				echo "Veuillez rentrer au moins une adresse mail ou un numéro de téléphone. <br>";
			else{
				$req = "INSERT INTO personnes VALUES (numero_personne_seq.nextval, '" . $_POST['nom_pers'] . "', '" . $_POST['prenom'] . "', '" . $_POST['tel'] . "', '" . $_POST['mail']. "')";
				$get->execReq($req);
				
				$req = "SELECT numero_personne FROM personnes WHERE nom = '" . $_POST['nom_pers'] . "' AND prenom = '" . $_POST['prenom'] . "'";
				$name = "NUMERO_PERSONNE";
				$res = $get->getNumber($req,$name);
				
				
				
				
				$req = "INSERT INTO appartenir_a VALUES (" . $_POST['num_foyer'] . ", " . $res. ")";
				$get->execReq($req);
				
				echo "Votre compte a bien été créé. ";
				echo "Vous avez le  numéro de personne " . $res . ". Merci de le garder de côté si vous vous rajoutez à un nouveau foyer.<br>";
				echo "Afin de vous connecter, merci de mettre de côté votre numéro de foyer, qui est ". $_POST['num_foyer'] . ".";
				
				$_SESSION['num_foyer'] = $_POST['num_foyer'];
				
				
			} 
			
			
		}
}


else if ( (isset($_POST['client_type']) && ($_POST['client_type'] == "prod")) || (isset($_SESSION['client_type']) && ($_SESSION['client_type'] == "prod")) ) {
	include 'inscription_prod.php';
	
	if ( (!isset($_POST['tel']) && !isset($_POST['mail'])) || (empty($_POST['tel']) && empty($_POST['mail'])) )
				echo "Veuillez rentrer au moins une adresse mail ou un numéro de téléphone. <br>";
	else{
			$req = "INSERT INTO personnes VALUES (numero_personne_seq.nextval, '" . $_POST['nom_pers'] . "', '" . $_POST['prenom'] . "', '" . $_POST['tel'] . "', '" . $_POST['mail']. "')";
			$get->execReq($req);
			
				
			$req = "SELECT numero_personne FROM personnes WHERE nom = '" . $_POST['nom_pers'] . "'";
			$name = "NUMERO_PERSONNE";
			$res = $get->getNumber($req,$name);

				
				
			$req = "INSERT INTO producteurs VALUES (numero_producteur_seq.nextval, '" . $_POST['adresse'] . "', '" . $_POST['ordre'] . "', " . $res . ")";
			$get->execReq($req);
				
			$req = "SELECT numero_producteur FROM producteurs WHERE numero_personne = " . $res;
			$name = "NUMERO_PRODUCTEUR";
			$res2 = $get->getNumber($req,$name);
				 
				
			echo "Votre compte a bien été créé. Il a le numéro : " . $res2 . "<br>";
				
			$_SESSION['num_prod'] = $res2;
			}
	
}
			?>


<?php 
/* TODO:
  - Partie peronne

  Nom / Prenom / Adresse mail / N° telephone + BOUTON? Se rajouter à foyer existant + Nom Foyer (à checker sur la base si création).

   - Partie Producteurs
   Adresse / ordre / Nom / Prenom / Mail / N° Tel

Menu déroulant qui permet d'accéder aux saisies non personnelles
*/



// echo $_POST['nom_foyer'];

?>
