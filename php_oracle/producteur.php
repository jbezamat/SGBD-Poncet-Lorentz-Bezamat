

<?php require('ConsultOracle.php');  
$get = new ConsultOracle();
	
?>

<!DOCTYPE html>

<?php session_start(); ?>

<html>

    <head>
		<link rel="stylesheet" href="style.css">
        <title>Page producteur des paniers</title>

        <meta charset="utf-8" />

    </head>

    <body>
		
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

	<?php if (!isset($_SESSION['num_prod']) ) 
				echo "<p> Veuillez vous connecter <a href=\"identification.php\">ici</a> .</p>";
			else { ?>
    
    
        <h1>Page gestionnaire pour le producteur connecté.</h1>



        <p>

			
			
				<h3>Liste des contrats pour ce producteur:</h3> 
			
				<?php $req = new ConsultOracle();
				$rep = strval($_SESSION['num_prod']);
				$req->printTable("select nombre_foyers_max, nombre_cheques, montant_cheques, numero_panier from vue_type_de_contrat where numero_producteur = ".$rep); ?>

		<h2>Formulaire de création de paniers.</h2>

		<form method="post">
			<input type = "text" name = "nom_panier" required placeholder="Nom du panier">  
			<input type = "submit" name = "val" required value = "Valider">  
		</form>

<?php if (isset($_POST['nom_panier']) && ! empty($_POST['nom_panier']) ){
	$req = "INSERT INTO paniers VALUES (numero_panier_seq.nextval, '" . $_POST['nom_panier'] . "')" ;
	$get->execReq($req);	
	

	$req = "SELECT numero_panier FROM paniers WHERE nom_panier = '". $_POST['nom_panier'] ."'";
	$name = "NUMERO_PANIER";
	echo "Création du panier réussie. Numéro associé: " . $get->getNumber($req,$name);; 
 
	unset($_POST['nom_panier']);
	unset($_POST['nom_panier']);
}
?>

		<h2>Formulaire de création de contrat.</h2>
		
		<p>
			Avant de créer un contrat, il est nécessaire d'avoir un panier. <br>
			Afin de le faire, merci de remplir le formulaire ci-dessus et de noter le numéro de panier afin de l'affecter à un contrat; ou bien de lui affecter un panier existant.
		</p>
		
		<form method = "post">
			<input type="text" name="nb_foyers_max" required placeholder="Entier"> Nombre de foyers maximum pour ce contrat <br> 
			<input type="text" name="nb_cheques" required placeholder="Entier"> Nombre de chèques demandés pour ce contrat <br> 
			<input type="text" name="montant_cheque" required placeholder="Montant en euros"> Montant de chaque chèque pour ce contrat <br> 
			<input type="text" name="num_panier" required placeholder="Numéro de panier"> Numéro du panier associé à ce contrat <br> 
			<input type="date" name="date_liv1" required pattern="[0-9]{2}/[0-9]{2}/[0-9]{4} [0-9]{2}:[0-9]{2}" placeholder="Form: DD/MM/YYYY HH24:MI"> Date et heure de la livraison 1 <br>
			<?php 
				for ($i = 2; $i <= 30; $i++)
					echo "<input type=\"date\" name=\"date_liv". $i ." value=\"date_" . $i ." pattern=\"[0-9]{2}/[0-9]{2}/[0-9]{4} [0-9]{2}:[0-9]{2}\" placeholder=\"Form: DD/MM/YYYY HH24:MI\"> Date et heure de la livraison ".$i." <br>"; 
			
			
			?>
			<input type="submit" name="submit" value="Valider">
		</form>
<?php
	if (isset($_POST['nb_foyers_max']) && isset($_POST['nb_cheques']) && isset($_POST['montant_cheque']) && isset($_POST['num_panier']) && isset($_SESSION['num_prod'])){

	$get = new ConsultOracle();


	$req = "INSERT INTO types_de_contrat VALUES ( numero_type_de_contrat_seq.nextval, " . $_POST['nb_foyers_max'] . "," . $_POST['nb_cheques'] . "," . $_POST['montant_cheque'] . "," . $_POST['num_panier'] . "," . $_SESSION['num_prod'] .")";
	$get->execReq($req);


		
	 $req = "SELECT numero_type_de_contrat FROM types_de_contrat ORDER BY numero_type_de_contrat DESC";
	 $name = "NUMERO_TYPE_DE_CONTRAT";
	 $num = $get->getNumber($req,$name);
	 
	 $req = "INSERT INTO livraisons VALUES (numero_livraison_seq.nextval, to_date('" .  $_POST['date_liv1'] . "','DD-MM-YYYY HH24:MI'), " . $num .")";
	 $get->execReq($req);
	 $i = strval(2);
	 
	 while ( (isset($_POST['date_liv'.$i])) && (!empty($_POST['date_liv'.$i]) ) ) {
		$req = "INSERT INTO livraisons VALUES (numero_livraison_seq.nextval, to_date('" .  $_POST['date_liv'.$i] . "','DD-MM-YYYY HH24:MI'), " . $num .")";
		$get->execReq($req);
		$i = intval($i);
		$i = $i + 1;
		$i = strval($i);
	 }
	

	echo "Votre contrat a bien été créé";
	echo "Cliquez <a href=\"producteur.php\" >ici</a> pour afficher les données sur les tableaux.";
	
	unset($_POST['nom_panier']);
	unset($_POST['nb_foyers_max']);
	unset($_POST['nb_cheques']);
	unset($_POST['montant_cheques']);
	unset($_POST['num_panier']);
	unset($_POST['date_liv1']);
	for ($i = 2; $i < 30; $i++)
		unset($_POST['date_liv' . $i]); 
	}

        

} ?>
		</p>
    </body>

</html>
