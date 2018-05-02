<?php require('ConsultOracle.php');
$get = new ConsultOracle();
?>
<head>

        <title>Les Petits Paniers Campus - Admin</title>
		<link rel="stylesheet" href="style.css">
        <meta charset="utf-8" />

    </head>
<?php

echo "<h1> Vues consultation.</h1>";

echo "<h2>Liste des adhérents ayant souscrit à un contrat.</h2>";

$get->printTable("SELECT * FROM vue_adherent_contrat");

echo "<h2>Liste des livraisons prévues au mois de décembre (tous contrats confondus). </h2>";

$get->printTable("SELECT * FROM vue_livraisons_decembre");

echo "<h2>Liste des livraisons pour lesquelles personne ne s'est inscrit.</h2>";

$get->printTable("SELECT * FROM vue_livraisons_vides");

echo "<h2>Calendrier des livraisons pour tous les foyers.</h2>";

$get->printTable("SELECT * FROM vue_calendrier_foyer");


echo "<h1> Vues statistiques.</h1>";


echo "<h2>Nombre de participations à des distributions au cours de l'année écoulée pour tous les adhérents.</h2>";

$get->printTable("SELECT * FROM vue_adherent_distributions");

echo "<h2>Somme des montants de tous les contrats souscrits par foyer.</h2>";

$get->printTable("SELECT * FROM vue_total_souscrits");

echo "<h2>Prix moyen d'un panier par contrat.</h2>";

$get->printTable("SELECT * FROM vue_prix_moyen_p");


echo "<h2>Somme moyenne versée chaque mois à chaque producteur sur une année.</h2>";

$get->printTable("SELECT * FROM table(revenu_moy_mois_all(" . date("Y") . "))");

