CREATE OR REPLACE FUNCTION sp_telefonos(
	 tipo_operacion varchar(2),
	 pi_cod_telefono integer,
	 pv_num_telefono varchar
)RETURNS table(cod_telefono  integer, 
     num_telefono varchar
)AS $$
BEGIN
  --Convertimos a mayuscula el tipo de operacion que realizara el SP;
  TIPO_OPERACION = UPPER(tipo_operacion);
	CASE tipo_operacion
    WHEN 'ST' THEN --SELECCIONAR TODOS LOS REGISTROS
			 RETURN QUERY select * from TELEFONOS;
    WHEN 'S' THEN --SELECCIONAR UN REGISTRO ESPECIFICO
			 RETURN QUERY select * from TELEFONOS where TELEFONOS.cod_telefono= pi_cod_telefono;
       
       
     WHEN 'I' THEN --INSERT
			INSERT INTO TELEFONOS(
    num_telefono 
    )values(
    pv_num_telefono
    );	
			
       
     WHEN 'U' THEN --UPDATE
			UPDATE TELEFONOS SET   
    num_telefono=pv_num_telefono
              WHERE TELEFONOS.cod_telefono = pi_cod_telefono;
			
		
    END CASE;

  END;
$$ LANGUAGE plpgsql;