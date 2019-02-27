/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 13.5 		*/
/*  Created On : 24-Feb-2019 6:48:10 PM 				*/
/*  DBMS       : PostgreSQL 						*/
/* ---------------------------------------------------- */


/* Drop Tables */

DROP TABLE IF EXISTS ab_core_us.acu_account CASCADE
;

DROP TABLE IF EXISTS ab_core_us.acu_tacue CASCADE
;

DROP TABLE IF EXISTS ab_core_us.acu_tcompany CASCADE
;

DROP TABLE IF EXISTS ab_core_us.au_tlogin CASCADE
;

DROP TABLE IF EXISTS ab_core_us.au_tmembership CASCADE
;

DROP TABLE IF EXISTS ab_core_us.au_trol CASCADE
;

DROP TABLE IF EXISTS ab_core_us.au_tuser CASCADE
;

DROP TABLE IF EXISTS ab_core_us.cl_tclient CASCADE
;

DROP TABLE IF EXISTS ab_core_us.cl_tconsum CASCADE
;

DROP TABLE IF EXISTS ab_core_us.cl_treceipt CASCADE
;

/* Drop Sequences */

DROP SEQUENCE  IF EXISTS  ab_core_us.acu_account_account_account_seq  CASCADE
;

DROP SEQUENCE  IF EXISTS  ab_core_us.acu_tacue_acue_acue_seq  CASCADE
;

DROP SEQUENCE  IF EXISTS  ab_core_us.acu_taque_aque_aque_seq  CASCADE
;

DROP SEQUENCE  IF EXISTS  ab_core_us.acu_tcompany_company_company_seq  CASCADE
;

DROP SEQUENCE  IF EXISTS  ab_core_us.au_tlogin_login_login_seq  CASCADE
;

DROP SEQUENCE  IF EXISTS  ab_core_us.au_tmembership_membership_membership_seq  CASCADE
;

DROP SEQUENCE  IF EXISTS  ab_core_us.au_trol_rol_rol_seq  CASCADE
;

DROP SEQUENCE  IF EXISTS  ab_core_us.au_tuser_user_user_seq  CASCADE
;

DROP SEQUENCE  IF EXISTS  ab_core_us.cl_tclient_client_client_seq  CASCADE
;

DROP SEQUENCE  IF EXISTS  ab_core_us.cl_treceipt_receipt_receipt_seq  CASCADE
;

/* Create Tables */

CREATE TABLE ab_core_us.acu_account
(
	account_account serial NOT NULL,    -- Identificador unico de la tabla de cuenta
	account_name varchar(50) NOT NULL,    -- nombre de la cuenta
	account_desc text NOT NULL    -- decripcion del tipo de cuenta
)
;

CREATE TABLE ab_core_us.acu_tacue
(
	acue_acue serial NOT NULL,    -- Identificador unico de la tabla de acueducto.
	acue_tmeasure varchar(50) NOT NULL,    -- Unidad de medida equivalente a consumo
	acue_value varchar(50) NOT NULL,    -- Valor consumo segun Unidad de medida
	company_company integer NOT NULL
)
;

CREATE TABLE ab_core_us.acu_tcompany
(
	company_company serial NOT NULL,    -- Identificador unico de la tabla de COMPANY
	company_ident varchar(50) NOT NULL,    -- numero de identificacion de la company
	company_name varchar(50) NOT NULL,    -- nombre de la company
	account_account integer NOT NULL
)
;

CREATE TABLE ab_core_us.au_tlogin
(
	login_login serial NOT NULL,    -- Identificador unico de la tabla de logeo
	login_username varchar(50) NOT NULL,    -- nombre de usuario
	login_password varchar(50) NOT NULL,    -- password de usuario
	user_user integer NOT NULL
)
;

CREATE TABLE ab_core_us.au_tmembership
(
	membership_membership serial NOT NULL,    -- Identificador unico de la tabla de membresias
	membership_email varchar(50) NOT NULL,    -- correo de la menbresia del usuario
	membership_phone varchar(50) NOT NULL,    -- telefono asociado ala menbresia
	menbership_state varchar(50) NULL,    -- estado del usuario activo/inactivo
	user_user integer NOT NULL,
	company_company integer NOT NULL,
	rol_rol integer NOT NULL
)
;

