create or replace PACKAGE BODY MATHEMATICS IS 
   
   PROCEDURE FACTORS(INPUTPARAM NUMBERS,OUTPUT OUT INDEXEDRESULTS)
   IS
     TEMP PLS_INTEGER:=2;
     ARRAY_TEMP NUMBERS;
     MYCOUNT PLS_INTEGER:=1;
   BEGIN
       FOR X IN  1..INPUTPARAM.COUNT
       LOOP
          TEMP:=2;
          MYCOUNT:=1;
          ARRAY_TEMP:=NUMBERS();
          WHILE TEMP<=INPUTPARAM(X)/2
          LOOP
          IF MOD(INPUTPARAM(X),TEMP)=0 THEN
            ARRAY_TEMP.EXTEND;
            ARRAY_TEMP(MYCOUNT):=TEMP;
            MYCOUNT:=MYCOUNT+1;
          END IF;
          TEMP:=TEMP+1;
          END LOOP;
          OUTPUT(X):=ARRAY_TEMP;
        END LOOP;
    END FACTORS;

    FUNCTION SQUARE(INPUTPARAM NUMBERS) RETURN NUMBERS
    IS
     RESULT NUMBERS:=NUMBERS();
    BEGIN 
      FOR X IN 1..INPUTPARAM.COUNT 
      LOOP
         RESULT.EXTEND;
         RESULT(X):=INPUTPARAM(X)*INPUTPARAM(X);
       END LOOP;
    RETURN RESULT;
    END SQUARE;

    FUNCTION TOTAL(INPUTPARAM NUMBERS) RETURN PLS_INTEGER
    IS
      RESULT PLS_INTEGER:=0;
    BEGIN
      FOR X IN 1..INPUTPARAM.COUNT 
      LOOP

         RESULT:=RESULT+X;
       END LOOP;
    RETURN RESULT;
    END TOTAL;


   END;