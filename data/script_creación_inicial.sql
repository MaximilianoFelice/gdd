USE GD1C2015

-- CREANDO ESQUEMA
BEGIN TRANSACTION

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'BOBBY_TABLES')
EXEC sys.sp_executesql N'CREATE SCHEMA [BOBBY_TABLES] AUTHORIZATION [gd]'

COMMIT

-- DROP DE TABLAS
IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('BOBBY_TABLES.DEPOSITOS') AND OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE BOBBY_TABLES.DEPOSITOS

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('BOBBY_TABLES.FACTURAS') AND OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE BOBBY_TABLES.FACTURAS

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('BOBBY_TABLES.FUNCIONALIDADES_POR_ROL') AND OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE BOBBY_TABLES.FUNCIONALIDADES_POR_ROL

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('BOBBY_TABLES.FUNCIONALIDADES') AND OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE BOBBY_TABLES.FUNCIONALIDADES

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('BOBBY_TABLES.INTENTOS_LOGIN') AND OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE BOBBY_TABLES.INTENTOS_LOGIN

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('BOBBY_TABLES.RETIROS_EFECTIVO') AND OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE BOBBY_TABLES.RETIROS_EFECTIVO

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('BOBBY_TABLES.ROLES_POR_USUARIO') AND OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE BOBBY_TABLES.ROLES_POR_USUARIO

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('BOBBY_TABLES.TARJETAS') AND OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE BOBBY_TABLES.TARJETAS

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('BOBBY_TABLES.TRANSFERENCIAS') AND OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE BOBBY_TABLES.TRANSFERENCIAS

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('BOBBY_TABLES.PERSONAS') AND OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE BOBBY_TABLES.PERSONAS

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('BOBBY_TABLES.CHEQUES') AND OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE BOBBY_TABLES.CHEQUES

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('BOBBY_TABLES.BANCOS') AND OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE BOBBY_TABLES.BANCOS

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('BOBBY_TABLES.EMISORES') AND OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE BOBBY_TABLES.EMISORES

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('BOBBY_TABLES.OPERACIONES') AND OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE BOBBY_TABLES.OPERACIONES

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('BOBBY_TABLES.ROLES') AND OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE BOBBY_TABLES.ROLES

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('BOBBY_TABLES.TIPOS_DOCUMENTO') AND OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE BOBBY_TABLES.TIPOS_DOCUMENTO

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('BOBBY_TABLES.CUENTAS') AND OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE BOBBY_TABLES.CUENTAS

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('BOBBY_TABLES.ESTADOS_CUENTA') AND OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE BOBBY_TABLES.ESTADOS_CUENTA

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('BOBBY_TABLES.USUARIOS') AND OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE BOBBY_TABLES.USUARIOS

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('BOBBY_TABLES.TIPOS_CUENTA') AND OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE BOBBY_TABLES.TIPOS_CUENTA

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('BOBBY_TABLES.MONEDAS') AND OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE BOBBY_TABLES.MONEDAS

IF EXISTS(SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('BOBBY_TABLES.PAISES') AND OBJECTPROPERTY(id, 'IsUserTable') = 1)
DROP TABLE BOBBY_TABLES.PAISES

----------------------------------------
----------- CREANDO TABLAS -------------
-- LOGIN Y USUARIO

CREATE TABLE BOBBY_TABLES.FUNCIONALIDADES_POR_ROL(
	FUNCIONALIDAD INT NOT NULL,
	ROL INT NOT NULL
)

CREATE TABLE BOBBY_TABLES.FUNCIONALIDADES(
	FUN_ID INT PRIMARY KEY,
	NOMBRE VARCHAR(120)
)

CREATE TABLE BOBBY_TABLES.ROLES(
	ROL_ID INT IDENTITY(1,1) PRIMARY KEY,
	NOMBRE VARCHAR(50),
	ESTADO BIT DEFAULT 1
)

CREATE TABLE BOBBY_TABLES.INTENTOS_LOGIN(
	INT_ID INT IDENTITY(1,1) PRIMARY KEY,
	USUARIO INT,
	FECHA DATE,
	ACCESO BIT -- 1 ES CORRECTO
)

CREATE TABLE BOBBY_TABLES.PAISES(
	PAI_ID INT IDENTITY(1,1) PRIMARY KEY,
	NOMBRE VARCHAR(250)
)

CREATE TABLE BOBBY_TABLES.ROLES_POR_USUARIO(
	ROL INT NOT NULL,
	USUARIO INT NOT NULL
)

CREATE TABLE BOBBY_TABLES.TIPOS_DOCUMENTO( --NO EST� EN EL DER
	TIP_ID INT PRIMARY KEY,
	NOMBRE VARCHAR(20)
)

CREATE TABLE BOBBY_TABLES.USUARIOS(
	USU_ID INT IDENTITY(1,1) PRIMARY KEY,
	USERNAME VARCHAR(40) NOT NULL UNIQUE,
	PASSWORD VARBINARY(32) NOT NULL,
	ESTADO BIT DEFAULT 1,
	FECHA_ALTA DATE, --TODO FALTA EN EL DER
	FECHA_MODIFICACION DATE, --TODO FALTA EN EL DER
	INTENTOS_FALLIDOS SMALLINT DEFAULT 0, --RESETEAR CUANDO INGRESA
	PREGUNTA_SECRETA VARCHAR(100),
	RESPUESTA VARBINARY(32)
)

