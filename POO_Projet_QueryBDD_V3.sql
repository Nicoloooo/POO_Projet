USE POO_Projet_V3

CREATE TABLE Commande(
        com_id            INT NOT NULL IDENTITY(0,1),
        com_ref           Varchar,
        com_date_prevue   Date,
        com_date_emission Date,
        com_tot_ar        Int,
        com_tot_ht        Float,
        com_tot_tva       Float,
        com_tot_ttc       Float,
        id_paiement       Int,
		PRIMARY KEY (com_id)
);

--------------------------------------------------------

CREATE TABLE People(
        pp_id       INT NOT NULL IDENTITY(0,1),
		pp_type Varchar,
		pp_gender Varchar,
        pp_nom      VarChar,
        pp_prenom   VarChar,
		cl_date_naissance Date,
		cl_adresse_livraison Varchar,
		cl_adresse_facturation Varchar,
		p_emb_date Date,
		p_adresse VarChar,
		p_sup_name VarChar,
		p_sup_emb_date Date,
		PRIMARY KEY (pp_id),
		com_id INT FOREIGN KEY REFERENCES Commande(com_id)
);


--------------------------------------------------------

CREATE TABLE Articles(
        ar_id       INT NOT NULL IDENTITY(0,1),
        ar_ref      Varchar (128) NOT NULL ,
        ar_name     Varchar (128) NOT NULL ,
        ar_prix_ht  Float NOT NULL ,
        ar_taux_tva Float NOT NULL ,
        PRIMARY KEY (ar_id),
		com_id INT FOREIGN KEY REFERENCES Commande(com_id)
);

--------------------------------------------------------

CREATE TABLE Stock(
        st_id            INT NOT NULL IDENTITY(0,1),
        st_prod_quantite Int NOT NULL ,
        st_seuil_reap    Float NOT NULL ,
        PRIMARY KEY (st_id),
		ar_id INT FOREIGN KEY REFERENCES Articles(ar_id)
);

--------------------------------------------------------

CREATE TABLE Paiement(
        id_paiement INT NOT NULL IDENTITY(0,1),
        pai_date    Date NOT NULL ,
        pai_moy     Varchar (128) NOT NULL ,
        pai_sold_er Date NOT NULL,
		PRIMARY KEY (id_paiement),
		com_id INT FOREIGN KEY REFERENCES Commande(com_id)
);



