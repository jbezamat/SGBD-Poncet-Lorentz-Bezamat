-- ============================================================
--   Nom de la base   :  AMAP
--   Nom du fichier   :  procedures.sql
--   Nom de SGBD      :  ORACLE Version 7.0
--   Date de creation :  29/11/2017  21h40
-- ============================================================

-- ============================================================
-- !!!!!! VOUS DEVEZ EXECUTER CES FICHIERS AVANT:
-- !!!!!!           - base.sql
-- !!!!!            - vues.sql
-- ============================================================

-- Procedure livraison un foyer
-- Cette procedure vérifie qu'au moins un foyer participe à chaque livraison
CREATE or REPLACE PROCEDURE procedure_livraison_un_foyer
  IS
  BEGIN
  FOR compteur IN (SELECT * FROM vue_livraisons_j_moins_1)
  LOOP
    IF compteur.numero_foyer is NULL THEN
      dbms_output.put_line('Aucun foyer ne participe a la livraison numero : ' || compteur.numero_livraison);
      --RAISE_APPLICATION_ERROR (-20001,'Il manque la participation d un foyer');
    END IF;
  END LOOP;

  END ;
/

-- Livraion type de contrat
-- Cette procedure vérifie qu'à chaque type de contrat est associé au moins une date de livraison
CREATE or REPLACE PROCEDURE procedure_livraison_contrat
  IS
  BEGIN
  FOR compteur IN (SELECT * FROM vue_livraison_type_contrat)
  LOOP
    IF compteur.numero_livraison is NULL THEN
      dbms_output.put_line('Aucune livraison n est attachee au type de contrat numero : ' || compteur.numero_type_de_contrat);
    END IF;
  END LOOP;

  END ;
/
