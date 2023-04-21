CREATE OR REPLACE FUNCTION sp_donaciones(
	 tipo_operacion varchar(2),
	 pi_cod_donacion integer,
     pv_nom_institucion varchar,
     pv_tip_donacion  varchar,
     pv_des_donacion  varchar
       
)RETURNS table(cod_donacion integer,
     nom_institucion varchar,
     tip_donacion  varchar,
     des_donacion  varchar,
     fec_donacion  timestamp  
)AS $$
BEGIN
  --Convertimos a mayuscula el tipo de operacion que realizara el SP;
  TIPO_OPERACION = UPPER(tipo_operacion);
	CASE tipo_operacion
    WHEN 'ST' THEN --SELECCIONAR TODOS LOS REGISTROS
			 RETURN QUERY select * from DONACIONES;
    WHEN 'S' THEN --SELECCIONAR UN REGISTRO ESPECIFICO
			 RETURN QUERY select * from DONACIONES where DONACIONES.cod_donacion=pi_cod_donacion;
       
       
     WHEN 'I' THEN --INSERT
			INSERT INTO DONACIONES(
     nom_institucion,
     tip_donacion,
     des_donacion,
     fec_donacion
    )values(
     pv_nom_institucion,
     pv_tip_donacion,
     pv_des_donacion,
     current_timestamp   
    );	
			
       
     WHEN 'U' THEN --UPDATE
			UPDATE DONACIONES SET   
     nom_institucion=pv_nom_institucion,
     tip_donacion=pv_tip_donacion,
     des_donacion=pv_des_donacion,
     fec_donacion=current_timestamp 
              WHERE DONACIONES.cod_donacion=pi_cod_donacion;
			
		
    END CASE;

  END;
$$ LANGUAGE plpgsql;