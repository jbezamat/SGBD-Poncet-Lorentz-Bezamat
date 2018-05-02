-- ============================================================
--   Nom de la base   :  AMAP
--   Nom du fichier   :  tests_procedures.sql
--   Nom de SGBD      :  ORACLE Version 7.0
--   Date de creation :  05/12/2017  17h47
-- ============================================================

-- ============================================================
-- !!!!!! VOUS DEVEZ EXECUTER CES FICHIERS AVANT:
-- !!!!!!           - base.sql
-- ============================================================

DELETE FROM participer_a;
DELETE FROM souscrire;
DELETE FROM livraisons;
DELETE FROM types_de_contrat;
DELETE FROM paniers;
DELETE FROM producteurs;
DELETE FROM appartenir_a;
DELETE FROM personnes;
DELETE FROM foyers;


-- ============================================================
--    Données utiles pour les tests suivants
-- ============================================================

INSERT INTO paniers VALUES ( numero_panier_seq.nextval, 'Panier Procedure');

--producteur
INSERT INTO personnes VALUES ( numero_personne_seq.nextval, 'Procedure prod', 'Procedure prod', '06 99 99 54 14', 'Procedure_prod@yahoo.fr');
INSERT INTO producteurs VALUES ( numero_producteur_seq.nextval, '32 avenue PROCEDURE', 'PROCEDURE', 1);


INSERT INTO types_de_contrat VALUES (  numero_type_de_contrat_seq.nextval, 2, 10, 10, 1, 1);



-- ============================================================
--                procedure_livraison_un_foyer
-- ============================================================

--Ces livraisons ne sont pas revelées par la procedure 'procedure_livraison_un_foyer' (livrasons 1 et 2))
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, SYSDATE+15, 1 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, SYSDATE+5, 1 );

--Ces livraisons sont revelées par la procedure 'procedure_livraison_un_foyer' (livrasons 3 et 4)
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, SYSDATE+1, 1 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, SYSDATE+1, 1 );

-- ============================================================
--                procedure_livraison_contrat
-- ============================================================
--Ce type de contrat n'est pas revelé par la procédure procedure_livraison_contrat (contrat 1)
INSERT INTO types_de_contrat VALUES (  numero_type_de_contrat_seq.nextval, 99, 99, 99, 1, 1);
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, SYSDATE+99, 2 );

--Ces types de contrat sont revelés par la procédure procedure_livraison_contrat car aucune date de livraison n'y est associée (types de contrat 3 / 4)
INSERT INTO types_de_contrat VALUES (  numero_type_de_contrat_seq.nextval, 99, 99, 99, 1, 1);
INSERT INTO types_de_contrat VALUES (  numero_type_de_contrat_seq.nextval, 99, 99, 99, 1, 1);
