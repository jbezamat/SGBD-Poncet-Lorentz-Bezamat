-- ============================================================
--   Nom de la base   :  AMAP
--   Nom du fichier   :  triggers.sql
--   Nom de SGBD      :  ORACLE Version 7.0
--   Date de creation :  21/11/2017  11h10
-- ============================================================

-- ============================================================
-- !!!!!! VOUS DEVEZ EXECUTER CES FICHIERS AVANT:
-- !!!!!!           - base.sql
-- !!!!!!           - vues.sql
-- ============================================================

-- Nombre foyers max
-- Ce trigger verifie lors de l'ajout ou de la modification de la
-- table souscrire si le nombre de foyers max du contrat n'est pas dépassé
CREATE OR REPLACE TRIGGER trigger_nombre_foyers_max
        BEFORE UPDATE OR INSERT ON souscrire
        FOR EACH ROW
      DECLARE
        count_foyers  INTEGER;
        count_foyers_max  INTEGER;
      BEGIN
        SELECT COUNT(numero_type_de_contrat) INTO count_foyers
        FROM souscrire
        WHERE numero_type_de_contrat = :new.numero_type_de_contrat;

        SELECT nombre_foyers_max INTO count_foyers_max
        FROM types_de_contrat
        WHERE numero_type_de_contrat = :new.numero_type_de_contrat;

        IF :old.numero_type_de_contrat = :new.numero_type_de_contrat THEN
          RETURN;
        ELSE
          --count_foyers + 1 car on compte le foyer ajouté
          IF (count_foyers+1) > (count_foyers_max) THEN
            RAISE_APPLICATION_ERROR (-20000,'Il y a deja trop de foyers qui ont souscrit a ce contrat');
          END IF;
        END IF;
      END;
/

-- Date livraison > date en cours
-- Ce trigger verifie lors de l'ajout ou de la modification de la table livraison que la
-- date de livraison est supérieure à la date actuelle
CREATE OR REPLACE TRIGGER trigger_date_livraison
        BEFORE UPDATE OR INSERT ON livraisons
        FOR EACH ROW
      DECLARE
      BEGIN

        IF :old.date_livraison = :new.date_livraison THEN
          RETURN;
        ELSE
          IF :new.date_livraison < SYSDATE THEN
            RAISE_APPLICATION_ERROR (-20001,'La date de la livraison est inferieure a la date actuelle');
          END IF;
        END IF;
      END;
/

-- Date souscrire > dates livraisons du contrat
-- Ce trigger verifie lors de l'ajout ou de la modification de la table souscrire que le foyer
-- ne souscrit pas à un contrat dont la première date de livraison est déjà passée
CREATE OR REPLACE TRIGGER trigger_souscrire_date
        BEFORE UPDATE OR INSERT ON souscrire
        FOR EACH ROW
      DECLARE
        date_livraison_1 DATE;
      BEGIN
        SELECT date_livraison INTO date_livraison_1
        FROM vue_livraison_type_contrat
        WHERE ROWNUM=1 and numero_type_de_contrat = :new.numero_type_de_contrat
        ORDER BY date_livraison asc;

        IF date_livraison_1 < SYSDATE THEN
          RAISE_APPLICATION_ERROR (-20002,'Quelqu un essaye de souscrire a un contrat qui a deja commence');
        END IF;
      END;
/

-- Souscrire participer_a
-- Ce trigger verifie lors de l'ajout ou de la modification de la table participer_a
-- que le foyer ne participe pas à une livraison d'un contrat auquel il n'a pas souscrit
CREATE OR REPLACE TRIGGER trigger_souscrire_participer
        BEFORE UPDATE OR INSERT ON participer_a
        FOR EACH ROW
      DECLARE
        count_souscrire INTEGER;
        types_de_contrat_livraison INTEGER;
      BEGIN
        SELECT numero_type_de_contrat INTO types_de_contrat_livraison
        FROM livraisons
        WHERE livraisons.numero_livraison = :new.numero_livraison;

        SELECT count(numero_type_de_contrat) INTO count_souscrire
        FROM vue_souscrire
        WHERE vue_souscrire.numero_foyer = :new.numero_foyer AND vue_souscrire.numero_type_de_contrat = types_de_contrat_livraison;

        IF count_souscrire <= 0 THEN
          RAISE_APPLICATION_ERROR (-20003,'Quelqu un essaye de participer a un contrat dont il n a pas souscrit');
        END IF;
      END;
/

-- livraison_max_1_an
-- Ce trigger verifie lors de l'ajout ou de la modification de la table livraisons
-- qu'elle n'a pas lieu plus d'un an après la 1ère livraison du même contrat
CREATE OR REPLACE TRIGGER trigger_livraison_max_1_an
        BEFORE UPDATE OR INSERT ON livraisons
        FOR EACH ROW
      DECLARE
        date_livraison_1 DATE;
      BEGIN
        SELECT date_livraison INTO date_livraison_1
        FROM vue_livraison_type_contrat
        where ROWNUM=1 and numero_type_de_contrat = :new.numero_type_de_contrat
        order by date_livraison asc;

        IF date_livraison_1 = NULL THEN
          RETURN;
        ELSE
          IF :new.date_livraison > date_livraison_1 + 365 THEN
            RAISE_APPLICATION_ERROR (-20004,'La livraison a lieu 1 an apres la premiere livraison');
          END IF;
        END IF;
      END;
/
