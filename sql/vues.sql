-- ============================================================
--   Nom de la base   :  AMAP
--   Nom du fichier   :  testTrigger.sql
--   Nom de SGBD      :  ORACLE Version 7.0
--   Date de creation :  21/11/2017  11h30
-- ============================================================

-- ============================================================
-- !!!!!! VOUS DEVEZ EXECUTER CES FICHIERS AVANT:
-- !!!!!!           - base.sql
-- ============================================================

CREATE OR REPLACE VIEW vue_producteurs
      (numero_personne, numero_producteur, nom, prenom, telephone, mail, adresse, ordre) AS
      SELECT personnes.numero_personne, numero_producteur, nom, prenom, telephone, mail, adresse, ordre
      from personnes, producteurs
      where producteurs.numero_personne = personnes.numero_personne;

CREATE OR REPLACE VIEW vue_foyers
      (numero_foyer, nom_foyer, numero_personne, nom, prenom) AS
      SELECT foyers.numero_foyer, nom_foyer, personnes.numero_personne, nom, prenom
      from personnes, foyers, appartenir_a
      where personnes.numero_personne = appartenir_a.numero_personne and foyers.numero_foyer = appartenir_a.numero_foyer;

CREATE OR REPLACE VIEW vue_souscrire
      (numero_type_de_contrat, numero_foyer, nom_foyer)  AS
      SELECT numero_type_de_contrat, souscrire.numero_foyer, nom_foyer
      from souscrire, foyers
      where souscrire.numero_foyer = foyers.numero_foyer;


CREATE OR REPLACE VIEW vue_paniers
      (numero_panier, nom_panier, numero_type_de_contrat)  AS
      SELECT paniers.numero_panier, nom_panier, numero_type_de_contrat
      from paniers, types_de_contrat
      where paniers.numero_panier = types_de_contrat.numero_panier;

--Pour afficher les contrats avec le nombre de livraisons
CREATE OR REPLACE VIEW vue_contrat_livraisons
      (numero_type_de_contrat, nombre_livraisons) AS
      SELECT types_de_contrat.numero_type_de_contrat, COUNT(livraisons.date_livraison)
      FROM types_de_contrat
      LEFT JOIN livraisons
      ON types_de_contrat.numero_type_de_contrat = livraisons.numero_type_de_contrat
      GROUP BY types_de_contrat.numero_type_de_contrat
      ORDER BY numero_type_de_contrat asc;

--Pour procedure_livraison_un_foyer
CREATE OR REPLACE VIEW vue_livraisons_j_moins_1
      (numero_livraison, date_livraison, numero_foyer) AS
      SELECT livraisons.numero_livraison, date_livraison, numero_foyer
      FROM livraisons
      LEFT JOIN participer_a
      ON livraisons.numero_livraison = participer_a.numero_livraison
      WHERE date_livraison > SYSDATE AND date_livraison-1 < SYSDATE;

--Pour procedure_livraison_type_contrat
CREATE OR REPLACE VIEW vue_livraison_type_contrat
      (numero_type_de_contrat, numero_livraison, date_livraison) AS
      SELECT types_de_contrat.numero_type_de_contrat, livraisons.numero_livraison, livraisons.date_livraison
      FROM types_de_contrat
      LEFT JOIN livraisons
      ON types_de_contrat.numero_type_de_contrat = livraisons.numero_type_de_contrat;

--Pour afficher un type de contrat sans son numéro pour les producteurs
CREATE OR REPLACE VIEW vue_type_de_contrat
      (nombre_foyers_max, nombre_cheques, montant_cheques, numero_panier, numero_producteur) AS
      SELECT nombre_foyers_max, nombre_cheques, montant_cheques, numero_panier, numero_producteur
      FROM types_de_contrat;
