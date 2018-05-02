-- ============================================================
--   Nom de la base   :  AMAP
--   Nom du fichier   :  fonctions.sql
--   Nom de SGBD      :  ORACLE Version 7.0
--   Date de creation :  09/12/2017  12h10
-- ============================================================

-- ============================================================
-- !!!!!! VOUS DEVEZ EXECUTER CES FICHIERS AVANT:
-- !!!!!!           - base.sql
-- !!!!!!           - vues_statistiques.sql
-- !!!!!!           - vues_consultation.sql
-- ============================================================


-- retourne le revenu engendré par le contrat (num_contrat) pour l'année (annee) et le mois (mois)
CREATE OR REPLACE FUNCTION revenu_mois_contrat(mois IN NUMBER, annee IN NUMBER, num_contrat IN NUMBER)
   RETURN NUMBER
   AS
    revenu_moyen_panier NUMBER;
    nb_livraison_mois NUMBER;
    prix_contrat_mois NUMBER;
    nb_souscrit NUMBER;
    revenu_mois_c NUMBER;
   BEGIN

      -- Car 1 panier = 1 livraison
      SELECT prix_moyen_panier INTO revenu_moyen_panier
      FROM vue_prix_moyen_p
      WHERE numero_type_de_contrat = num_contrat;

      SELECT COUNT(numero_livraison) INTO nb_livraison_mois
      FROM livraisons
      WHERE numero_type_de_contrat = num_contrat
      AND to_char(date_livraison,'MM') = mois
      AND to_char(date_livraison, 'YYYY') = annee;

      prix_contrat_mois := nb_livraison_mois * revenu_moyen_panier;

      SELECT COUNT(numero_foyer) INTO nb_souscrit
      FROM vue_adherent_contrat
      WHERE numero_type_de_contrat = num_contrat
      GROUP BY numero_type_de_contrat;

      revenu_mois_c := prix_contrat_mois * nb_souscrit;


      RETURN(revenu_mois_c);
    END;
/

-- retourne le revenu reçu par le producteur (num_prod) au cours de l'année (annee) et du mois (mois)
CREATE OR REPLACE FUNCTION revenu_mois_prod(mois IN NUMBER, annee IN NUMBER, num_prod IN NUMBER)
   RETURN NUMBER
   AS
    revenu_mois_p NUMBER :=0;
    revenu_mois_c NUMBER :=0;
   BEGIN
   FOR compteur IN (SELECT numero_type_de_contrat FROM types_de_contrat WHERE numero_producteur = num_prod)
   LOOP
    SELECT revenu_mois_contrat(mois, annee, compteur.numero_type_de_contrat) INTO revenu_mois_c FROM DUAL;
    revenu_mois_p := revenu_mois_p + revenu_mois_c;
   END LOOP;
   RETURN(revenu_mois_p);
 END;
/

-- retourne le revenu moyen reçu par le producteur (num_prod) par mois sur une année (annee)
CREATE OR REPLACE FUNCTION revenu_moy_mois_prod(annee IN NUMBER, num_prod IN NUMBER)
   RETURN NUMBER
   AS
    revenu_mois_p NUMBER :=0;
    revenu_total NUMBER :=0;
    revenu_moy NUMBER :=0;
   BEGIN
   FOR compteur IN 1 .. 12
   LOOP
    SELECT revenu_mois_prod(compteur, annee, num_prod) INTO revenu_mois_p FROM DUAL;
    revenu_total := revenu_total + revenu_mois_p;
   END LOOP;
   revenu_moy := revenu_total/12;
   RETURN(revenu_moy);
 END;
/

-- Les types suivants sont defini pour la valeur de retour de la fonction revenu_moy_annee_all
-- Sinon replace revenu_table ne marche pas car il existe encore le type t_revenu_table qui depend de lui
DROP TYPE t_revenu_table;

-- Objet contenant le numero_producteur et revenu_moyen_annee
CREATE OR REPLACE TYPE revenu_table AS object (
  numero_producteur NUMBER,
  revenu_moyen_annee NUMBER
);
/

-- Permet de créer un type (t_revenu_table) contenant une table de revenu_table
CREATE OR REPLACE TYPE t_revenu_table as table of revenu_table;
/

-- Permet de renvoyer un t_revenu_table des revenus moyens par mois sur une année (annee) pour chaque producteur
CREATE OR REPLACE FUNCTION revenu_moy_mois_all(annee IN NUMBER)
   RETURN t_revenu_table
   AS
    my_t_revenu_table t_revenu_table;
    revenu_moyen_mois_c NUMBER :=0;

   BEGIN
   my_t_revenu_table := t_revenu_table();
   FOR compteur IN (SELECT numero_producteur FROM producteurs)
   LOOP
    SELECT revenu_moy_mois_prod(annee, compteur.numero_producteur) INTO revenu_moyen_mois_c FROM DUAL;
    my_t_revenu_table.extend;
    my_t_revenu_table(my_t_revenu_table.count) := revenu_table(compteur.numero_producteur, revenu_moyen_mois_c);
   END LOOP;
   RETURN(my_t_revenu_table);
 END;
/