CREATE TABLE BOBBY_TABLES.PERSONAS(
	PER_ID INT IDENTITY(1,1) PRIMARY KEY,
	TIPO_DOC INT,
	NUMERO_DOC NUMERIC(10,0),
	NOMBRE VARCHAR(255),
	APELLIDO VARCHAR(255),
	PAIS INT,
	CALLE VARCHAR(255),
	NUMERO_DOM NUMERIC(5,0),
	PISO INT,
	DEPTO VARCHAR(10), --SIGUIENDO EL ESQUEMA DE LA MAESTRA
	LOCALIDAD VARCHAR(60),
	NACIONALIDAD INT,
	FECHA_NACIMIENTO DATE,
	MAIL VARCHAR(255),
	USUARIO INT	
)

-- CUENTAS Y TARJETAS

CREATE TABLE BOBBY_TABLES.MONEDAS(
	MON_ID INT IDENTITY(1,1) PRIMARY KEY,
	NOMBRE VARCHAR(30)
)

CREATE TABLE BOBBY_TABLES.EMISORES(
	EMI_ID INT IDENTITY(1,1) PRIMARY KEY,
	NOMBRE VARCHAR(60)
)

CREATE TABLE BOBBY_TABLES.TIPOS_CUENTA(
	TIP_ID INT IDENTITY(1,1) PRIMARY KEY,
	NOMBRE VARCHAR(9), --ORO/PLATA/BRONCE/GRATUITA
	COSTO_MANTENIMIENTO FLOAT,
	COSTO_TRANSACCION FLOAT
)

CREATE TABLE BOBBY_TABLES.ESTADOS_CUENTA(
	EST_ID INT IDENTITY(1,1) PRIMARY KEY,
	NOMBRE VARCHAR(30),
)

CREATE TABLE BOBBY_TABLES.CUENTAS(
	CUE_ID NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY,
	USUARIO INT,
	PAIS INT,
	MONEDA INT,
	TIPO INT,
	FECHA_ALTA DATE,
	FECHA_EXPIRACION DATE,
	ESTADO INT,
	SALDO FLOAT DEFAULT 0,
	FECHA_CIERRE DATE --SOLO PARA LAS CUENTAS CERRADAS
)

CREATE TABLE BOBBY_TABLES.TARJETAS(
	TAR_ID INT IDENTITY(1,1) PRIMARY KEY,
	USUARIO INT,
	ENCRIPTADO VARBINARY(20),
	LIMPIO NUMERIC(4,0),
	COD_SEGURIDAD VARBINARY(20),
	EMISOR INT,
	FECHA_EMISION DATE,
	FECHA_VENCIMIENTO DATE,
)

-- OPERACIONES
CREATE TABLE BOBBY_TABLES.CHEQUES(
	CHE_ID INT IDENTITY(1,1) PRIMARY KEY,
	NUMERO INT,
	BANCO INT
)

CREATE TABLE BOBBY_TABLES.BANCOS(
	BAN_ID INT IDENTITY(1,1) PRIMARY KEY,
	NOMBRE VARCHAR(50),
	DIRECCION VARCHAR(150)
)

CREATE TABLE BOBBY_TABLES.DEPOSITOS(
	DEP_ID NUMERIC(18,0) PRIMARY KEY,
	TARJETA INT
)

CREATE TABLE BOBBY_TABLES.RETIROS_EFECTIVO(
	RET_ID NUMERIC(18,0) PRIMARY KEY,
	CHEQUE INT
)

CREATE TABLE BOBBY_TABLES.TRANSFERENCIAS(
	TRA_ID NUMERIC(18,0) PRIMARY KEY,
	CUENTA_DESTINO NUMERIC(18,0),
	COSTO FLOAT
)

CREATE TABLE BOBBY_TABLES.OPERACIONES(
	OPE_ID NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY,
	CUENTA NUMERIC(18,0),
	MONEDA INT,
	FECHA DATE,
	IMPORTE FLOAT
)

CREATE TABLE BOBBY_TABLES.FACTURAS(
	FAC_ID NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY,
	DESCRIPCION VARCHAR(150), --NO EST� EN EL DER
	OPERACION NUMERIC(18,0),
	FECHA DATE,
	PAGADO BIT DEFAULT 0
)

--ALTER(S) DE TABLAS

--PK Y FK DE ROL EN FUNCIONALIDADES_POR_ROL
ALTER TABLE BOBBY_TABLES.FUNCIONALIDADES_POR_ROL ADD CONSTRAINT FUN_ROL_PK
PRIMARY KEY (FUNCIONALIDAD, ROL)

ALTER TABLE BOBBY_TABLES.FUNCIONALIDADES_POR_ROL ADD CONSTRAINT FUN_ROL_FK
FOREIGN KEY (ROL) REFERENCES BOBBY_TABLES.ROLES

--FK DE USUARIO EN INTENTOS_LOGIN
ALTER TABLE BOBBY_TABLES.INTENTOS_LOGIN ADD CONSTRAINT INT_USU_FK
FOREIGN KEY (USUARIO) REFERENCES BOBBY_TABLES.USUARIOS

--PK Y FKS EN ROLES_POR_USUARIO
ALTER TABLE BOBBY_TABLES.ROLES_POR_USUARIO ADD CONSTRAINT ROL_PK
PRIMARY KEY (ROL, USUARIO)

ALTER TABLE BOBBY_TABLES.ROLES_POR_USUARIO ADD CONSTRAINT ROL_USU_FK
FOREIGN KEY (USUARIO) REFERENCES BOBBY_TABLES.USUARIOS

