
<?php

class ConsultOracle{

    public function printTable($com){
      if (!is_string($com))
        echo "Erreur lors de l'appel à la BDD" ;
      else {
		include "connect_oracle.php"; /* Le fichier connect_oracle.php contient les identifiants de connexion */
        $query = oci_parse($conn, $com);
        oci_execute($query);
        $row = oci_fetch_array($query, OCI_ASSOC);
        if (!$row)
			echo "Pas de table disponible.";
		else {
        echo "<table style= \"width:100%\">";
        
        echo "<tr>\n";
        
        foreach ($row as $cle => $item) {
            echo "    <th>" . $cle. "</th>\n";
          }
		  echo "</tr>\n";
		  echo "<tr>\n";
          foreach ($row as $item) {
            echo "    <td>" . $item. "</td>\n";
          }
          echo "</tr>\n";
        }
        while ($row = oci_fetch_array($query, OCI_ASSOC)) {
		  echo "<tr>\n";
          foreach ($row as $item) {
            echo "    <td>" . $item. "</td>\n";
          }
          echo "</tr>\n";
        }
        echo "</table>\n";
        oci_free_statement($query);
        oci_close($conn);
	}
    }
  
public function getNumber($req,$name){
	include "connect_oracle.php";
	$query = oci_parse($conn, $req);
	oci_execute($query);	
	$row = oci_fetch_array($query, OCI_ASSOC); 
    foreach ($row as $cle => $item)
		if ($name == $cle)
			return $item;
	oci_free_statement($query);
    oci_close($conn);	
}
  
  
public function execReq($req){
	include "connect_oracle.php";
	$query = oci_parse($conn, $req);
	oci_execute($query);
	/* while ($row = oci_fetch_array($query, OCI_ASSOC)) {
		  echo "<tr>\n";
          foreach ($row as $item) {
            echo "    <td>" . $item. "</td>\n";
          }
          echo "</tr>\n";
    } */
	oci_free_statement($query);
    oci_close($conn);
}



  public function estFoyer($num){
    include "connect_oracle.php"; 
    $query = oci_parse($conn, "select numero_foyer from foyers");
    oci_execute($query);
    while ($row = oci_fetch_array($query, OCI_ASSOC))
      foreach ($row as $item)
        if ($item == $num){
			oci_free_statement($query);
			oci_close($conn);
			return True;
}
	oci_free_statement($query);
	oci_close($conn);
    return False;
  }

  public function estProd($num){
    include "connect_oracle.php"; 
    $query = oci_parse($conn, "select numero_producteur from producteurs");
    oci_execute($query);
    while ($row = oci_fetch_array($query, OCI_ASSOC))
      foreach ($row as $item)
        if ($item == $num){
			oci_free_statement($query);
			oci_close($conn);
			return True;
		}
	oci_free_statement($query);
	oci_close($conn);
	return False;
  }
}

?>
