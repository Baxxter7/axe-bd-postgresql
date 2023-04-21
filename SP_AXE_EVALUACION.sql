CREATE OR REPLACE FUNCTION sp_axe_evaluacion(
	 tipo_operacion varchar(2),
	 pi_cod_evaluacion integer,
     pv_nom_institucion varchar,
     pv_des_evaluacion varchar   
)RETURNS table(cod_evaluacion integer,
     nom_institucion varchar,
     des_evaluacion varchar
)AS $$
BEGIN
  --Convertimos a mayuscula el tipo de operacion que realizara el SP;
  TIPO_OPERACION = UPPER(tipo_operacion);
	CASE tipo_operacion
    WHEN 'ST' THEN --SELECCIONAR TODOS LOS REGISTROS
			 RETURN QUERY select * from AXE_EVALUACION;
    WHEN 'S' THEN --SELECCIONAR UN REGISTRO ESPECIFICO
			 RETURN QUERY select * from AXE_EVALUACION where AXE_EVALUACION.cod_evaluacion=pi_cod_evaluacion;
       
       
     WHEN 'I' THEN --INSERT
			INSERT INTO AXE_EVALUACION(
     nom_institucion,
     des_evaluacion
    )values(
     pv_nom_institucion,
     pv_des_evaluacion
    );	
			
       
     WHEN 'U' THEN --UPDATE
			UPDATE AXE_EVALUACION SET   
    nom_institucion=pv_nom_institucion,
    des_evaluacion= pv_des_evaluacion
              WHERE AXE_EVALUACION.cod_evaluacion=pi_cod_evaluacion;
			
		
    END CASE;

  END;
$$ LANGUAGE plpgsql;