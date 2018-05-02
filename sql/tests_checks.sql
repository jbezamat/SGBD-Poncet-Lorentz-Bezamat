-- ============================================================
--   Nom de la base   :  AMAP
--   Nom du fichier   :  tests_checks.sql
--   Nom de SGBD      :  ORACLE Version 7.0
--   Date de creation :  30/11/2017  11h01
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

INSERT INTO paniers VALUES ( numero_panier_seq.nextval, 'Panier Check');

INSERT INTO personnes VALUES ( numero_personne_seq.nextval, 'Check', 'CHECK', '06 59 64 54 45', 'check@yahoo.fr');

INSERT INTO producteurs VALUES ( numero_producteur_seq.nextval, '32 avenue CHECK', 'CHECK', 1);

-- ============================================================
--    check types_de_contrat
-- ============================================================

-- ok
INSERT INTO types_de_contrat VALUES (  numero_type_de_contrat_seq.nextval, 99, 5, 8, 1, 1);
-- ne marche pas car: CHECK (nombre_foyers_max >= 1)
INSERT INTO types_de_contrat VALUES (  numero_type_de_contrat_seq.nextval, 0, 5, 8, 1, 1);

-- ok
INSERT INTO types_de_contrat VALUES (  numero_type_de_contrat_seq.nextval, 2, 99, 8, 1, 1);
-- ne marche pas car: CHECK (nombre_cheques >= 1)
INSERT INTO types_de_contrat VALUES (  numero_type_de_contrat_seq.nextval, 2, 0, 8, 1, 1);

-- ok
INSERT INTO types_de_contrat VALUES (  numero_type_de_contrat_seq.nextval, 2, 5, 99, 1, 1);
-- ne marche pas car: CHECK (montant_cheques >= 1)
INSERT INTO types_de_contrat VALUES (  numero_type_de_contrat_seq.nextval, 2, 5, 0, 1, 1);

-- ============================================================
--    check personnes
-- ============================================================

-- ok
INSERT INTO personnes VALUES ( numero_personne_seq.nextval, 'Oui', 'oui', NULL, 'ouioui@non.com');
INSERT INTO personnes VALUES ( numero_personne_seq.nextval, 'Oui2', 'oui2', '0608456789', NULL);

-- ne marche pas car: CHECK (telephone IS not null OR mail IS not null)
INSERT INTO personnes VALUES ( numero_personne_seq.nextval, 'Non', 'non', NULL, NULL);

rollback;
