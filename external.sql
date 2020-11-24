CREATE TABLE emp_ext (
  empno     number(6),
  first_name     VARCHAR2(50),
  job_title varchar2(50),
  salary  integer
)
ORGANIZATION EXTERNAL (
  TYPE ORACLE_LOADER
  DEFAULT DIRECTORY HR_DIR
  ACCESS PARAMETERS (
    RECORDS DELIMITED BY NEWLINE
    FIELDS TERMINATED BY ','
    MISSING FIELD VALUES ARE NULL
    (
  empno     char(6),
  first_name     char(30),
  job_title char(30),
  salary  char(10)
  
  ))
  LOCATION ('emp_csv.txt')
)
PARALLEL 5
REJECT LIMIT UNLIMITED


select * from emp_ext;

