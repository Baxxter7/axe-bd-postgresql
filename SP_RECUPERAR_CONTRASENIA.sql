CREATE OR REPLACE FUNCTION sp_recuperar_contrasenia(
    TIPO_OPERACION VARCHAR(2),
	pi_cod_pregunta_respuesta integer,
	pi_cod_usuario integer,
	pv_nomb_pregunta varchar,
	pv_des_respuesta varchar
	
	
) RETURNS table(cod_pregunta_respuesta integer,
	cod_usuario integer,
	nomb_pregunta varchar,
	des_respuesta varchar
	
)
AS $$
  BEGIN
  --Convertimos a mayuscula el tipo de operacion que realizara el SP;
  TIPO_OPERACION = UPPER(TIPO_OPERACION);
	CASE TIPO_OPERACION
    WHEN 'ST' THEN --SELECCIONAR TODOS LOS REGISTROS
			 RETURN QUERY select * from RECUPERAR_CONTRASENIA;
           
    WHEN 'S' THEN --SELECCIONAR UN REGISTRO ESPECIFICO
			 RETURN QUERY select * from RECUPERAR_CONTRASENIA where RECUPERAR_CONTRASENIA.cod_pregunta_respuesta=pi_cod_pregunta_respuesta;
       
       
     WHEN 'I' THEN --INSERT
			INSERT INTO RECUPERAR_CONTRASENIA(
    cod_usuario,
	nomb_pregunta,
	des_respuesta
	
    )values(
    pi_cod_usuario,
	pv_nomb_pregunta,
	pv_des_respuesta
    );	
			
       
     WHEN 'U' THEN --UPDATE
	        UPDATE RECUPERAR_CONTRASENIA SET 
        	nomb_pregunta=pv_nomb_pregunta,
	        des_respuesta=pv_des_respuesta
            WHERE RECUPERAR_CONTRASENIA.cod_pregunta_respuesta=pi_cod_pregunta_respuesta;
			
        
		
    END CASE;

  END;
$$ LANGUAGE plpgsql;