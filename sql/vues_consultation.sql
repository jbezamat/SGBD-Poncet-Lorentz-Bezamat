-- ============================================================
--   Nom de la base   :  AMAP
--   Nom du fichier   :  vues_consultation.sql
--   Nom de SGBD      :  ORACLE Version 7.0
--   Date de creation :  04/12/2017  18h09
-- ============================================================

-- ============================================================
-- !!!!!! VOUS DEVEZ EXECUTER CES FICHIERS AVANT:
-- !!!!!!           - base.sql
-- ============================================================

--Liste des adhérents ayant souscrit un contrat.
CREATE OR REPLACE VIEW vue_adherent_contrat
      (numero_type_de_contrat, numero_foyer, nom_foyer) AS
      SELECT souscrire.numero_type_de_contrat, souscrire.numero_foyer, nom_foyer
      FROM souscrire, foyers
      WHERE souscrire.numero_foyer = foyers.numero_foyer
      ORDER BY souscrire.numero_type_de_contrat;

--Liste des livraisons prévues au mois de décembre (tous contrats confondus)
CREATE OR REPLACE VIEW vue_livraisons_decembre
      (numero_livraison, numero_type_de_contrat, date_livraison) AS
      SELECT numero_livraison, numero_type_de_contrat, date_livraison
      FROM livraisons
      WHERE to_char(date_livraison, 'MM') = 12 AND to_char(date_livraison, 'YYYY') = to_char(SYSDATE, 'YYYY')
      ORDER BY date_livraison;

--La liste des livraisons pour lesquelles personne ne s'est inscrit.
CREATE OR REPLACE VIEW vue_livraisons_vides
      (numero_livraison, date_livraison) AS
      SELECT livraisons.numero_livraison, date_livraison
      FROM livraisons
      LEFT JOIN participer_a
      ON livraisons.numero_livraison = participer_a.numero_livraison
      WHERE numero_foyer IS NULL
      ORDER BY numero_livraison;

--Le calendrier des livraisons des contrats auxquels chaque foyer a souscrit.
CREATE OR REPLACE VIEW vue_calendrier_foyer
      (numero_foyer, nom_foyer, numero_livraison, date_livraison, numero_type_de_contrat) AS
      SELECT foyers.numero_foyer, foyers.nom_foyer, livraisons.numero_livraison, livraisons.date_livraison, livraisons.numero_type_de_contrat
      FROM livraisons, foyers, participer_a
      WHERE participer_a.numero_livraison = livraisons.numero_livraison and participer_a.numero_foyer = foyers.numero_foyer
      ORDER BY numero_foyer;