ALTER TABLE BOBBY_TABLES.ROLES_POR_USUARIO ADD CONSTRAINT ROL_ROL_FK
FOREIGN KEY (ROL) REFERENCES BOBBY_TABLES.ROLES

--FKS EN PERSONAS
ALTER TABLE BOBBY_TABLES.PERSONAS ADD CONSTRAINT PER_USU_FK
FOREIGN KEY (USUARIO) REFERENCES BOBBY_TABLES.USUARIOS

ALTER TABLE BOBBY_TABLES.PERSONAS ADD CONSTRAINT PER_TIP_DOC_FK
FOREIGN KEY (TIPO_DOC) REFERENCES BOBBY_TABLES.TIPOS_DOCUMENTO

ALTER TABLE BOBBY_TABLES.PERSONAS ADD CONSTRAINT PER_PAI_FK
FOREIGN KEY (PAIS) REFERENCES BOBBY_TABLES.PAISES

ALTER TABLE BOBBY_TABLES.PERSONAS ADD CONSTRAINT PER_NAC_FK
FOREIGN KEY (NACIONALIDAD) REFERENCES BOBBY_TABLES.PAISES

--FKS EN CUENTAS
ALTER TABLE BOBBY_TABLES.CUENTAS ADD CONSTRAINT CUE_USU_FK
FOREIGN KEY (USUARIO) REFERENCES BOBBY_TABLES.USUARIOS

ALTER TABLE BOBBY_TABLES.CUENTAS ADD CONSTRAINT CUE_PAI_FK
FOREIGN KEY (PAIS) REFERENCES BOBBY_TABLES.PAISES

ALTER TABLE BOBBY_TABLES.CUENTAS ADD CONSTRAINT CUE_MON_FK
FOREIGN KEY (MONEDA) REFERENCES BOBBY_TABLES.MONEDAS

ALTER TABLE BOBBY_TABLES.CUENTAS ADD CONSTRAINT CUE_TIP_FK
FOREIGN KEY (TIPO) REFERENCES BOBBY_TABLES.TIPOS_CUENTA

ALTER TABLE BOBBY_TABLES.CUENTAS ADD CONSTRAINT CUE_EST_FK
FOREIGN KEY (ESTADO) REFERENCES BOBBY_TABLES.ESTADOS_CUENTA

--FKS EN TARJETAS
ALTER TABLE BOBBY_TABLES.TARJETAS ADD CONSTRAINT TAR_PER_FK
FOREIGN KEY (USUARIO) REFERENCES BOBBY_TABLES.USUARIOS

ALTER TABLE BOBBY_TABLES.TARJETAS ADD CONSTRAINT TAR_EMI_FK
FOREIGN KEY (EMISOR) REFERENCES BOBBY_TABLES.EMISORES

--FK BANCO EN CHEQUES
ALTER TABLE BOBBY_TABLES.CHEQUES ADD CONSTRAINT CHE_BAN_FK
FOREIGN KEY (BANCO) REFERENCES BOBBY_TABLES.BANCOS

--FK TARJETA EN DEPOSITOS
ALTER TABLE BOBBY_TABLES.DEPOSITOS ADD CONSTRAINT DEP_TAR_FK
FOREIGN KEY (TARJETA) REFERENCES BOBBY_TABLES.TARJETAS
--FK OPERACION EN DEPOSITOS (PERMITE HERENCIA)
ALTER TABLE BOBBY_TABLES.DEPOSITOS ADD CONSTRAINT DEP_OPE_FK
FOREIGN KEY (DEP_ID) REFERENCES BOBBY_TABLES.OPERACIONES

--FK CHEQUE EN RETIROS_EFECTIVO
ALTER TABLE BOBBY_TABLES.RETIROS_EFECTIVO ADD CONSTRAINT RET_CHE_FK
FOREIGN KEY (CHEQUE) REFERENCES BOBBY_TABLES.CHEQUES
--FK OPERACION EN RETIROS_EFECTIVO (PERMITE HERENCIA)
ALTER TABLE BOBBY_TABLES.RETIROS_EFECTIVO ADD CONSTRAINT RET_OPE_FK
FOREIGN KEY (RET_ID) REFERENCES BOBBY_TABLES.OPERACIONES

--FK CUENTA EN TRANSFERENCIAS
ALTER TABLE BOBBY_TABLES.TRANSFERENCIAS ADD CONSTRAINT TRA_CUE_FK
FOREIGN KEY (CUENTA_DESTINO) REFERENCES BOBBY_TABLES.CUENTAS
--FK OPERACION EN TRANSFERENCIAS (PERMITE HERENCIA)
ALTER TABLE BOBBY_TABLES.TRANSFERENCIAS ADD CONSTRAINT TRA_OPE_FK
FOREIGN KEY (TRA_ID) REFERENCES BOBBY_TABLES.OPERACIONES

--FKS EN OPERACIONES
ALTER TABLE BOBBY_TABLES.OPERACIONES ADD CONSTRAINT OPE_MON_FK
FOREIGN KEY (MONEDA) REFERENCES BOBBY_TABLES.MONEDAS

ALTER TABLE BOBBY_TABLES.OPERACIONES ADD CONSTRAINT OPE_CUE_FK
FOREIGN KEY (CUENTA) REFERENCES BOBBY_TABLES.CUENTAS

