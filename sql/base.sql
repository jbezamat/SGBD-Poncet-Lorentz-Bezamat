  -- ============================================================
--   Nom de la base   :  AMAP
--   Nom du fichier   :  base.sql
--   Nom de SGBD      :  ORACLE Version 7.0
--   Date de creation :  14/11/2017  17:40
-- ============================================================

--Format des dates de la session
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY HH24:MI';

-- ============================================================
-- ============================================================
--                           DROP
-- ============================================================
-- ============================================================

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

-- ============================================================
-- ============================================================
--                   CREATE TABLE/CREATE SEQUENCE
-- ============================================================
-- ============================================================

-- ============================================================
--   Table : Paniers
-- ============================================================

CREATE SEQUENCE numero_panier_seq
       minvalue 0
       maxvalue 999
       start with 0
       increment by 1
       cache 20;

CREATE TABLE paniers
(
        numero_panier                   NUMBER(3)              not null,
        nom_panier                      CHAR(40)               not null,
        CONSTRAINT pk_panier PRIMARY KEY (numero_panier)
);

CREATE INDEX paniers_fk1 ON paniers (nom_panier asc);

-- ============================================================
--   Table : Types de contrat
-- ============================================================

CREATE SEQUENCE numero_type_de_contrat_seq
       minvalue 0
       maxvalue 999
       start with 0
       increment by 1
       cache 20;

CREATE TABLE types_de_contrat
(
        numero_type_de_contrat                     NUMBER(3)              not null,
        nombre_foyers_max                          NUMBER(3)              not null,
        nombre_cheques                             NUMBER(3)              not null,
        montant_cheques                            NUMBER(3)              not null,
        numero_panier                              NUMBER(3)              not null,
        numero_producteur                          NUMBER(3)              not null,
        CONSTRAINT pk_type_de_contrat PRIMARY KEY (numero_type_de_contrat)        ,
        CHECK (nombre_foyers_max >= 1)                                            ,
        CHECK (nombre_cheques >= 1)                                               ,
        CHECK (montant_cheques >= 1)
);


-- ============================================================
--   Table : Livraisons
-- ============================================================

CREATE SEQUENCE numero_livraison_seq
       minvalue 0
       maxvalue 999
       start with 0
       increment by 1
       cache 20;

CREATE TABLE livraisons
(
        numero_livraison                           NUMBER(3)              not null,
        date_livraison                             DATE                   not null,
        numero_type_de_contrat                     NUMBER(3)              not null,
        CONSTRAINT pk_livraison PRIMARY KEY (numero_livraison)
);

CREATE INDEX livraisons_fk1 ON livraisons (date_livraison asc);

-- ============================================================
--   Table : Participer à
-- ============================================================

CREATE TABLE participer_a
(
        numero_livraison                           NUMBER(3)                      ,
        numero_foyer                               NUMBER(3)              not null,
        CONSTRAINT pk_participer_a PRIMARY KEY (numero_livraison, numero_foyer)
);

-- ============================================================
--   Table : Foyers
-- ============================================================

CREATE SEQUENCE numero_foyer_seq
       minvalue 0
       maxvalue 999
       start with 0
       increment by 1
       cache 20;

CREATE TABLE foyers
(
        numero_foyer                               NUMBER(3)              not null,
        nom_foyer                                  CHAR(40)               not null,
        CONSTRAINT pk_foyers PRIMARY KEY (numero_foyer)
);

-- ============================================================
--   Table : Appartenir à
-- ============================================================

CREATE TABLE appartenir_a
(
        numero_foyer                               NUMBER(3)              not null,
        numero_personne                            NUMBER(3)              not null,
        CONSTRAINT pk_appartenir_a PRIMARY KEY (numero_foyer, numero_personne)
);

-- ============================================================
--   Table : Souscrire
-- ============================================================

CREATE TABLE souscrire
(
        numero_type_de_contrat                     NUMBER(3)              not null,
        numero_foyer                               NUMBER(3)              not null,
        CONSTRAINT pk_souscrire PRIMARY KEY (numero_type_de_contrat, numero_foyer)
);

-- ============================================================
--   Table : Personnes
-- ============================================================

CREATE SEQUENCE numero_personne_seq
       minvalue 0
       maxvalue 999
       start with 0
       increment by 1
       cache 20;

CREATE TABLE personnes
(
        numero_personne                            NUMBER(3)              not null,
        nom                                        CHAR(40)               not null,
        prenom                                     CHAR(20)               not null,
        telephone                                  CHAR(14)                       ,
        mail                                       CHAR(40)                       ,
        CONSTRAINT pk_personne PRIMARY KEY (numero_personne)                      ,
        CHECK (telephone IS not null OR mail IS not null)
);

-- ============================================================
--   Table : Producteurs
-- ============================================================

CREATE SEQUENCE numero_producteur_seq
       minvalue 0
       maxvalue 999
       start with 0
       increment by 1
       cache 20;

CREATE TABLE producteurs
(
        numero_producteur                          NUMBER(3)              not null,
        adresse                                    CHAR(40)               not null,
        ordre                                      CHAR(40)               not null,
        numero_personne                            NUMBER(3)              not null,
        CONSTRAINT pk_producteur PRIMARY KEY (numero_producteur)
);


-- ============================================================
-- ============================================================
--                      ALTER TABLE
-- ============================================================
-- ============================================================

ALTER TABLE types_de_contrat
    ADD CONSTRAINT fk1_types_de_contrat FOREIGN KEY (numero_panier)
       REFERENCES paniers (numero_panier);

ALTER TABLE livraisons
    ADD CONSTRAINT fk1_livraisons FOREIGN KEY (numero_type_de_contrat)
       REFERENCES types_de_contrat (numero_type_de_contrat);

ALTER TABLE types_de_contrat
    ADD CONSTRAINT fk2_types_de_contrat FOREIGN KEY (numero_producteur)
       REFERENCES producteurs (numero_producteur);

ALTER TABLE participer_a
    ADD CONSTRAINT fk1_participer_a FOREIGN KEY (numero_livraison)
       REFERENCES livraisons (numero_livraison);

ALTER TABLE participer_a
    ADD CONSTRAINT fk2_participer_a FOREIGN KEY (numero_foyer)
       REFERENCES  foyers (numero_foyer);

ALTER TABLE appartenir_a
    ADD CONSTRAINT fk1_appartenir_a FOREIGN KEY (numero_foyer)
       REFERENCES foyers (numero_foyer);

ALTER TABLE appartenir_a
    ADD CONSTRAINT fk2_appartenir_a FOREIGN KEY (numero_personne)
       REFERENCES  personnes (numero_personne);

ALTER TABLE souscrire
    ADD CONSTRAINT fk1_souscrire FOREIGN KEY (numero_type_de_contrat)
       REFERENCES types_de_contrat (numero_type_de_contrat);

ALTER TABLE souscrire
    ADD CONSTRAINT fk2_souscrire FOREIGN KEY (numero_foyer)
       REFERENCES  foyers (numero_foyer);

ALTER TABLE producteurs
    ADD CONSTRAINT fk1_producteurs FOREIGN KEY (numero_personne)
       REFERENCES  personnes (numero_personne);


COMMIT;
