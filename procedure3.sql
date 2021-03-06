CREATE TYPE NAMES IS TABLE OF VARCHAR(30);

CREATE OR REPLACE PROCEDURE PROREAD(SALRANGE NUMBER,RESULTS OUT NAMES)
IS
 P NUMBER:=1;
BEGIN
  RESULTS:=NAMES();
  FOR X IN (SELECT * FROM EMPLOYEES WHERE SALARY > SALRANGE)
  LOOP
    RESULTS.EXTEND;
    RESULTS(P):=X.FIRST_NAME;
    P:=P+1;
  END LOOP;
END;

DECLARE 
 V_RESULTS NAMES;
BEGIN
   PROREAD(11000,V_RESULTS);
   FOR X IN 1..V_RESULTS.COUNT
   LOOP
     DBMS_OUTPUT.PUT_LINE(V_RESULTS(X));
   END LOOP;
END;