CREATE TABLE ab_core_us.au_trol
(
	rol_rol serial NOT NULL,    -- Identificador unico de la tabla de usuario
	rol_name varchar(50) NOT NULL,    -- nombre del rol
	rol_desc text NOT NULL    -- descripcion del rol
)
;

CREATE TABLE ab_core_us.au_tuser
(
	user_user serial NOT NULL,    -- Identificador unico de la tabla de usuario
	user_ident varchar(50) NOT NULL,    -- numero de identificacion del usuario
	user_fname varchar(50) NOT NULL,    -- nombre de la persona
	user_lname varchar(50) NOT NULL    -- apellido de la persona
)
;

CREATE TABLE ab_core_us.cl_tclient
(
	client_client serial NOT NULL,    -- Identificador unico de la tabla de cliente
	client_ident varchar(50) NOT NULL,    -- numero de identificacion del cliente
	client_fname varchar(50) NOT NULL,    -- nombre de la persona cliente.
	client_lname varchar(50) NOT NULL,    -- apellido de la persona cliente.
	client_mora varchar(50) NULL,    -- saldo en mora del cliente
	client_state varchar(50) NULL,
	company_company integer NOT NULL
)
;

CREATE TABLE ab_core_us.cl_tconsum
(
	consum_consum serial NOT NULL,    -- Identificador unico de la tabla de usuario
	consum_cant varchar(50) NOT NULL,    -- cantidad de consumo segun unidad de medida.
	consum_date varchar(50) NOT NULL,    -- fecha de registro del consumo.
	consum_state varchar(50) NOT NULL,    -- estado del consumo activo/inactivo.
	client_client integer NOT NULL
)
;

CREATE TABLE ab_core_us.cl_treceipt
(
	receipt_receipt serial NOT NULL,    -- Identificador unico de la tabla de recibos
	receipt_value varchar(50) NOT NULL,    -- valor del recibo.
	receipt_date varchar(50) NOT NULL,    -- fecha de recibo
	receipt_lastc varchar(50) NULL,    -- ultima lectura de consumo en unidad de medida
	receipt_pasc varchar(50) NULL,    -- Lectura anterior de consumo segun unidad de medida.
	receipt_state varchar(50) NOT NULL,    -- estado del recibo
	client_client integer NOT NULL
)
;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE ab_core_us.acu_account ADD CONSTRAINT pk_acu_taccount
	PRIMARY KEY (account_account)
;

ALTER TABLE ab_core_us.acu_tacue ADD CONSTRAINT pk_acu_tacue
	PRIMARY KEY (acue_acue)
;

CREATE INDEX ixfk_acu_tacue_au_tcompany ON ab_core_us.acu_tacue (company_company ASC)
;

ALTER TABLE ab_core_us.acu_tcompany ADD CONSTRAINT pk_acu_tcompany
	PRIMARY KEY (company_company)
;

CREATE INDEX ixfk_acu_tcompany_acu_taccount ON ab_core_us.acu_tcompany (account_account ASC)
;

ALTER TABLE ab_core_us.au_tlogin ADD CONSTRAINT pk_au_tlogin
	PRIMARY KEY (login_login)
;

CREATE INDEX ixfk_au_tlogin_au_user ON ab_core_us.au_tlogin (user_user ASC)
;

ALTER TABLE ab_core_us.au_tmembership ADD CONSTRAINT pk_au_tmembership
	PRIMARY KEY (membership_membership)
;

CREATE INDEX ixfk_au_tmembership_acu_company ON ab_core_us.au_tmembership (company_company ASC)
;

CREATE INDEX ixfk_au_tmembership_au_trol ON ab_core_us.au_tmembership (rol_rol ASC)
;

CREATE INDEX ixfk_au_tmembership_au_user ON ab_core_us.au_tmembership (user_user ASC)
;

ALTER TABLE ab_core_us.au_trol ADD CONSTRAINT pk_au_trol
	PRIMARY KEY (rol_rol)
;

ALTER TABLE ab_core_us.au_tuser ADD CONSTRAINT pk_au_tuser
	PRIMARY KEY (user_user)
;

ALTER TABLE ab_core_us.cl_tclient ADD CONSTRAINT pk_cl_tclient
	PRIMARY KEY (client_client)
;

CREATE INDEX ixfk_cl_tclient_au_tcompany ON ab_core_us.cl_tclient (company_company ASC)
;

ALTER TABLE ab_core_us.cl_tconsum ADD CONSTRAINT PK_cl_tconsum
	PRIMARY KEY (consum_consum)
