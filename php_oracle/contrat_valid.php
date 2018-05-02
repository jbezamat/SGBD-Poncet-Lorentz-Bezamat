<?php

if (! session_id() )
	session_start();

require_once('ConsultOracle.php');

echo "hihi";

if (isset($_POST['nb_foyers_max']) && isset($_POST['nb_cheques']) && isset($_POST['montant_cheque']) && isset($_POST['num_panier']) && isset($_SESSION['num_prod'])){

	$get = new ConsultOracle();


	$req = "INSERT INTO types_de_contrat VALUES ( numero_type_de_contrat_seq.nextval, " . $_POST['nb_foyers_max'] . "," . $_POST['nb_cheques'] . "," . $_POST['montant_cheque'] . "," . $_POST['num_panier'] . "," . $_SESSION['num_prod'] .")";
	$get->execReq($req);


		
	 $req = "SELECT numero_type_de_contrat FROM types_de_contrat ORDER BY numero_type_de_contrat DESC";
	 $name = "NUMERO_TYPE_DE_CONTRAT";
	 $num = $get->getNumber($req,$name);
	 $req = "INSERT INTO livraisons VALUES (numero_livraison_seq.nextval, to_date('" .  $_POST['date_liv1'] . "','DD-MM-YYYY HH24:MI'), " . $num .")";
	 $get->execReq($req);

	echo "Votre contrat a bien été créé, raffraichissez la page pour qu'il s'affiche dans le tableau des contrats. <br>";
}
echo "hoho";
?>
