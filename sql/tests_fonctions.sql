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

INSERT INTO paniers VALUES ( numero_panier_seq.nextval, 'Panier Fonction');

--foyer 1
INSERT INTO personnes VALUES ( numero_personne_seq.nextval, 'Fonction1', 'FONCTION1', '06 99 99 54 11', 'Fonction1@yahoo.fr');
INSERT INTO foyers VALUES ( numero_foyer_seq.nextval, 'Foyer Fonction1');
INSERT INTO appartenir_a VALUES ( 1, 1 );

--foyer 2
INSERT INTO personnes VALUES ( numero_personne_seq.nextval, 'Fonction2', 'FONCTION2', '06 99 99 54 12', 'Fonction2@yahoo.fr');
INSERT INTO foyers VALUES ( numero_foyer_seq.nextval, 'Foyer Fonction2');
INSERT INTO appartenir_a VALUES ( 2, 2 );

--foyer 3
INSERT INTO personnes VALUES ( numero_personne_seq.nextval, 'Fonction3', 'FONCTION3', '06 99 99 54 13', 'Fonction3@yahoo.fr');
INSERT INTO foyers VALUES ( numero_foyer_seq.nextval, 'Foyer Fonction3');
INSERT INTO appartenir_a VALUES ( 3, 3 );

--producteur 1
INSERT INTO personnes VALUES ( numero_personne_seq.nextval, 'Fonction prod1', 'FONCTION prod1', '06 99 99 54 14', 'Fonction1_prod@yahoo.fr');
INSERT INTO producteurs VALUES ( numero_producteur_seq.nextval, '32 avenue FONCTION1', 'FONCTION1', 4);

--producteur 2
INSERT INTO personnes VALUES ( numero_personne_seq.nextval, 'Fonction prod2', 'FONCTION prod2', '06 99 99 54 14', 'Fonction_prod2@yahoo.fr');
INSERT INTO producteurs VALUES ( numero_producteur_seq.nextval, '32 avenue FONCTION2', 'FONCTION2', 5);


INSERT INTO types_de_contrat VALUES (  numero_type_de_contrat_seq.nextval, 10, 10, 10, 1, 1);
INSERT INTO types_de_contrat VALUES (  numero_type_de_contrat_seq.nextval, 10, 10, 10, 1, 1);
INSERT INTO types_de_contrat VALUES (  numero_type_de_contrat_seq.nextval, 10, 10, 10, 1, 1);

INSERT INTO types_de_contrat VALUES (  numero_type_de_contrat_seq.nextval, 10, 10, 10, 1, 2);
INSERT INTO types_de_contrat VALUES (  numero_type_de_contrat_seq.nextval, 10, 10, 10, 1, 2);


-- types_de_contrat 1
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('01-01-2018 21:00','DD-MM-YYYY HH24:MI'), 1 );

INSERT INTO souscrire VALUES ( 1, 1);
INSERT INTO souscrire VALUES ( 1, 2);

-- types_de_contrat 2
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('01-01-2018 21:00','DD-MM-YYYY HH24:MI'), 2 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('05-01-2018 21:00','DD-MM-YYYY HH24:MI'), 2 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('10-01-2018 21:00','DD-MM-YYYY HH24:MI'), 2 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('15-01-2018 21:00','DD-MM-YYYY HH24:MI'), 2 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('20-01-2018 21:00','DD-MM-YYYY HH24:MI'), 2 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('30-01-2018 21:00','DD-MM-YYYY HH24:MI'), 2 );

INSERT INTO souscrire VALUES ( 2, 1);
INSERT INTO souscrire VALUES ( 2, 2);
INSERT INTO souscrire VALUES ( 2, 3);


-- types_de_contrat 3
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('01-01-2018 21:00','DD-MM-YYYY HH24:MI'), 3 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('05-01-2018 21:00','DD-MM-YYYY HH24:MI'), 3 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('10-01-2018 21:00','DD-MM-YYYY HH24:MI'), 3 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('15-01-2018 21:00','DD-MM-YYYY HH24:MI'), 3 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('20-01-2018 21:00','DD-MM-YYYY HH24:MI'), 3 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('30-01-2018 21:00','DD-MM-YYYY HH24:MI'), 3 );

INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('01-02-2018 21:00','DD-MM-YYYY HH24:MI'), 3 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('05-02-2018 21:00','DD-MM-YYYY HH24:MI'), 3 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('10-02-2018 21:00','DD-MM-YYYY HH24:MI'), 3 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('15-02-2018 21:00','DD-MM-YYYY HH24:MI'), 3 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('20-02-2018 21:00','DD-MM-YYYY HH24:MI'), 3 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('25-02-2018 21:00','DD-MM-YYYY HH24:MI'), 3 );

INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('01-03-2018 21:00','DD-MM-YYYY HH24:MI'), 3 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('05-03-2018 21:00','DD-MM-YYYY HH24:MI'), 3 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('10-03-2018 21:00','DD-MM-YYYY HH24:MI'), 3 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('15-03-2018 21:00','DD-MM-YYYY HH24:MI'), 3 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('20-03-2018 21:00','DD-MM-YYYY HH24:MI'), 3 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('25-03-2018 21:00','DD-MM-YYYY HH24:MI'), 3 );

INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('01-04-2018 21:00','DD-MM-YYYY HH24:MI'), 3 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('05-04-2018 21:00','DD-MM-YYYY HH24:MI'), 3 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('10-04-2018 21:00','DD-MM-YYYY HH24:MI'), 3 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('15-04-2018 21:00','DD-MM-YYYY HH24:MI'), 3 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('20-04-2018 21:00','DD-MM-YYYY HH24:MI'), 3 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('25-04-2018 21:00','DD-MM-YYYY HH24:MI'), 3 );

INSERT INTO souscrire VALUES ( 3, 1);
INSERT INTO souscrire VALUES ( 3, 2);
INSERT INTO souscrire VALUES ( 3, 3);

-- types_de_contrat 4
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('01-01-2018 21:00','DD-MM-YYYY HH24:MI'), 4 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('01-06-2018 21:00','DD-MM-YYYY HH24:MI'), 4 );

INSERT INTO souscrire VALUES ( 4, 1);

-- types_de_contrat 5
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('01-01-2018 21:00','DD-MM-YYYY HH24:MI'), 5 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('01-08-2018 21:00','DD-MM-YYYY HH24:MI'), 5 );

INSERT INTO souscrire VALUES ( 5, 1);
INSERT INTO souscrire VALUES ( 5, 2);
INSERT INTO souscrire VALUES ( 5, 3);


-- ============================================================
--                revenu_mois_contrat
-- ============================================================

-- 200
SELECT revenu_mois_contrat(01,2018,1) FROM DUAL;

-- 300
SELECT revenu_mois_contrat(01,2018,2) FROM DUAL;

-- 300
SELECT revenu_mois_contrat(01,2018,3) FROM DUAL;

-- 75
SELECT revenu_mois_contrat(02,2018,3) FROM DUAL;

-- ============================================================
--                revenu_mois_prod
-- ============================================================

--575
SELECT revenu_mois_prod(01,2018,1) FROM DUAL;

--75
SELECT revenu_mois_prod(02,2018,1) FROM DUAL;

--75
SELECT revenu_mois_prod(03,2018,1) FROM DUAL;

--0
SELECT revenu_mois_prod(05,2018,1) FROM DUAL;

--200
SELECT revenu_mois_prod(01,2018,2) FROM DUAL;

-- ============================================================
--                revenu_moy_mois_prod
-- ============================================================

--66,66
SELECT revenu_moy_mois_prod(2018, 1) FROM DUAL;

--33,33
SELECT revenu_moy_mois_prod(2018, 2) FROM DUAL;

-- ============================================================
--                revenu_moy_mois_all
-- ============================================================


select * from table(revenu_moy_mois_all(2018));

rollback;
