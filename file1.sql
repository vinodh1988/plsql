
CREATE OR REPLACE PROCEDURE EMP_CSV AS
  CURSOR c_data IS
    SELECT employee_id,
           first_name,
           job_id,
           salary
    FROM   employees;

    
  v_file  UTL_FILE.FILE_TYPE;
BEGIN
  v_file := UTL_FILE.FOPEN(location     => 'HR_DIRECTORY',
                           filename     => 'emp_csv.txt',
                           open_mode    => 'w',
                           max_linesize => 32767);
  FOR cur_rec IN c_data LOOP
    UTL_FILE.PUT_LINE(v_file,
                      cur_rec.employee_id    || ',' ||
                      cur_rec.first_name    || ',' ||
                      cur_rec.job_id    || ',' ||
                      cur_rec.salary    
                    );
  END LOOP;
  UTL_FILE.FCLOSE(v_file);
  
EXCEPTION
  WHEN OTHERS THEN
    UTL_FILE.FCLOSE(v_file);
    RAISE;
END;

exec emp_csv;