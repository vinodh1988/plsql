CREATE OR REPLACE FUNCTION DELETEDATA(TABLENAME VARCHAR)
RETURN PLS_INTEGER
IS
BEGIN
    EXECUTE IMMEDIATE 'DELETE FROM ' || TABLENAME;
    IF SQL%FOUND  THEN
    RETURN sql%ROWCOUNT;
    ELSE
    RETURN 0;
END IF;
END;

BEGIN
  DBMS_OUTPUT.PUT_LINE('NUMBER OF RECORDS DELETED' || DELETEDATA('THINGS2'));
END;