DECLARE
  TYPE t_bulk_collect_test_tab IS TABLE OF bulk_collect_test%ROWTYPE;

  l_tab    t_bulk_collect_test_tab := t_bulk_collect_test_tab();
  l_start  NUMBER;
BEGIN
  -- Time a regular population.
  l_start := DBMS_UTILITY.get_time;

  FOR cur_rec IN (SELECT *
                  FROM   bulk_collect_test)
  LOOP
    l_tab.extend;
    l_tab(l_tab.last) := cur_rec;
  END LOOP;

  DBMS_OUTPUT.put_line('Regular (' || l_tab.count || ' rows): ' || 
                       (DBMS_UTILITY.get_time - l_start));
  
  -- Time bulk population.  
  l_start := DBMS_UTILITY.get_time;

  SELECT *
  BULK COLLECT INTO l_tab
  FROM   bulk_collect_test;

  DBMS_OUTPUT.put_line('Bulk    (' || l_tab.count || ' rows): ' || 
                       (DBMS_UTILITY.get_time - l_start));
END;
/