;

CREATE INDEX IXFK_cl_tconsum_cl_tclient ON ab_core_us.cl_tconsum (client_client ASC)
;

ALTER TABLE ab_core_us.cl_treceipt ADD CONSTRAINT pk_cl_treceipt
	PRIMARY KEY (receipt_receipt)
;

CREATE INDEX ixfk_cl_treceipt_cl_tclient ON ab_core_us.cl_treceipt (client_client ASC)
;

/* Create Foreign Key Constraints */

ALTER TABLE ab_core_us.acu_tacue ADD CONSTRAINT fk_acu_tacue_au_tcompany
	FOREIGN KEY (company_company) REFERENCES ab_core_us.acu_tcompany (company_company) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE ab_core_us.acu_tcompany ADD CONSTRAINT fk_acu_tcompany_acu_taccount
	FOREIGN KEY (account_account) REFERENCES ab_core_us.acu_account (account_account) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE ab_core_us.au_tlogin ADD CONSTRAINT fk_au_tlogin_au_user
	FOREIGN KEY (user_user) REFERENCES ab_core_us.au_tuser (user_user) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE ab_core_us.au_tmembership ADD CONSTRAINT fk_au_tmembership_acu_company
	FOREIGN KEY (company_company) REFERENCES ab_core_us.acu_tcompany (company_company) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE ab_core_us.au_tmembership ADD CONSTRAINT fk_au_tmembership_au_trol
	FOREIGN KEY (rol_rol) REFERENCES ab_core_us.au_trol (rol_rol) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE ab_core_us.au_tmembership ADD CONSTRAINT fk_au_tmembership_au_user
	FOREIGN KEY (user_user) REFERENCES ab_core_us.au_tuser (user_user) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE ab_core_us.cl_tclient ADD CONSTRAINT fk_cl_tclient_au_tcompany
	FOREIGN KEY (company_company) REFERENCES ab_core_us.acu_tcompany (company_company) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE ab_core_us.cl_tconsum ADD CONSTRAINT FK_cl_tconsum_cl_tclient
	FOREIGN KEY (client_client) REFERENCES ab_core_us.cl_tclient (client_client) ON DELETE No Action ON UPDATE No Action
;

/* Create Table Comments, Sequences for Autonumber Columns */

COMMENT ON TABLE ab_core_us.acu_account
	IS 'Tabla encargada de registras los datos de las cuentas.'
;

COMMENT ON COLUMN ab_core_us.acu_account.account_account
	IS 'Identificador unico de la tabla de cuenta'
;

COMMENT ON COLUMN ab_core_us.acu_account.account_name
	IS 'nombre de la cuenta'
;

COMMENT ON COLUMN ab_core_us.acu_account.account_desc
	IS 'decripcion del tipo de cuenta'
;

 

COMMENT ON TABLE ab_core_us.acu_tacue
	IS 'Tabla encargada de registras los datos del acueducto.'
;

COMMENT ON COLUMN ab_core_us.acu_tacue.acue_acue
	IS 'Identificador unico de la tabla de acueducto.'
;

COMMENT ON COLUMN ab_core_us.acu_tacue.acue_tmeasure
	IS 'Unidad de medida equivalente a consumo'
;

COMMENT ON COLUMN ab_core_us.acu_tacue.acue_value
	IS 'Valor consumo segun Unidad de medida'
;

 

COMMENT ON TABLE ab_core_us.acu_tcompany
	IS 'Tabla encargada de registras los datos de la company o asociacion.'
;

COMMENT ON COLUMN ab_core_us.acu_tcompany.company_company
	IS 'Identificador unico de la tabla de COMPANY'
;

COMMENT ON COLUMN ab_core_us.acu_tcompany.company_ident
	IS 'numero de identificacion de la company'
;

COMMENT ON COLUMN ab_core_us.acu_tcompany.company_name
	IS 'nombre de la company'
;

 

COMMENT ON TABLE ab_core_us.au_tlogin
	IS 'Tabla encargada de registras los datos de logeo de los usuarios.'
;

COMMENT ON COLUMN ab_core_us.au_tlogin.login_login
	IS 'Identificador unico de la tabla de logeo'
;

COMMENT ON COLUMN ab_core_us.au_tlogin.login_username
	IS 'nombre de usuario'
;

