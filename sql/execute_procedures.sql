-- ============================================================
--   Nom de la base   :  AMAP
--   Nom du fichier   :  execute_procedures.sql
--   Nom de SGBD      :  ORACLE Version 7.0
--   Date de creation :  30/11/2017  11h20
-- ============================================================

-- ============================================================
-- !!!!!! VOUS DEVEZ EXECUTER CES FICHIERS AVANT:
-- !!!!!!           - base.sql
-- !!!!!!           - vues.sql
-- !!!!!!           - procedures.sql
-- ============================================================
-- Pour l'affichage des dbms_output.put_line
set serveroutput on;

-- ============================================================
--                procedure_livraison_un_foyer
-- ============================================================

-- Les livraisons 3 et 4 devraient ressortir car aucun foyer n'y participe et qu'elles auront lieu demain
EXECUTE procedure_livraison_un_foyer

-- ============================================================
--                procedure_livraison_contrat
-- ============================================================

-- La livraison 2 devrait apparaître car aucune livraison n'y est rattachée
EXECUTE procedure_livraison_contrat

rollback;