--FK OPERACION EN FACTURAS
ALTER TABLE BOBBY_TABLES.FACTURAS ADD CONSTRAINT FAC_OPE_FK
FOREIGN KEY (OPERACION) REFERENCES BOBBY_TABLES.OPERACIONES

--INSERTANDO DATOS EN LAS TABLAS (MIGRACI�N)

--AGREGANDO PA�SES EXISTENTES DE LA TABLA MAESTRA
SET IDENTITY_INSERT BOBBY_TABLES.PAISES ON

INSERT INTO BOBBY_TABLES.PAISES(PAI_ID, NOMBRE)
SELECT DISTINCT Cli_Pais_Codigo, Cli_Pais_Desc FROM gd_esquema.Maestra
UNION
SELECT DISTINCT Cuenta_Pais_Codigo, Cuenta_Pais_Desc FROM gd_esquema.Maestra
UNION
SELECT DISTINCT Cuenta_Dest_Pais_Codigo, Cuenta_Dest_Pais_Desc FROM gd_esquema.Maestra
WHERE Cuenta_Dest_Pais_Codigo IS NOT NULL
ORDER BY Cli_Pais_Codigo;

SET IDENTITY_INSERT BOBBY_TABLES.PAISES OFF

--AGREGANDO ROLES PREDEFINIDOS
INSERT INTO BOBBY_TABLES.ROLES
VALUES('Administrador', 1)
INSERT INTO BOBBY_TABLES.ROLES
VALUES('Cliente', 1)

--AGREGANDO FUNCIONALIDADES
INSERT INTO BOBBY_TABLES.FUNCIONALIDADES
VALUES(1, 'ABM de Rol')
INSERT INTO BOBBY_TABLES.FUNCIONALIDADES
VALUES(2, 'Login y Seguridad')
INSERT INTO BOBBY_TABLES.FUNCIONALIDADES
VALUES(3, 'ABM de Usuario')
INSERT INTO BOBBY_TABLES.FUNCIONALIDADES
VALUES(4, 'ABM de Cliente')
INSERT INTO BOBBY_TABLES.FUNCIONALIDADES
VALUES(5, 'ABM de Cuenta')
INSERT INTO BOBBY_TABLES.FUNCIONALIDADES
VALUES(6, 'Dep�sitos')
INSERT INTO BOBBY_TABLES.FUNCIONALIDADES
VALUES(7, 'Retiro de Efectivo')
INSERT INTO BOBBY_TABLES.FUNCIONALIDADES
VALUES(8, 'Transferencia entre Cuentas')
INSERT INTO BOBBY_TABLES.FUNCIONALIDADES
VALUES(9, 'Facturaci�n de Costos')
INSERT INTO BOBBY_TABLES.FUNCIONALIDADES
VALUES(10, 'Consulta de Saldos')
INSERT INTO BOBBY_TABLES.FUNCIONALIDADES
VALUES(11, 'Listado Estad�stico')

--AGREGANDO FUNCIONALIDADES POR ROL
INSERT INTO BOBBY_TABLES.FUNCIONALIDADES_POR_ROL
VALUES(1, 1)
INSERT INTO BOBBY_TABLES.FUNCIONALIDADES_POR_ROL
VALUES(2, 1)
INSERT INTO BOBBY_TABLES.FUNCIONALIDADES_POR_ROL
VALUES(3, 1)
INSERT INTO BOBBY_TABLES.FUNCIONALIDADES_POR_ROL
VALUES(4, 1)
INSERT INTO BOBBY_TABLES.FUNCIONALIDADES_POR_ROL
VALUES(5, 1)
INSERT INTO BOBBY_TABLES.FUNCIONALIDADES_POR_ROL
VALUES(6, 1)
INSERT INTO BOBBY_TABLES.FUNCIONALIDADES_POR_ROL
VALUES(7, 1)
INSERT INTO BOBBY_TABLES.FUNCIONALIDADES_POR_ROL
VALUES(8, 1)
INSERT INTO BOBBY_TABLES.FUNCIONALIDADES_POR_ROL
VALUES(9, 1)
INSERT INTO BOBBY_TABLES.FUNCIONALIDADES_POR_ROL
VALUES(10, 1)
INSERT INTO BOBBY_TABLES.FUNCIONALIDADES_POR_ROL
VALUES(11, 1)

--AGREGANDO LA �NICA MOENDA EXISTENTE POR AHORA
INSERT INTO BOBBY_TABLES.MONEDAS
VALUES('D�lar EE UU')

--AGREGANDO LOS ESTADOS DE CUENTA MANUALMENTE YA QUE NO HAY CARGADOS
INSERT INTO BOBBY_TABLES.ESTADOS_CUENTA
VALUES('Habilitada')
INSERT INTO BOBBY_TABLES.ESTADOS_CUENTA
VALUES('Deshabilitada')
INSERT INTO BOBBY_TABLES.ESTADOS_CUENTA
VALUES('Pendiente de activaci�n')
INSERT INTO BOBBY_TABLES.ESTADOS_CUENTA
VALUES('Cerrada')

--AGREGANDO TIPOS DE CUENTA FIJOS CON UN COSTO HARDCODEADO
INSERT INTO BOBBY_TABLES.TIPOS_CUENTA
VALUES('Gratuita', 0, 100)
INSERT INTO BOBBY_TABLES.TIPOS_CUENTA
VALUES('Bronce', 10, 50)
INSERT INTO BOBBY_TABLES.TIPOS_CUENTA
VALUES('Plata', 20, 15)
INSERT INTO BOBBY_TABLES.TIPOS_CUENTA
VALUES('Oro', 30, 0)