COMMENT ON COLUMN ab_core_us.au_tlogin.login_password
	IS 'password de usuario'
;

 

COMMENT ON TABLE ab_core_us.au_tmembership
	IS 'Tabla encargada de registras la menbresia del usuario.'
;

COMMENT ON COLUMN ab_core_us.au_tmembership.membership_membership
	IS 'Identificador unico de la tabla de membresias'
;

COMMENT ON COLUMN ab_core_us.au_tmembership.membership_email
	IS 'correo de la menbresia del usuario'
;

COMMENT ON COLUMN ab_core_us.au_tmembership.membership_phone
	IS 'telefono asociado ala menbresia'
;

COMMENT ON COLUMN ab_core_us.au_tmembership.menbership_state
	IS 'estado del usuario activo/inactivo'
;

 

COMMENT ON TABLE ab_core_us.au_trol
	IS 'Tabla encargada de registras los datos de los roles.'
;

COMMENT ON COLUMN ab_core_us.au_trol.rol_rol
	IS 'Identificador unico de la tabla de usuario'
;

COMMENT ON COLUMN ab_core_us.au_trol.rol_name
	IS 'nombre del rol'
;

COMMENT ON COLUMN ab_core_us.au_trol.rol_desc
	IS 'descripcion del rol'
;

 

COMMENT ON TABLE ab_core_us.au_tuser
	IS 'Tabla encargada de registras los datos de los usuarios.'
;

COMMENT ON COLUMN ab_core_us.au_tuser.user_user
	IS 'Identificador unico de la tabla de usuario'
;

COMMENT ON COLUMN ab_core_us.au_tuser.user_ident
	IS 'numero de identificacion del usuario'
;

COMMENT ON COLUMN ab_core_us.au_tuser.user_fname
	IS 'nombre de la persona'
;

COMMENT ON COLUMN ab_core_us.au_tuser.user_lname
	IS 'apellido de la persona'
;

 

COMMENT ON TABLE ab_core_us.cl_tclient
	IS 'Tabla encargada de registras los datos de los clientes.'
;

COMMENT ON COLUMN ab_core_us.cl_tclient.client_client
	IS 'Identificador unico de la tabla de cliente'
;

COMMENT ON COLUMN ab_core_us.cl_tclient.client_ident
	IS 'numero de identificacion del cliente'
;

COMMENT ON COLUMN ab_core_us.cl_tclient.client_fname
	IS 'nombre de la persona cliente.'
;

COMMENT ON COLUMN ab_core_us.cl_tclient.client_lname
	IS 'apellido de la persona cliente.'
;

COMMENT ON COLUMN ab_core_us.cl_tclient.client_mora
	IS 'saldo en mora del cliente'
;

 

COMMENT ON TABLE ab_core_us.cl_tconsum
	IS 'Tabla encargada de registras el consumo de los clientes'
;

COMMENT ON COLUMN ab_core_us.cl_tconsum.consum_consum
	IS 'Identificador unico de la tabla de usuario'
;

COMMENT ON COLUMN ab_core_us.cl_tconsum.consum_cant
	IS 'cantidad de consumo segun unidad de medida.'
;

COMMENT ON COLUMN ab_core_us.cl_tconsum.consum_date
	IS 'fecha de registro del consumo.'
;

COMMENT ON COLUMN ab_core_us.cl_tconsum.consum_state
	IS 'estado del consumo activo/inactivo.'
;

 

 

COMMENT ON TABLE ab_core_us.cl_treceipt
	IS 'Tabla encargada de registras los datos de los recibos creados.'
;

COMMENT ON COLUMN ab_core_us.cl_treceipt.receipt_receipt
	IS 'Identificador unico de la tabla de recibos'
;

COMMENT ON COLUMN ab_core_us.cl_treceipt.receipt_value
	IS 'valor del recibo.'
;

COMMENT ON COLUMN ab_core_us.cl_treceipt.receipt_date
	IS 'fecha de recibo'
;

COMMENT ON COLUMN ab_core_us.cl_treceipt.receipt_lastc
	IS 'ultima lectura de consumo en unidad de medida'
;

COMMENT ON COLUMN ab_core_us.cl_treceipt.receipt_pasc
	IS 'Lectura anterior de consumo segun unidad de medida.'
;

COMMENT ON COLUMN ab_core_us.cl_treceipt.receipt_state
	IS 'estado del recibo'
;

 
