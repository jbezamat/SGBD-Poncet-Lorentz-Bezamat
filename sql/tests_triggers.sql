-- ============================================================
--   Nom de la base   :  AMAP
--   Nom du fichier   :  tests_triggers.sql
--   Nom de SGBD      :  ORACLE Version 7.0
--   Date de creation :  28/11/2017  09h50
-- ============================================================

-- ============================================================
-- !!!!!! VOUS DEVEZ EXECUTER CES FICHIERS AVANT:
-- !!!!!!           - base.sql
-- !!!!!!           - vues.sql
-- !!!!!!           - triggers.sql
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

INSERT INTO paniers VALUES ( numero_panier_seq.nextval, 'Panier Trigger');

--foyer 1
INSERT INTO personnes VALUES ( numero_personne_seq.nextval, 'Trigger1', 'TRIGGER1', '06 99 99 54 11', 'Trigger1@yahoo.fr');
INSERT INTO foyers VALUES ( numero_foyer_seq.nextval, 'Foyer trigger1');
INSERT INTO appartenir_a VALUES ( 1, 1 );

--foyer 2
INSERT INTO personnes VALUES ( numero_personne_seq.nextval, 'Trigger2', 'TRIGGER2', '06 99 99 54 12', 'Trigger2@yahoo.fr');
INSERT INTO foyers VALUES ( numero_foyer_seq.nextval, 'Foyer trigger2');
INSERT INTO appartenir_a VALUES ( 2, 2 );

--foyer 3
INSERT INTO personnes VALUES ( numero_personne_seq.nextval, 'Trigger3', 'TRIGGER3', '06 99 99 54 13', 'Trigger3@yahoo.fr');
INSERT INTO foyers VALUES ( numero_foyer_seq.nextval, 'Foyer trigger3');
INSERT INTO appartenir_a VALUES ( 3, 3 );

--producteur
INSERT INTO personnes VALUES ( numero_personne_seq.nextval, 'Trigger prod', 'TRIGGER prod', '06 99 99 54 14', 'Trigger_prod@yahoo.fr');
INSERT INTO producteurs VALUES ( numero_producteur_seq.nextval, '32 avenue TRIGGER', 'TRIGGER', 4);


INSERT INTO types_de_contrat VALUES (  numero_type_de_contrat_seq.nextval, 2, 10, 10, 1, 1);
INSERT INTO types_de_contrat VALUES (  numero_type_de_contrat_seq.nextval, 10, 10, 10, 1, 1);

INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, SYSDATE+100, 1 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('28-12-2017 21:00','DD-MM-YYYY HH24:MI'), 2 );

-- ============================================================
--                trigger_nombre_foyers_max
-- ============================================================

-- Ici l'insertion passe car nombre_foyers <= nombre_foyers
SELECT COUNT(numero_type_de_contrat)
FROM souscrire
WHERE numero_type_de_contrat = numero_type_de_contrat;
INSERT INTO souscrire VALUES ( 1, 1);

-- Ici l'insertion passe car nombre_foyers <= nombre_foyers
SELECT COUNT(numero_type_de_contrat)
FROM souscrire
WHERE numero_type_de_contrat = numero_type_de_contrat;
INSERT INTO souscrire VALUES ( 1, 2);

-- Ici l'insertion ne passe pas car nombre_foyers > nombre_foyers
SELECT COUNT(numero_type_de_contrat)
FROM souscrire
WHERE numero_type_de_contrat = numero_type_de_contrat;
INSERT INTO souscrire VALUES ( 1, 3);


-- ============================================================
--                trigger_date_livraison
-- ============================================================

-- Ici l'insertion passe car date > date actuelle
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, SYSDATE+100, 1 );

-- Ici l'insertion ne passe pas car date < date actuelle
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, SYSDATE-100, 1 );

-- ============================================================
--                trigger_souscrire_date
-- ============================================================

ALTER TRIGGER trigger_date_livraison DISABLE;

INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('30-01-2000 21:00','DD-MM-YYYY HH24:MI'), 1 );

-- Ici l'insertion ne passe pas car date actuelle < min date livraison du contrat
INSERT INTO souscrire VALUES ( 1, 1);

ALTER TRIGGER trigger_date_livraison ENABLE;
-- ============================================================
--                trigger_souscrire_participer
-- ============================================================

-- Ici l'insertion passe  car le foyer numero 2 a souscrit au contrat correspondant à la livraison 1 (le contrat 1)
INSERT INTO participer_a VALUES ( 1, 2);

-- Ici l'insertion ne passe pas car le foyer numero 2 n'a pas souscrit au contrat correspondant à la livraison 2 (le contrat 1)
INSERT INTO participer_a VALUES ( 2, 2);

-- ============================================================
--                trigger_souscrire_participer
-- ============================================================

-- Ici l'insertion passe car la date de livraison est inférieure à la première date de livraison du contrat 3 (le 28-12-2017 21:00)
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('28-12-2018 20:59','DD-MM-YYYY HH24:MI'), 2);

-- Ici l'insertion ne passe pas car la date de livraison est supérieure à la première date de livraison du contrat 3 (le 28-12-2017 21:00)
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('28-12-2018 21:01','DD-MM-YYYY HH24:MI'), 2);



rollback;