--AGREGANDO EMISORES EXISTENTES CON IDENTITY
INSERT INTO BOBBY_TABLES.EMISORES
SELECT DISTINCT Tarjeta_Emisor_Descripcion FROM gd_esquema.Maestra
WHERE Tarjeta_Emisor_Descripcion IS NOT NULL

--AGREGANDO TIPOS DE DOCUMENTOS EXISTENTES EN TABLA MAESTRA Y MANUALES
INSERT INTO BOBBY_TABLES.TIPOS_DOCUMENTO
VALUES(1, 'DNI')
INSERT INTO BOBBY_TABLES.TIPOS_DOCUMENTO
VALUES(2, 'CI')
INSERT INTO BOBBY_TABLES.TIPOS_DOCUMENTO
VALUES(3, 'LC')
INSERT INTO BOBBY_TABLES.TIPOS_DOCUMENTO
VALUES(4, 'LE')
INSERT INTO BOBBY_TABLES.TIPOS_DOCUMENTO --HARDCODEO EL PASAPORTE PARA FACILITAR LA APLICACI�N
VALUES(5, 'PAS')

--AGREGANDO DATOS EN LA TABLA USUARIOS
INSERT INTO BOBBY_TABLES.USUARIOS(USERNAME, PASSWORD, FECHA_ALTA)
SELECT DISTINCT Cli_Mail, CONVERT(VARBINARY(32),'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'), GETDATE() FROM gd_esquema.Maestra --PASSWORD VAC�A

--ASGINANDO A TODOS LOS USUARIOS NUEVOS EL ROL DE CLIENTE
INSERT INTO BOBBY_TABLES.ROLES_POR_USUARIO
SELECT 2, USU_ID FROM BOBBY_TABLES.USUARIOS

--SET DE ADMINISTRADORES
INSERT INTO BOBBY_TABLES.USUARIOS(USERNAME, PASSWORD, FECHA_ALTA)
VALUES('julieta', CONVERT(VARBINARY(32),'e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7'),GETDATE())
INSERT INTO BOBBY_TABLES.ROLES_POR_USUARIO
VALUES(1,@@IDENTITY)
INSERT INTO BOBBY_TABLES.USUARIOS(USERNAME, PASSWORD, FECHA_ALTA)
VALUES('maximiliano', CONVERT(VARBINARY(32),'e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7'),GETDATE())
INSERT INTO BOBBY_TABLES.ROLES_POR_USUARIO
VALUES(1,@@IDENTITY)
INSERT INTO BOBBY_TABLES.USUARIOS(USERNAME, PASSWORD, FECHA_ALTA)
VALUES('julian', CONVERT(VARBINARY(32),'e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7'),GETDATE())
INSERT INTO BOBBY_TABLES.ROLES_POR_USUARIO
VALUES(1,@@IDENTITY)
INSERT INTO BOBBY_TABLES.USUARIOS(USERNAME, PASSWORD, FECHA_ALTA)
VALUES('martin', CONVERT(VARBINARY(32),'e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7'),GETDATE())
INSERT INTO BOBBY_TABLES.ROLES_POR_USUARIO
VALUES(1,@@IDENTITY)

--AGREGANDO DATOS EN LA TABLA PERSONAS
INSERT INTO BOBBY_TABLES.PERSONAS(TIPO_DOC, NUMERO_DOC, NOMBRE, APELLIDO, PAIS, CALLE, NUMERO_DOM, PISO, DEPTO, FECHA_NACIMIENTO, MAIL, USUARIO)
SELECT DISTINCT 5, M.Cli_Nro_Doc, M.Cli_Nombre, M.Cli_Apellido, M.Cli_Pais_Codigo, M.Cli_Dom_Calle, M.Cli_Dom_Nro, M.Cli_Dom_Piso, M.Cli_Dom_Depto, M.Cli_Fecha_Nac, M.Cli_Mail, U.USU_ID FROM gd_esquema.Maestra M, BOBBY_TABLES.USUARIOS U --HARDCODEO EL PASAPORTE PARA SIMPLIFICAR LA APLICACI�N
WHERE U.USERNAME = M.Cli_Mail

--AGREGANDO DATOS EN LA TABLA CUENTAS
SET IDENTITY_INSERT BOBBY_TABLES.CUENTAS ON

INSERT INTO BOBBY_TABLES.CUENTAS(CUE_ID, USUARIO, PAIS, MONEDA, TIPO, FECHA_ALTA, FECHA_EXPIRACION, ESTADO)
SELECT DISTINCT M.Cuenta_Numero, U.USU_ID, M.Cuenta_Pais_Codigo, 1, 1, M.Cuenta_Fecha_Creacion, M.Cuenta_Fecha_Cierre, M.Cuenta_Estado FROM gd_esquema.Maestra M, BOBBY_TABLES.USUARIOS U
WHERE U.USERNAME = M.Cli_Mail

SET IDENTITY_INSERT BOBBY_TABLES.CUENTAS OFF

--AGREGANDO DATOS EN LA TABLA TARJETAS
INSERT INTO BOBBY_TABLES.TARJETAS
SELECT DISTINCT U.USU_ID, BOBBY_TABLES.ENCRIPTAR_TARJETA(M.Tarjeta_Numero), BOBBY_TABLES.ULTIMOS_4_DIGITOS(M.Tarjeta_Numero), HASHBYTES('SHA1',M.Tarjeta_Codigo_Seg), E.EMI_ID, Tarjeta_Fecha_Emision, Tarjeta_Fecha_Vencimiento FROM gd_esquema.Maestra M, BOBBY_TABLES.USUARIOS U, BOBBY_TABLES.EMISORES E
WHERE U.USERNAME = M.Cli_Mail AND
	  E.NOMBRE = M.Tarjeta_Emisor_Descripcion

