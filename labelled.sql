DECLARE
  
BEGIN 
      <<outer>>
      FOR X IN 1..10
        LOOP
           FOR Y IN  1..X
           LOOP
             DBMS_OUTPUT.PUT(X || ' ');
             exit outer when  (mod(X,2)=0 and Y=5);
           END LOOP;
             DBMS_OUTPUT.PUT_LINE('');
            
        END LOOP outer;
END;