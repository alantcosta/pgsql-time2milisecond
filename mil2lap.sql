CREATE OR REPLACE FUNCTION monitor.fn_mil2lap(
	v_miliseconds bigint)
    RETURNS character
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

	  v_min = floor(v_mil / 60000);
    v_aux = v_mil % 60000;
    v_sec = floor(v_aux / 1000);
    v_mil = v_aux % 1000;

    v_time = v_min::text || ':' || LPAD(v_sec::text,2,'0') || '.' || LPAD(v_mil::text,3,'0');	
    
	RETURN 	v_time;
END
$BODY$;
