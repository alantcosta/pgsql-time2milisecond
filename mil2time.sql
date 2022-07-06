CREATE OR REPLACE FUNCTION fn_mil2time(
	v_miliseconds bigint)
    RETURNS time without time zone
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE 
	  v_time text;
    v_min integer;
    v_sec integer;
    v_mil integer;
	  v_hour integer;
	  v_aux integer;
BEGIN

	  v_hour = floor(v_mil / 3600000);
    v_aux = v_mil % 3600000;

    v_min = floor(v_aux / 60000);
    v_aux = v_aux % 60000;

    v_sec = floor(v_aux / 1000);
    v_mil = v_aux % 1000;

    v_time = LPAD(v_hour::text,2,'0') ':' || LPAD(v_min::text,2,'0') || ':' || LPAD(v_sec::text,2,'0') || '.' || LPAD(v_mil::text,3,'0');	
    
	RETURN 	v_time::time without time zone;
END
$BODY$;
