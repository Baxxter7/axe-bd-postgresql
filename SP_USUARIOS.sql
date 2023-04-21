CREATE OR REPLACE FUNCTION sp_usuarios(
    TIPO_OPERACION VARCHAR(2),
	pi_cod_usuario integer,
	pv_nom_usuario varchar,
	pv_contrasenia varchar,
	pv_estado_usuario  boolean,
	pi_cod_rol integer, --'codigo de la tabla roles'
	pi_telefono varchar, --'codigo de la tablas telefonos'
	pi_email varchar --'codigo de la tabla email'
	
) RETURNS table(cod_usuario integer,
	nom_usuario varchar,
	contrasenia varchar,
	estado_usuario  boolean,
	fec_creacion timestamp,
	cod_rol integer, --'codigo de la tabla roles'
	telefono varchar, --'codigo de la tablas telefonos'
	email varchar --'codigo de la tabla email'

)
AS $$
  BEGIN
  --Convertimos a mayuscula el tipo de operacion que realizara el SP;
  TIPO_OPERACION = UPPER(TIPO_OPERACION);
	CASE TIPO_OPERACION
    WHEN 'ST' THEN --SELECCIONAR TODOS LOS REGISTROS
			 RETURN QUERY select * from USUARIOS;
           
    WHEN 'S' THEN --SELECCIONAR UN REGISTRO ESPECIFICO
			 RETURN QUERY select * from USUARIOS where USUARIOS.cod_usuario=pi_cod_usuario;
       
       
     WHEN 'I' THEN --INSERT
			INSERT INTO USUARIOS(
    nom_usuario,
	contrasenia,
	estado_usuario,
	fec_creacion,
	cod_rol, --'codigo de la tabla roles'
	telefono, --'codigo de la tablas telefonos'
	email --'codigo de la tabla email'
    )values(
    pv_nom_usuario,
	pv_contrasenia,
	pv_estado_usuario,
	current_timestamp,
	pi_cod_rol, --'codigo de la tabla roles'
	pi_telefono, --'codigo de la tablas telefonos'
	pi_email --'codigo de la tabla email'
    );	
			
       
     WHEN 'U' THEN --UPDATE
	        UPDATE USUARIOS SET 
			nom_usuario=pv_nom_usuario,
        	contrasenia=pv_contrasenia,
	        estado_usuario=pv_estado_usuario,
	        fec_creacion=current_timestamp,
			telefono=pi_telefono,
			email=pi_email
            WHERE USUARIOS.cod_usuario=pi_cod_usuario;
			
        
		
    END CASE;

  END;
$$ LANGUAGE plpgsql;