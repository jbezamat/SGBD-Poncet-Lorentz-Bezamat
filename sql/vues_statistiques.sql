-- ============================================================
--   Nom de la base   :  AMAP
--   Nom du fichier   :  vues_statistiques.sql
--   Nom de SGBD      :  ORACLE Version 7.0
--   Date de creation :  04/12/2017  18h10
-- ============================================================

-- ============================================================
-- !!!!!! VOUS DEVEZ EXECUTER CES FICHIERS AVANT:
-- !!!!!!           - base.sql
-- ============================================================

--Liste des livraisons au cours de l'année écoulée avec des gens qui participent
CREATE OR REPLACE VIEW vue_livraisons_annee
      (numero_livraison, numero_type_de_contrat, date_livraison, numero_foyer) AS
      SELECT participer_a.numero_livraison, numero_type_de_contrat, date_livraison, participer_a.numero_foyer
      FROM livraisons
      RIGHT JOIN participer_a
      ON livraisons.numero_livraison = participer_a.numero_livraison
      WHERE date_livraison < SYSDATE AND to_char(date_livraison, 'YYYY') = to_char(SYSDATE, 'YYYY')
      ORDER BY date_livraison;


-- La liste des adhérents, avec le nombre de participations à des distributions au cours de l'année écoulée
CREATE OR REPLACE VIEW vue_adherent_distributions
      (numero_foyer, nom_foyer, nombre_participations) AS
      SELECT foyers.numero_foyer, foyers.nom_foyer, COUNT(numero_livraison)
      FROM foyers
      LEFT JOIN (SELECT numero_livraison, numero_type_de_contrat, date_livraison, numero_foyer as l_numero_foyer FROM vue_livraisons_annee)
      ON foyers.numero_foyer = l_numero_foyer
      GROUP BY foyers.numero_foyer, foyers.nom_foyer;

-- la somme des montants de tous les contrats souscrits par adhérent
CREATE OR REPLACE VIEW vue_total_souscrits
      (numero_foyer, nom_foyer, total) AS
      SELECT numero_foyer_2, nom_foyer_2, SUM(types_de_contrat.nombre_cheques * types_de_contrat.montant_cheques)
      FROM types_de_contrat
      INNER JOIN
        (
          SELECT souscrire.numero_foyer as numero_foyer_2, numero_type_de_contrat as numero_type_de_contrat_2, nom_foyer as nom_foyer_2
          FROM souscrire, foyers
          WHERE foyers.numero_foyer = souscrire.numero_foyer
        )
      ON numero_type_de_contrat_2 = types_de_contrat.numero_type_de_contrat
      GROUP BY numero_foyer_2, nom_foyer_2;

-- pour chaque contrat, le prix moyen d'un panier
CREATE OR REPLACE VIEW vue_prix_moyen_p
      (numero_type_de_contrat, prix_moyen_panier) AS
      SELECT types_de_contrat.numero_type_de_contrat,
      SUM(types_de_contrat.nombre_cheques * types_de_contrat.montant_cheques)/nombre_livraisons
      FROM types_de_contrat
      INNER JOIN vue_contrat_livraisons
      ON vue_contrat_livraisons.numero_type_de_contrat = types_de_contrat.numero_type_de_contrat
      GROUP BY types_de_contrat.numero_type_de_contrat, nombre_livraisons
      ORDER BY types_de_contrat.numero_type_de_contrat;
