CREATE OR REPLACE FUNCTION EXPERIENCE(HIREDATE DATE)
RETURN VARCHAR
IS
BEGIN
   IF (SYSDATE-365.25*12)-HIREDATE > (5*365.25) THEN
     RETURN 'EXPERIENCED';
   ELSIF (SYSDATE-365.25*12)-HIREDATE > (2*365.25) THEN
     RETURN 'SENIOR';
    ELSE
      RETURN 'FRESHER';
  END IF;
END;

SELECT FIRST_NAME,HIRE_DATE,EXPERIENCE(HIRE_DATE) EXPERIENCE FROM EMPLOYEES;