CREATE OR REPLACE PROCEDURE PARAMETER_DEMO(A IN NUMBER, B OUT NUMBER, C IN OUT NUMBER)
IS
BEGIN
  C:=B;
  B:= A+C;
 -- C:= A*A;
 -- A:= 340;

END;

DECLARE
 X NUMBER:=20;
 Y NUMBER:=30;
 Z NUMBER:=40;
BEGIN
   PARAMETER_DEMO(X,Y,Z);
   DBMS_OUTPUT.PUT_LINE(X||' '||Y||'  '||Z);
END;