--AGREGANDO DATOS EN LA TABLA BANCOS
SET IDENTITY_INSERT BOBBY_TABLES.BANCOS ON

INSERT INTO BOBBY_TABLES.BANCOS(BAN_ID, NOMBRE, DIRECCION)
SELECT DISTINCT Banco_Cogido, Banco_Nombre, Banco_Direccion FROM gd_esquema.Maestra
WHERE Banco_Cogido IS NOT NULL

SET IDENTITY_INSERT BOBBY_TABLES.BANCOS OFF

--AGREGANDO DATOS EN LA TABLA CHEQUES
INSERT INTO BOBBY_TABLES.CHEQUES
SELECT DISTINCT Cheque_Numero, Banco_Cogido FROM gd_esquema.Maestra
WHERE Cheque_Numero IS NOT NULL


--AGREGANDO DEPOSITOS EN LA TABLA OPERACIONES
SET IDENTITY_INSERT BOBBY_TABLES.OPERACIONES ON

INSERT INTO BOBBY_TABLES.OPERACIONES(OPE_ID, CUENTA, MONEDA, FECHA, IMPORTE)
SELECT DISTINCT Deposito_Codigo, Cuenta_Numero, 1, Deposito_Fecha, Deposito_Importe FROM gd_esquema.Maestra
WHERE Deposito_Codigo IS NOT NULL

SET IDENTITY_INSERT BOBBY_TABLES.OPERACIONES OFF

--AGREGANDO DEPOSITOS DE LA TABLA OPERACIONES EN DEPOSITOS
INSERT INTO BOBBY_TABLES.DEPOSITOS
SELECT O.OPE_ID, T.TAR_ID FROM gd_esquema.Maestra M, BOBBY_TABLES.OPERACIONES O, BOBBY_TABLES.TARJETAS T
WHERE M.Deposito_Codigo = O.OPE_ID AND
	  T.ENCRIPTADO = BOBBY_TABLES.ENCRIPTAR_TARJETA(M.Tarjeta_Numero) AND
	  T.LIMPIO = BOBBY_TABLES.ULTIMOS_4_DIGITOS(M.Tarjeta_Numero)

--AGREGANDO TRANSFERENCIAS EN LA TABLA OPERACIONES
CREATE TABLE BOBBY_TABLES.AUXILIAR(			--SE UTILIZA PARA ASEGURAR UNICIDAD
	OPERACION INT IDENTITY(1,1),	--EN LA TABLA OPERACIONES CONTRA TRANSFERENCIAS
	CUENTA_ORIGEN NUMERIC(18,0),
	MONEDA INT,
	FECHA DATE,
	IMPORTE FLOAT,
	CUENTA_DESTINO NUMERIC(18,0),
	COSTO FLOAT,
	NRO_FAC NUMERIC(18,0),
	DESC_FAC VARCHAR(150),
	FECHA_FAC DATE,
)

INSERT INTO BOBBY_TABLES.AUXILIAR
SELECT DISTINCT Cuenta_Numero, 1, Transf_Fecha, Trans_Importe, Cuenta_Dest_Numero, Trans_Costo_Trans, Factura_Numero, Item_Factura_Descr, Factura_Fecha FROM gd_esquema.Maestra
WHERE Trans_Importe > 0

SET IDENTITY_INSERT BOBBY_TABLES.OPERACIONES ON

INSERT INTO BOBBY_TABLES.OPERACIONES(OPE_ID, CUENTA, MONEDA, FECHA, IMPORTE)
SELECT OPERACION, CUENTA_ORIGEN, MONEDA, FECHA, IMPORTE FROM BOBBY_TABLES.AUXILIAR

SET IDENTITY_INSERT BOBBY_TABLES.OPERACIONES OFF

--AGREGANDO TRANSFERENCIAS DE LA AUXILIAR EN TRANSFERENCIAS
INSERT INTO BOBBY_TABLES.TRANSFERENCIAS
SELECT OPERACION, CUENTA_DESTINO, COSTO FROM BOBBY_TABLES.AUXILIAR

--AGREGANDO LAS FACTURAS POR TRANSFERENCIAS A LA TABLA FACTURAS
SET IDENTITY_INSERT BOBBY_TABLES.FACTURAS ON

INSERT INTO BOBBY_TABLES.FACTURAS(FAC_ID, DESCRIPCION, OPERACION, FECHA)
SELECT NRO_FAC, DESC_FAC, OPERACION, FECHA_FAC FROM BOBBY_TABLES.AUXILIAR
WHERE NRO_FAC IS NOT NULL

SET IDENTITY_INSERT BOBBY_TABLES.FACTURAS OFF

DROP TABLE BOBBY_TABLES.AUXILIAR --ELIMINO LA TABLA YA QUE NO TIENE M�S UTILIDAD

--AGREGANDO RETIROS DE EFECTIVO EN LA TABLA OPERACIONES
SET IDENTITY_INSERT BOBBY_TABLES.OPERACIONES ON

