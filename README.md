**PROJET SGBD : AMAP**
=======================
*2ème année école d'ingénieur ENSEIRB-MATMECA*
=======================

Fait par
=======================
Poncet Clémence
Lorentz Charles
Bezamat Jérémy

*Partie base de données*
=======================

Description des fichiers
=======================

Création de la base:
-----------------------
  1. base.sql : Permet de créer les tables de la base de données.
  2. donnees.sql : Permet de remplir la base avec des données par défauts.
  3. supprimer_base.sql : Permet de supprimer toutes les tables de la base, les triggers, les procédures et les types.

Les procédures, les triggers et les fonctions:
-----------------------
  1. fonctions.sql : Permet de créer les fonctions sur la base.
  2. procedures.sql : Permet de créer les procédures sur la base.
  3. execute_procedures.sql : Permet d'éxécuter les différentes procédures présentes dans procedures.sql.
  4. triggers.sql : Permet de créer les triggers qui garantissent l'intégrité de la base de données.

Les vues:
-----------------------
  1. vues.sql : Permet de créer différentes vues sur la base de données qui servent notamment pour des procédures, des triggers ou d'autres vues.
  2. vues_consultation.sql: Permet de créer les vues de consultation demandées par le sujet.
  3. vues_statistiques.sql: Permet de créer les vues des statistiques demandées par le sujet.


Les starts:
-----------------------
  1. start.sql : Permet d'initialiser la base, les vues, les triggers, et les procédures.
  2. start_default.sql : Même chose que pour start.sql mais en ajoutant les données de donnees.sql dans la base.
  3. start_tests_checks.sql: Permet de démarer les tests sur les checks.
  4. start_tests_fonctions.sql: Permet de démarer les tests sur les fonctions.
  5. start_tests_procedures.sql: Permet de démarer les tests sur les procédures.
  6. start_tests_triggers.sql: Permet de démarer les tests sur les triggers.


Les affichages:
-----------------------
  1. aff_vues_c: Permet d'afficher les différentes vues présentes dans vues_consultation.sql.
  2. aff_vues_s: Permet d'afficher les différentes vues présentes dans vues_statistiques.sql.
  3. affichage.sql: Permet d'afficher les différentes tables de la base.

Les tests:
-----------------------
  1. tests_checks.sql : Contient les tests concernant les checks.
  2. tests_fonctions.sql: t Contient les tests concernant les fonctions.
  3. tests_procedures.sql : Contient les tests concernant les procédures.
  4. tests_triggers.sql : Contient les tests concernant les triggers.



Initialisation de la base **ATENTION LES COMMANDES SUIVANTES REINITIALISENT LA BASE**
=======================

Initialisation de la base de données:
-----------------------

Pour initialiser la base de données, il suffit de faire:
    * @start


Initialisation de la base de données avec des données par défaut et affichage de toutes les tables:
-----------------------

Pour initialiser la base de données, il suffit de faire:
    * @start_default


Affichage vues **ATENTION LES COMMANDES SUIVANTES REINITIALISENT LA BASE**
=======================

Pour afficher les vues de vues_consultation, vous devez exécuter:
    * @aff_vues_c

Pour afficher les vues de vues_statistiques, vous devez exécuter:
    * @aff_vues_s


Tests **ATENTION LES COMMANDES SUIVANTES REINITIALISENT LA BASE**
=======================

Pour tester le bon fonctionnement des checks, vous devez exécuter:
    * @start_tests_checks

Pour tester le bon fonctionnement des fonctions, il faut éxécuter:
    * @start_tests_fonctions

Pour tester le bon fonctionnement des procédures, il faut éxécuter:
    * @start_tests_procedures
    * @execute_procedures

Pour tester le bon fonctionnement des triggers, vous devez exécuter:
    * @start_tests_triggers

*Partie interface web*
=======================
Les différentes interfaces qui permettent les liaisons entre les demandes brutes des clients et des fournisseurs et la base SQL sont à l'adresse suivante:
http://clorentz.vvvpedago.enseirb-matmeca.fr/SGBD/index.php
