#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: menbres
#------------------------------------------------------------

CREATE TABLE menbres(
        email           Varchar (200) NOT NULL ,
        MotPasse        Varchar (500) NOT NULL ,
        nom             Varchar (50) NOT NULL ,
        prenom          Varchar (100) NOT NULL ,
        staut           Int NOT NULL ,
        DateInscription Date NOT NULL ,
        PRIMARY KEY (email )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: kdi_spectacle
#------------------------------------------------------------

CREATE TABLE kdi_spectacle(
        Spe_id    int (11) Auto_increment  NOT NULL ,
        Spe_titre Varchar (50) ,
        Spe_annee Year ,
        Spe_mes   Varchar (25) ,
        PRIMARY KEY (Spe_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: noter
#------------------------------------------------------------

CREATE TABLE noter(
        email  Varchar (200) NOT NULL ,
        Spe_id Int NOT NULL ,
        Spe_note Int (1) NULL,
        PRIMARY KEY (email ,Spe_id )
)ENGINE=InnoDB;

ALTER TABLE noter ADD CONSTRAINT FK_noter_email FOREIGN KEY (email) REFERENCES menbres(email);
ALTER TABLE noter ADD CONSTRAINT FK_noter_Spe_id FOREIGN KEY (Spe_id) REFERENCES kdi_spectacle(Spe_id);
