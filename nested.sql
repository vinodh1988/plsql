DECLARE
  
BEGIN 
      FOR X IN 1..10
        LOOP
           FOR Y IN  1..X
           LOOP
             DBMS_OUTPUT.PUT(X || ' ');
           END LOOP;
             DBMS_OUTPUT.PUT_LINE('');
            
        END LOOP;
END;