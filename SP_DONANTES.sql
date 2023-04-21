CREATE OR REPLACE FUNCTION sp_donantes(
	 tipo_operacion varchar(2),
	 pi_cod_donantes integer,
	 pv_cod_usuario integer,
     pv_Nombre varchar,
	 pv_identidad varchar,
	 pv_direccion varchar,
	 pv_telefono varchar,
	 pv_email varchar
	
)RETURNS table(cod_donantes integer, 
     cod_usuario integer,
	 nombre varchar,
	 identidad varchar,		   
     direccion varchar,
	 telefono varchar,
	 email varchar,
	 fec_creacion timestamp
)AS $$
BEGIN
  --Convertimos a mayuscula el tipo de operacion que realizara el SP;
  TIPO_OPERACION = UPPER(tipo_operacion);
	CASE tipo_operacion
    WHEN 'ST' THEN --SELECCIONAR TODOS LOS REGISTROS
			 RETURN QUERY select * from DONANTES;
    WHEN 'S' THEN --SELECCIONAR UN REGISTRO ESPECIFICO
			 RETURN QUERY select * from DONANTES where DONANTES.cod_donantes=pi_cod_donantes;
       
       
     WHEN 'I' THEN --INSERT
			INSERT INTO DONANTES (
     cod_usuario,
	 nombre,
	 identidad,			
     direccion,
	 telefono,
	 email,
	 fec_creacion
    )values(
     pv_cod_usuario,
	 pv_Nombre,
	 pv_identidad,
     pv_direccion,
	 pv_telefono,
	 pv_email,
	 current_timestamp
    );	
			
       
     WHEN 'U' THEN --UPDATE
			UPDATE DONANTES SET   
     nombre=pv_Nombre,
	 identidad=pv_identidad,
	 direccion=pv_direccion,
	 telefono=pv_telefono,
	 email=pv_email,
	 fec_creacion=current_timestamp
              WHERE DONANTES.cod_donantes=pi_cod_donantes;
			
		
    END CASE;

  END;
$$ LANGUAGE plpgsql;