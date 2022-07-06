CREATE OR REPLACE FUNCTION fn_time2mil(
	v_time time without time zone)
    RETURNS bigint
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE 
	  v_res integer;
    v_min integer;
    v_sec integer;
    v_mil integer;
	v_hour integer;
BEGIN	
    v_hour = to_char(v_time,'HH')::integer * 3600000;
    v_min = to_char(v_time,'MI')::integer * 60000;
    v_sec = to_char(v_time,'SS')::integer * 1000;
    v_mil = to_char(v_time,'MS')::integer;    
    v_res = v_hour + v_min + v_sec + v_mil;
	
	RETURN v_res;
END
$BODY$;
