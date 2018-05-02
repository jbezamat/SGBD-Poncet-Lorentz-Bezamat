    -- ============================================================
--   Nom de la base   :  AMAP
--   Nom du fichier   :  donnees.sql
--   Nom de SGBD      :  ORACLE Version 7.0
--   Date de creation :  14/11/2017  18h10
-- ============================================================

-- ============================================================
-- !!!!!! VOUS DEVEZ EXECUTER CES FICHIERS AVANT:
-- !!!!!!           - base.sql
-- ============================================================


-- ============================================================
--    suppression des donnees
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
--    creation des donnees
-- ============================================================


-- ============================================================
--    Paniers
-- ============================================================

INSERT INTO paniers VALUES (  numero_panier_seq.nextval , 'Petits paniers campus'  ) ;
INSERT INTO paniers VALUES (  numero_panier_seq.nextval , 'Paniers de legumes'  ) ;
INSERT INTO paniers VALUES (  numero_panier_seq.nextval , 'Paniers de fruits'  ) ;


-- ============================================================
--    Personnes
-- ============================================================

INSERT INTO personnes VALUES ( numero_personne_seq.nextval, 'Dupont', 'Elias', '06 59 64 54 45', 'Dark_elias@yahoo.fr');
INSERT INTO personnes VALUES ( numero_personne_seq.nextval, 'Snow', 'Nadim', '06 54 21 34 45', 'xoxoNadimxoxo@yahoo.fr');
INSERT INTO personnes VALUES ( numero_personne_seq.nextval, 'Sam', 'Maelle', '06 34 51 39 25', 'soyeuse@gmail.com');
INSERT INTO personnes VALUES ( numero_personne_seq.nextval, 'Oui', 'oui', '07 10 25 45 15', 'ouioui@non.com');
INSERT INTO personnes VALUES ( numero_personne_seq.nextval, 'Jean', 'Mich-Mich', '05 12 58 96 45', 'Jean_producteur@hotmail.com');


-- ============================================================
--    Producteurs
-- ============================================================

INSERT INTO producteurs VALUES ( numero_producteur_seq.nextval, '32 avenue Patxi', 'BDA - ENSEIRB-MATMECA', 1);
INSERT INTO producteurs VALUES ( numero_producteur_seq.nextval, '32 avenue Patxi', 'BDA - ENSEIRB-MATMECA', 5);


-- ============================================================
--    Foyers
-- ============================================================

INSERT INTO foyers VALUES ( numero_foyer_seq.nextval, 'Foyer Dupont');
INSERT INTO foyers VALUES ( numero_foyer_seq.nextval, 'La famille Snow');
INSERT INTO foyers VALUES ( numero_foyer_seq.nextval, 'Pays des jouets');

-- ============================================================
--    Appartenir à
-- ============================================================

INSERT INTO appartenir_a VALUES ( 1, 1 );
INSERT INTO appartenir_a VALUES ( 2, 2 );
INSERT INTO appartenir_a VALUES ( 2, 3 );
INSERT INTO appartenir_a VALUES ( 3, 4 );


-- ============================================================
--    Types de contrat
-- ============================================================

--2 foyers max 5 chèques de 8€ panier n°1 producteur 1
INSERT INTO types_de_contrat VALUES (  numero_type_de_contrat_seq.nextval, 2, 5, 8, 1, 1);

--2 foyers max 4 chèques de 8€ panier n°2 producteur 1
INSERT INTO types_de_contrat VALUES (  numero_type_de_contrat_seq.nextval, 2, 4, 8, 2, 1);
--20 foyers max 5 chèques de 80€ panier n°2 producteur 1
INSERT INTO types_de_contrat VALUES (  numero_type_de_contrat_seq.nextval, 20, 5, 80, 2, 1);


-- ============================================================
--    Livraisons
-- ============================================================

--Type contrat 1
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('28-12-2017 21:00','DD-MM-YYYY HH24:MI'), 1);
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('10-02-2018 20:00','DD-MM-YYYY HH24:MI'), 1);
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('20-02-2018 20:00','DD-MM-YYYY HH24:MI'), 1);
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('24-02-2018 20:00','DD-MM-YYYY HH24:MI'), 1);
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('10-03-2018 21:00','DD-MM-YYYY HH24:MI'), 1);

--Type contrat 2
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('24-04-2018 15:00','DD-MM-YYYY HH24:MI'), 2 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('26-04-2018 15:00','DD-MM-YYYY HH24:MI'), 2 );

--Type contrat 3
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('25-12-2017 20:00','DD-MM-YYYY HH24:MI'), 3);
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('10-02-2018 18:00','DD-MM-YYYY HH24:MI'), 3);
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('25-02-2018 19:00','DD-MM-YYYY HH24:MI'), 3);
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('01-03-2018 20:00','DD-MM-YYYY HH24:MI'), 3);
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('10-03-2018 21:00','DD-MM-YYYY HH24:MI'), 3);
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('20-04-2018 19:00','DD-MM-YYYY HH24:MI'), 3);
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('25-06-2018 18:00','DD-MM-YYYY HH24:MI'), 3);
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('25-07-2018 19:00','DD-MM-YYYY HH24:MI'), 3);
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('12-08-2018 20:00','DD-MM-YYYY HH24:MI'), 3);
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('15-08-2018 21:00','DD-MM-YYYY HH24:MI'), 3);



-- ============================================================
--    Souscrire
-- ============================================================

INSERT INTO souscrire VALUES ( 1, 1);
INSERT INTO souscrire VALUES ( 1, 2);
INSERT INTO souscrire VALUES ( 2, 2);
INSERT INTO souscrire VALUES ( 2, 3);


-- ============================================================
--    Partciper à
-- ============================================================

INSERT INTO participer_a VALUES ( 1, 1);
INSERT INTO participer_a VALUES ( 1, 2);
INSERT INTO participer_a VALUES ( 2, 2);
INSERT INTO participer_a VALUES ( 5, 1);
INSERT INTO participer_a VALUES ( 6, 2);



COMMIT;
