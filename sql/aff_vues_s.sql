-- ============================================================
--   Nom de la base   :  AMAP
--   Nom du fichier   :  aff_vues_s.sql
--   Nom de SGBD      :  ORACLE Version 7.0
--   Date de creation :  05/12/2017  18h00
-- ============================================================

@base
@vues_statistiques
@donnees

-- ============================================================
--    Données utiles pour les affichages suivants
-- ============================================================

INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('07-11-2017 21:00','DD-MM-YYYY HH24:MI'), 1 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('01-01-2017 18:00','DD-MM-YYYY HH24:MI'), 1 );
INSERT INTO livraisons VALUES ( numero_livraison_seq.nextval, to_date('12-03-2017 21:00','DD-MM-YYYY HH24:MI'), 2 );

INSERT INTO participer_a VALUES ( 18, 3);
INSERT INTO participer_a VALUES ( 18, 2);
INSERT INTO participer_a VALUES ( 18, 1);
INSERT INTO participer_a VALUES ( 19, 1);
INSERT INTO participer_a VALUES ( 20, 2);
INSERT INTO participer_a VALUES ( 20, 1);

-- ============================================================
--                vue_livraisons_annee
-- ============================================================
SELECT * from vue_livraisons_annee;

-- ============================================================
--                vue_adherent_distributions
-- ============================================================
SELECT * from vue_adherent_distributions;

-- ============================================================
--                vue_total_souscrits
-- ============================================================

SELECT * FROM vue_total_souscrits;

-- ============================================================
--                vue_total_souscrits
-- ============================================================

SELECT * FROM vue_prix_moyen_p;

rollback;
