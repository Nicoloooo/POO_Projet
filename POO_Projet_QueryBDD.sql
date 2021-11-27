USE POO_Projet_V1

CREATE TABLE Commande(
        com_id            INT NOT NULL IDENTITY(0,1),
        com_ref           Varchar (128) NOT NULL ,
        com_date_prevue   Date NOT NULL ,
        com_date_emission Date NOT NULL ,
        com_tot_ar        Int NOT NULL ,
        com_tot_ht        Float NOT NULL ,
        com_tot_tva       Float NOT NULL ,
        com_tot_ttc       Float NOT NULL ,
        cl_id             Int NOT NULL ,
        soc_id            Int NOT NULL ,
        ar_id             Int NOT NULL ,
        p_id              Int NOT NULL ,
        id_paiement       Int NOT NULL,
		PRIMARY KEY (com_id)
);

--------------------------------------------------------

CREATE TABLE Personnel(
        p_id       INT NOT NULL IDENTITY(0,1),
        p_nom      Char (128) NOT NULL ,
        p_prenom   Char (30) NOT NULL ,
        p_emb_date Date NOT NULL ,
		PRIMARY KEY (p_id),
		com_id INT FOREIGN KEY REFERENCES Commande(com_id)
);

-------------------------------------------------------

CREATE TABLE Superieur(
        s_id       INT NOT NULL IDENTITY(0,1),
        s_nom      Varchar (128) NOT NULL ,
        s_prenom   Varchar (128) NOT NULL ,
        s_emb_date Date NOT NULL ,
		PRIMARY KEY (s_id),
		p_id INT FOREIGN KEY REFERENCES Personnel(p_id)
);

--------------------------------------------------------

CREATE TABLE Client(
        cl_id             INT NOT NULL IDENTITY(0,1),
        cl_nom            Varchar (128) NOT NULL ,
        cl_prenom         Varchar (128) NOT NULL ,
        cl_date_naissance Date NOT NULL ,
        cl_adresse_mail   Varchar (128) NOT NULL ,
        cl_num            Int NOT NULL ,
		PRIMARY KEY (cl_id),
		com_id INT FOREIGN KEY REFERENCES Commande(com_id)
);

--------------------------------------------------------

CREATE TABLE Societe(
        soc_id          INT NOT NULL IDENTITY(0,1),
        soc_name        Varchar (128) NOT NULL ,
        soc_num_serv_cl Int NOT NULL ,
        soc_logo        Varchar (10) NOT NULL ,
		PRIMARY KEY (soc_id),
		com_id INT FOREIGN KEY REFERENCES Commande(com_id),
		cl_id INT FOREIGN KEY REFERENCES Client(cl_id)
        
);

--------------------------------------------------------

CREATE TABLE Adresse(
        id_adresse     INT NOT NULL IDENTITY(0,1),
        adresse_type   Varchar (128) NOT NULL ,
        street_name    Varchar (128) NOT NULL ,
        num_lan        Int NOT NULL ,
        residence_name Varchar (128) NOT NULL ,
        building_name  Varchar (128) NOT NULL ,
        building_floor Int NOT NULL ,
        postal_code    Int NOT NULL ,
        city           Varchar (128) NOT NULL ,
		PRIMARY KEY (id_adresse),
		cl_id INT FOREIGN KEY REFERENCES Client(cl_id),
		p_id INT FOREIGN KEY REFERENCES Personnel(p_id),
		soc_id INT FOREIGN KEY REFERENCES Societe(soc_id)
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