INSERT INTO BOBBY_TABLES.OPERACIONES(OPE_ID, CUENTA, MONEDA, FECHA, IMPORTE)
SELECT DISTINCT Retiro_Codigo, Cuenta_Numero, 1, Retiro_Fecha, Retiro_Importe FROM gd_esquema.Maestra
WHERE Retiro_Codigo IS NOT NULL AND
	  Retiro_Importe > 0
	  
SET IDENTITY_INSERT BOBBY_TABLES.OPERACIONES OFF
	  
--AGREGANDO RETIROS DE EFECTIVO DE LA TABLA OPERACIONES EN LA TABLA RETIROS_EFECTIVO
INSERT INTO BOBBY_TABLES.RETIROS_EFECTIVO
SELECT O.OPE_ID, C.CHE_ID FROM gd_esquema.Maestra M, BOBBY_TABLES.OPERACIONES O, BOBBY_TABLES.CHEQUES C
WHERE M.Retiro_Codigo = O.OPE_ID AND
	  C.NUMERO = M.Cheque_Numero

-------------------------------------------
------PROCEDURES PARA LA APLICACI�N--------
-------------------------------------------

--ALTA CLIENTES
GO
CREATE PROCEDURE BOBBY_TABLES.AGREGAR_CLIENTE(@NOMBRE VARCHAR(255),@APELLIDO VARCHAR(255),@DOC NUMERIC(10,0),
	@TIPO_DOC INT,@CALLE VARCHAR(255),@NUMERO_DOM NUMERIC(5,0),@PISO INT,@DEPTO VARCHAR(10),@LOCALIDAD VARCHAR(60),
	@PAIS INT,@FECHA_NAC DATE,@NACIONALIDAD INT,@MAIL VARCHAR(255),@USERNAME VARCHAR(40),@PASSWORD VARBINARY(32),
	@FECHA_ALTA DATE,@PREGUNTA VARCHAR(100),@RESPUESTA VARBINARY(32)) AS
BEGIN

	INSERT INTO BOBBY_TABLES.USUARIOS
	VALUES(@USERNAME, @PASSWORD, @FECHA_ALTA, @PREGUNTA, @RESPUESTA)

	INSERT INTO ROLES_POR_USUARIO
	VALUES(2, @@IDENTITY)

	INSERT INTO BOBBY_TABLES.PERSONAS
	VALUES(@TIPO_DOC, @DOC, @NOMBRE, @APELLIDO, @PAIS, @CALLE, @NUMERO_DOM, @PISO, @DEPTO, @LOCALIDAD, @NACIONALIDAD, @FECHA_NAC, @MAIL, @@IDENTITY)

END

--MODIFICACI�N CLIENTES
GO
CREATE PROCEDURE BOBBY_TABLES.MODIFICAR_CLIENTE(@ID INT,@NOMBRE VARCHAR(255),@APELLIDO VARCHAR(255),
	@DOC NUMERIC(10,0),@TIPO_DOC INT,@CALLE VARCHAR(255),@NUMERO_DOM NUMERIC(5,0),@PISO INT,@DEPTO VARCHAR(10),
	@LOCALIDAD VARCHAR(60),@PAIS INT,@FECHA_NAC DATE,@NACIONALIDAD INT,@MAIL VARCHAR(255),@USERNAME VARCHAR(40),
	@PASSWORD VARBINARY(32),@FECHA_MOD DATE,@PREGUNTA VARCHAR(100),@RESPUESTA VARBINARY(32)) AS
BEGIN
	DECLARE @USUARIO INT
	BEGIN TRY
	SELECT @USUARIO = USUARIO FROM BOBBY_TABLES.PERSONAS WHERE PER_ID = @ID
	END TRY
	BEGIN CATCH
	IF @USUARIO IS NULL RAISERROR('NO EXISTE EL CLIENTE',16,1)
	ELSE RAISERROR('ERROR INESPERADO',16,1)
	END CATCH
	
	UPDATE BOBBY_TABLES.PERSONAS SET
		NOMBRE = @NOMBRE,
		APELLIDO = @APELLIDO,
		NUMERO_DOC = @DOC,
		TIPO_DOC = @TIPO_DOC,
		CALLE = @CALLE,
		NUMERO_DOM = @NUMERO_DOM,
		PISO = @PISO,
		DEPTO = @DEPTO,
		LOCALIDAD = @LOCALIDAD,
		PAIS = @PAIS,
		FECHA_NACIMIENTO = @FECHA_NAC,
		NACIONALIDAD = @NACIONALIDAD,
		MAIL = @MAIL
	WHERE PER_ID = @ID
	
	UPDATE BOBBY_TABLES.USUARIOS SET
		USERNAME = @USERNAME,
		PASSWORD = @PASSWORD,
		FECHA_MODIFICACION = @FECHA_MOD,
		PREGUNTA_SECRETA = @PREGUNTA,
		RESPUESTA = @RESPUESTA
	WHERE USU_ID = @USUARIO
END

--BAJA CLIENTES
GO
CREATE PROCEDURE BOBBY_TABLES.BAJA_CLIENTE(@ID INT) AS --TODO �DAR DE BAJA USUARIO Y/O PERSONA?
BEGIN
	DECLARE @USUARIO INT
	
	BEGIN TRY
		SELECT @USUARIO = USUARIO FROM BOBBY_TABLES.PERSONAS WHERE PER_ID = @ID
	END TRY
	BEGIN CATCH
		IF @USUARIO IS NULL RAISERROR('NO EXISTE EL CLIENTE',16,1)
		ELSE RAISERROR('ERROR INESPERADO',16,1)
	END CATCH
	
	UPDATE BOBBY_TABLES.USUARIOS SET
	ESTADO = 0
	WHERE USU_ID = @USUARIO
