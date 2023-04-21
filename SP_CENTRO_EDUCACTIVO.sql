CREATE OR REPLACE FUNCTION sp_centro_educativo(
	 tipo_operacion varchar(2), 
	 pi_cod_identificador integer,
     pv_cod_sace varchar,
     pv_nom_institucion varchar,
     pv_tip_categoria_institucion varchar 
)RETURNS table(cod_identificador integer,
     cod_sace varchar,
     nom_institucion varchar,
     tip_categoria_institucion varchar
)AS $$
BEGIN
  --Convertimos a mayuscula el tipo de operacion que realizara el SP;
  TIPO_OPERACION = UPPER(tipo_operacion);
	CASE tipo_operacion
    WHEN 'ST' THEN --SELECCIONAR TODOS LOS REGISTROS
			 RETURN QUERY select * from CENTRO_EDUCATIVO;
    WHEN 'S' THEN --SELECCIONAR UN REGISTRO ESPECIFICO
			 RETURN QUERY select * from CENTRO_EDUCATIVO where CENTRO_EDUCATIVO.cod_identificador=pi_cod_identificador;
       
       
     WHEN 'I' THEN --INSERT
			INSERT INTO CENTRO_EDUCATIVO (
     cod_sace,
     nom_institucion,
     tip_categoria_institucion
    )values(
     pv_cod_sace,
     pv_nom_institucion,
     pv_tip_categoria_institucion 
    );	
			
       
     WHEN 'U' THEN --UPDATE
			UPDATE CENTRO_EDUCATIVO SET   
     cod_sace=pv_cod_sace,
     nom_institucion=pv_nom_institucion,
     tip_categoria_institucion=pv_tip_categoria_institucion 
              WHERE CENTRO_EDUCATIVO.cod_identificador=pi_cod_identificador;
			
		
    END CASE;

  END;
$$ LANGUAGE plpgsql;