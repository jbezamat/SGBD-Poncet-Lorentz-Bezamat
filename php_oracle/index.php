<?php require('ConsultOracle.php'); ?>

<!DOCTYPE html>

<?php session_start(); ?>

<html>

    <head>

        <title>Les Petits Paniers Campus</title>
		
		<link rel="stylesheet" href="style.css">
		
        <meta charset="utf-8" />

    </head>

    <body>

        <h1>Partage de paniers</h1>

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

	<h2> <a href = "inscription.php"> Page d'inscription </a> </h2>
	
	Formulaires d'inscription pour les différents types de clients, les producteurs et les foyers. 
	
	<h2> <a href = "producteur.php"> Page de producteur </a> </h2>
	Page affichant les différents types de contrats associés au producteur conecté ainsi que les formulaires decréation d'un panier et d'un contrat avec un maximum de 30 livraisons.
	
	<h2> <a href = "foyer.php"> Page de foyer </a> </h2>
	Liste des différents contrats auxquels le foyer connecté a souscrit, ainsi que le programme de livraison pour le foyer. <br>
	Il y a ensuite la liste des livraisons auxquelles le foyer ne prend pas part mais reliées aux contrats auxquels le foyer a souscrit. Puis, le tableau des contrats non souscrits par le foyer s'affiche. <br>
	Il y a finalement les formulaires de participation à une livraison et de souscription à un contrat.

	<h2> <a href = "admin.php"> Page admin </a> </h2>
	Sur cette page se trouvent les différentes vues demandées par le sujet. 
    </body>

</html>