END

--GET CLIENTES
GO
CREATE FUNCTION BOBBY_TABLES.GET_CLIENTE(@ID INT) RETURNS @CLIENTE TABLE( --TODO VER SI SE NECESITA ESTO
	PER_ID INT,
	TIPO_DOC INT,
	NUMERO_DOC NUMERIC(10,0),
	NOMBRE VARCHAR(255),
	APELLIDO VARCHAR(255),
	PAIS INT,
	CALLE VARCHAR(255),
	NUMERO_DOM NUMERIC(5,0),
	PISO INT,
	DEPTO VARCHAR(10),
	LOCALIDAD VARCHAR(60),
	NACIONALIDAD INT,
	FECHA_NACIMIENTO DATE,
	MAIL VARCHAR(255),
	USUARIO INT,
	USU_ID INT,
	USERNAME VARCHAR(40),
	PASSWORD VARBINARY(32),
	ESTADO BIT,
	FECHA_ALTA DATE,
	FECHA_MODIFICACION DATE,
	INTENTOS_FALLIDOS SMALLINT,
	PREGUNTA_SECRETA VARCHAR(100),
	RESPUESTA VARBINARY(32)
) AS
BEGIN
	INSERT INTO @CLIENTE
	SELECT * FROM BOBBY_TABLES.PERSONAS P, BOBBY_TABLES.USUARIOS U
	WHERE P.PER_ID = @ID AND U.USU_ID = P.USUARIO
	
	RETURN
END

--ALTA CUENTAS
GO
CREATE PROCEDURE BOBBY_TABLES.AGREGAR_CUENTA(@USUARIO INT,@MONEDA INT,@PAIS INT,@TIPO INT,@FECHA_ALTA DATE) AS --TODO FECHA_EXPIRACION?
BEGIN
	INSERT INTO BOBBY_TABLES.CUENTAS(USUARIO, PAIS, MONEDA, TIPO, FECHA_ALTA, ESTADO)
	VALUES(@USUARIO, @PAIS, @MONEDA, @TIPO, @FECHA_ALTA, 3) --ESTADO PENDIENTE DE ACTIVACI�N
END

--MODIFICACI�N CUENTAS
GO
CREATE PROCEDURE BOBBY_TABLES.MODIFICAR_CUENTA(@ID NUMERIC(18,0), @USUARIO INT,@MONEDA INT,@PAIS INT,@TIPO INT) AS
BEGIN
	UPDATE BOBBY_TABLES.CUENTAS SET
		USUARIO = @USUARIO,
		MONEDA = @MONEDA,
		PAIS = @PAIS,
		TIPO = @TIPO
	WHERE CUE_ID = @ID
END

--BAJA CUENTAS
GO
CREATE PROCEDURE BOBBY_TABLES.BAJA_CUENTA(@ID NUMERIC(18,0), @FECHA_CIERRE DATE) AS
BEGIN
	UPDATE BOBBY_TABLES.CUENTAS SET
		ESTADO = 4,
		FECHA_CIERRE = @FECHA_CIERRE
	WHERE CUE_ID = @ID
END

--ALTA ROLES
GO
CREATE PROCEDURE BOBBY_TABLES.AGREGAR_ROL(@NOMBRE VARCHAR(50), @FUNCIONALIDADES AS BOBBY_TABLES.LISTA_INT READONLY) AS
BEGIN
	DECLARE @ID_ROL INT
	
	INSERT INTO BOBBY_TABLES.ROLES
	VALUES(@NOMBRE)
	
	SET @ID_ROL = @@IDENTITY
	
	INSERT INTO BOBBY_TABLES.FUNCIONALIDADES_POR_ROL
	SELECT @ID_ROL, ITEM FROM @FUNCIONALIDADES
END

GO
CREATE FUNCTION BOBBY_TABLES.ENCRIPTAR_TARJETA(@NUMERO_TARJETA NUMERIC(16,0)) RETURNS VARBINARY(20) AS BEGIN
	DECLARE @PRIMEROS12 VARCHAR(12)
	DECLARE @ENCRIPTADO VARBINARY(20)
	
	SET @PRIMEROS12 = SUBSTRING(CONVERT(VARCHAR(16),@NUMERO_TARJETA), 1, 12)
	
	SET @ENCRIPTADO = HASHBYTES('SHA1',@PRIMEROS12)

	RETURN @ENCRIPTADO
END

GO
CREATE FUNCTION BOBBY_TABLES.ULTIMOS_4_DIGITOS(@NUMERO_TARJETA NUMERIC(16,0)) RETURNS NUMERIC(4,0) AS BEGIN
	RETURN SUBSTRING(CONVERT(VARCHAR(16),@NUMERO_TARJETA), 13, 4)
END



--PRUEBA DE LISTAS POR PAR�METROS
CREATE TYPE BOBBY_TABLES.LISTA_INT AS TABLE(ITEM INT)

GO
CREATE PROCEDURE BOBBY_TABLES.AUXILIAR(@TABLA AS BOBBY_TABLES.LISTA_INT READONLY) AS
--http://stackoverflow.com/questions/11102358/how-to-pass-an-array-into-a-sql-server-stored-procedure
BEGIN
	SELECT ITEM FROM @TABLA
END

DROP PROCEDURE BOBBY_TABLES.AUXILIAR