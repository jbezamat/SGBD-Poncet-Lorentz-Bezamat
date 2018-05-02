-- ============================================================
--   Nom de la base   :  AMAP
--   Nom du fichier   :  supprimer_base.sql
--   Nom de SGBD      :  ORACLE Version 7.0
--   Date de creation :  29/11/2017  20h40
-- ============================================================

-- ============================================================
-- ============================================================
--                           DROP
-- ============================================================
-- ============================================================

DROP PROCEDURE procedure_livraison_un_foyer;
DROP PROCEDURE procedure_livraison_contrat;

DROP TYPE t_revenu_table;
DROP TYPE revenu_table;

DROP TRIGGER trigger_nombre_foyers_max;
DROP TRIGGER trigger_date_livraison;
DROP TRIGGER trigger_souscrire_date;
DROP TRIGGER trigger_souscrire_participer;

DROP INDEX paniers_fk1;
DROP TABLE paniers cascade constraints;
DROP SEQUENCE numero_panier_seq;

DROP TABLE types_de_contrat cascade constraints;
DROP SEQUENCE numero_type_de_contrat_seq;

DROP INDEX livraisons_fk1;
DROP TABLE livraisons cascade constraints;
DROP SEQUENCE numero_livraison_seq;

DROP TABLE participer_a cascade constraints;

DROP TABLE foyers cascade constraints;
DROP SEQUENCE numero_foyer_seq;

DROP TABLE appartenir_a cascade constraints;

DROP TABLE souscrire cascade constraints;

DROP TABLE personnes cascade constraints;
DROP SEQUENCE numero_personne_seq;

DROP TABLE producteurs cascade constraints;
DROP SEQUENCE numero_producteur_seq;
