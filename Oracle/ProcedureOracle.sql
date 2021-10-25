--Procedure 1
--
--CREATE OR REPLACE PROCEDURE add_employees (
-- p_empid IN employees.empid%TYPE,
-- p_firstname IN employees.firstname%TYPE,
-- p_lastname IN employees.lastname%TYPE,
-- p_emailid IN employees.emailid%TYPE,
-- p_gender IN employees.gender%TYPE,
-- p_mobileno IN employees.mobileno%TYPE,
-- p_dateofjoining IN employees.dateofjoining%TYPE,
-- p_deptid IN employees.deptid%TYPE
--) IS
--BEGIN
--  INSERT INTO EMPLOYEES VALUES(p_empid, p_firstname, p_lastname, p_emailid, p_gender, p_mobileno, p_dateofjoining, p_deptid);
--    COMMIT;
--  dbms_output.put_line('Employees complete added!');
--END add_employees;

--select * from employees;

-- Procedure 2
--CREATE OR REPLACE PROCEDURE select_department AS  
--DEPT_REC EMPLOYEES%TABLETYPE;
--CURSOR mycursor IS SELECT * FROM EMPLOYEES;
--BEGIN
--  OPEN mycursor;
--  LOOP
--    FETCH mycursor INTO DEPT_REC;
--    EXIT WHEN mycursor%NOTFOUND;
--  END LOOP;
--  CLOSE mycursor;
--END select_department;

---- Procedure 3
--CREATE OR REPLACE PROCEDURE select_department(cursor_ OUT SYS_REFCURSOR) 
--AS
--
--BEGIN
--  OPEN cursor_ FOR 
--       SELECT * FROM employees;
--  CLOSE cursor_;
--END select_department;

---- Procedure 4
--CREATE OR REPLACE PROCEDURE myprocedure(
--    mycursor OUT SYS_REFCURSOR )
--AS
--BEGIN
--  OPEN mycursor FOR SELECT * FROM employees;
--END;
--DECLARE
--mycursor SYS_REFCURSOR;
--BEGIN
--EXECUTE myprocedure(:mycursor);
--END;

set serveroutput on
DECLARE
CURSOR_ SYS_REFCURSOR;
BEGIN
  myprocedure(
    ORDERCODE_NUMBER => ORDERCODE_NUMBER,
    CURSOR_ => CURSOR_
  );
  :CURSOR_ := CURSOR_; 
  dbms_output.put_line(CURSOR_);
END CURSOR_;


