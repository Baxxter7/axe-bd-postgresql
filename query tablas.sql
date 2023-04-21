--#1
Create Table SEG_ROLES(
  COD_ROL SERIAL PRIMARY KEY   NOT NULL, -- codigo de tabla roles
	TIP_ROLES VARCHAR(20)      NOT NULL -- 'tipos de Roles del usuario'
);

--#2
Create Table SEG_PERMISOS(
  COD_PERMISOS SERIAL PRIMARY KEY NOT NULL,    --'codigo de tabla permisos'
	PER_INSERCION VARCHAR(1)    NOT NULL,    --'Permiso de insertar'
	PER_ELIMINAR VARCHAR(1)     NOT NULL,    --'Permiso de Eliminar'
	PER_ACTUALIZAR VARCHAR (1)  NOT NULL,    --'Permiso de edita r'
	PER_CONSULTAR VARCHAR(1)    NOT NULL,    --'Permiso de seleccionar'
	FEC_MODIFICACION TIMESTAMP  NOT NULL,    --'Fecha de conseder los permisos'
  --Llave foranea
  COD_ROL INTEGER NOT NULL,                     --'codigo de tabla roles'

  --Relacion 
	FOREIGN KEY (COD_ROL) REFERENCES SEG_ROLES(COD_ROL)
);

--#3
--Create Table EMAILES(
--	COD_EMAIL SERIAL PRIMARY KEY NOT NULL, --'Codigo de la tabla Email'
--	DIR_CORREO VARCHAR(50)   NOT NULL, --'Direccion del correo'
--);

--#4
--Create Table TELEFONOS(
  --COD_TELEFONO SERIAL PRIMARY KEY    NOT NULL, --'codigo de la tabla'
	--NUM_TELEFONO VARCHAR(32)       NOT NULL, --'numero de telefono de usuario'
--);

--#5
Create Table USUARIOS(
    COD_USUARIO SERIAL PRIMARY KEY    NOT NULL, --'codigo de tabla usuarios'
	NOM_USUARIO VARCHAR (70)       NOT NULL, --'Nombre del Usuario'
	CONTRASENIA VARCHAR (100)       NOT NULL, --'contraseña del usuario '
	ESTADO_USUARIO  BOOLEAN NOT NULL , --'Estado del Usuario en el Sistema' 
	FEC_CREACION TIMESTAMP         NOT NULL, --'Fecha que se registro en el sistema'
	COD_ROL INTEGER                NOT  NULL, --'codigo de la tabla ROLES'
	TELEFONO INTEGER           NOT NULL, --'Codigo de la tablas Telefonos'
	EMAIL INTEGER             NOT NULL, --'Codigo de la tabla Email'
	--#codigoDirec DIR_RESIDENCIA VARCHAR(100)    NOT NULL, --'Lugar donde reside'[Esta pendiente agregar el nuevo codigo]
	
	--Relaciones
	FOREIGN KEY (COD_ROL) REFERENCES SEG_ROLES(COD_ROL)
	--FOREIGN KEY (COD_TELEFONO) REFERENCES TELEFONOS(COD_TELEFONO),
	--FOREIGN KEY (COD_EMAIL) REFERENCES EMAILES(COD_EMAIL)
);

--#6
create table Recuperar_Contrasenia(
Cod_Pregunta_Respuesta	SERIAL PRIMARY KEY NOT NULL,
COD_USUARIO INTEGER,
Nomb_pregunta VARCHAR (200),
DES_RESPUESTA VARCHAR (200),

FOREIGN KEY (COD_USUARIO) REFERENCES USUARIOS(COD_USUARIO)
);

--#7 Marcada Con H
Create Table DONANTES(
    COD_DONANTES SERIAL PRIMARY KEY NOT NULL, --'codigo de tabla usuarios'
	COD_USUARIO INTEGER             NOT NULL, --'codigo de tabla usuarios'
    NOMBRE VARCHAR(100) NOT NULL,
	IDENTIDAD VARCHAR (15) NOT NULL,
	DIRECCION VARCHAR (50)  NOT NULL,
	TELEFONO VARCHAR(20)  NOT  NULL,  --'Codigo de la tablas Telefonos'
	EMAIL VARCHAR (50)    NOT  NULL,  --'Codigo de la tabla Email'
	FEC_CREACION TIMESTAMP         NOT NULL  --'Fecha que se registro en el sistema'
);

--#8
create table DONACIONES( --Se convierte en donacion detalle(Solo informacion de la donacion)
COD_DONACION serial primary key NOT NULL, --'codigo de donacion relizada'
NOM_INSTITUCION varchar(40) NOT NULL,     --'Nombre de la institución'
TIP_DONACION    varchar(40)  NOT NULL,         -- 'Tipo de Donación'   
DES_DONACION    varchar(40) NOT NULL,     --'Detalle de la Donación'
FEC_DONACION    TIMESTAMP        --Fecha en que se realizo la donacion
);

--#9
CREATE TABLE AXE_EVALUACION(
   COD_EVALUACION SERIAL primary key NOT NULL, -- 'Codigo de la tabla evaluacion' 
   NOM_INSTITUCION varchar(40) NOT NULL,       -- 'Nombre de la institucion'
   DES_EVALUACION varchar(20) NULL            -- 'Detalle de la evaluación'
);

--#10
create table CENTRO_EDUCATIVO(
    COD_IDENTIFICADOR SERIAL primary key NOT NULL, --'Codigo de la tabla sace'
    COD_SACE Varchar  NOT NULL, --'Codigo de la tabla sace'
    NOM_INSTITUCION VARCHAR(40) NOT NULL, --'Nombre de la institución'
    TIP_CATEGORIA_INSTITUCION varchar(40)   NOT NULL --'Tipo de categoria de la institución'
	
);
