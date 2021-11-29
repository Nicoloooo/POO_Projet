USE POO_Projet_V3

CREATE TABLE Commande(
        com_id            INT NOT NULL IDENTITY(0,1),
        com_ref           Varchar(30),
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
		pp_type Varchar(30),
		pp_gender Varchar(30),
        pp_nom      VarChar(30),
        pp_prenom   VarChar(30),
		cl_date_naissance Date,
		cl_adresse_livraison Varchar(128),
		cl_adresse_facturation Varchar(128),
		p_emb_date Date,
		p_adresse VarChar(128),
		p_sup_name VarChar(30),
		p_sup_emb_date Date,
		PRIMARY KEY (pp_id),
		com_id INT FOREIGN KEY REFERENCES Commande(com_id)
);


--------------------------------------------------------

CREATE TABLE Articles(
        ar_id       INT NOT NULL IDENTITY(0,1),
        ar_ref      Varchar(30),
        ar_name     Varchar(30),
        ar_prix_ht  Float,
        ar_taux_tva Float,
        PRIMARY KEY (ar_id),
		com_id INT FOREIGN KEY REFERENCES Commande(com_id)
);

--------------------------------------------------------

CREATE TABLE Stock(
        st_id            INT NOT NULL IDENTITY(0,1),
        st_prod_quantite Int,
        st_seuil_reap    Float,
        PRIMARY KEY (st_id),
		ar_id INT FOREIGN KEY REFERENCES Articles(ar_id)
);

--------------------------------------------------------

CREATE TABLE Paiement(
        id_paiement INT NOT NULL IDENTITY(0,1),
        pai_date    Date,
        pai_moy     Varchar(30),
        pai_sold_er Date,
		PRIMARY KEY (id_paiement),
		com_id INT FOREIGN KEY REFERENCES Commande(com_id)
);



