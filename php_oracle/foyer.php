<?php require('ConsultOracle.php');  
$get = new ConsultOracle();
?>

<!DOCTYPE html>

<?php session_start(); 
?>

<html>

    <head>
		<link rel="stylesheet" href="style.css">
        <title>Page foyer des paniers</title>

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

	<?php if (!isset($_SESSION['num_foyer']) ) 
				echo "<p> Veuillez vous connecter.</p>";
			else { ?>
      <h1>Page gestionnaire pour le foyer connecté.</h1>



        <p>
				<h2>Liste des contrats souscrits par le foyer.</h2>
				<?php $req = new ConsultOracle();
				$rep = strval($_SESSION['num_foyer']);
				$req->printTable("SELECT vue_souscrire.numero_type_de_contrat, ordre, adresse, montant_cheques, nombre_cheques, nom_panier FROM vue_souscrire, producteurs, types_de_contrat, paniers WHERE types_de_contrat.numero_panier = paniers.numero_panier AND vue_souscrire.numero_type_de_contrat = types_de_contrat.numero_type_de_contrat AND types_de_contrat.numero_producteur = producteurs.numero_producteur AND numero_foyer = " . $rep );
			?>
				<h2>Liste des livraisons auxquelles participe le foyer:</h2> 
			
			<?php
				$req->printTable("SELECT DISTINCT types_de_contrat.numero_type_de_contrat, livraisons.date_livraison, livraisons.numero_livraison, producteurs.numero_producteur, adresse, ordre, nom, prenom FROM foyers, personnes, souscrire, producteurs, types_de_contrat, livraisons, participer_a WHERE foyers.numero_foyer = " . $rep . "AND types_de_contrat.numero_producteur = producteurs.numero_producteur AND producteurs.numero_personne = personnes.numero_personne AND foyers.numero_foyer = participer_a.numero_foyer AND participer_a.numero_livraison = livraisons.numero_livraison AND livraisons.numero_type_de_contrat = types_de_contrat.numero_type_de_contrat"); ?>

		<h2>Liste des livraisons auxquelles le foyer peut encore participer.</h2>
<?php	
			$req->printTable("SELECT * FROM livraisons WHERE numero_livraison NOT IN (SELECT numero_livraison FROM vue_calendrier_foyer WHERE numero_foyer = " . $rep . ") AND numero_type_de_contrat IN (SELECT numero_type_de_contrat FROM souscrire  WHERE numero_foyer = " . $rep . ") AND date_livraison > SYSDATE"); 
?>

		<h2>Liste des contrats auxquels le foyer peut souscrire.</h2>
		
			<?php 
				$req->printTable("SELECT numero_type_de_contrat, nombre_cheques, montant_cheques, nom_panier, numero_producteur FROM types_de_contrat, paniers WHERE types_de_contrat.numero_panier = paniers.numero_panier AND numero_type_de_contrat NOT IN (SELECT numero_type_de_contrat FROM souscrire  WHERE numero_foyer = " . $rep . " )");
?>
		<h2>Formulaire de souscription à un contrat</h2>
			<form method = "post">
				<input type="text" required name = "num_contrat" placeholder = "Numero de contrat"> 
				<input type = "submit" name="Valider">
			</form>

<?php
			if (isset($_POST['num_contrat']) && !empty($_POST['num_contrat']) ){
				$post = strval($_POST['num_contrat']);
				$req->execReq("INSERT INTO souscrire VALUES ( " . $post . ", " . $rep . ")");
				echo "Souscription enregistrée.";
				echo "Cliquez <a href=\"foyer.php\" >ici</a> pour afficher les données sur les tableaux.";
				unset($_POST['num_contrat']);

}?>
		<h2>Formulaire de participation à une livraison</h2>
			<form method = "post">
				<input type="text" required name = "num_liv" placeholder = "Numero de la livraison"> 
				<input type = "submit" name="Valider">
			</form>

<?php
			if (isset($_POST['num_liv']) && !empty($_POST['num_liv'])) {
				$post = strval($_POST['num_liv']);
				$req->execReq("INSERT INTO participer_a VALUES ( " . $post . ", " . $rep . ")");
				echo "Participation enregistrée.";
				echo "Cliquez <a href=\"foyer.php\" >ici</a> pour afficher les données sur les tableaux.";
				unset($_POST['num_liv']);
}


}


    




/* TODO:

Souscription de contrats: pour le moment liste des contrats

liste des contrats auxquels il a déjà souscrit et champ permettant de choisir de participer à une livraison

*/


?>
