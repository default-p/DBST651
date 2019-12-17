SET ECHO ON;
SET SERVEROUTPUT ON;
SET LINESIZE 300;
SET PAGESIZE 300;
SET WRAPE OFF;
/*
DECLARE
  L_TODO_USER_ID  TODO_USER.ID%TYPE;
  L_TODO_ID       TODO.ID%TYPE;
  L_CATEGORY_ID       CATEGORY.ID%TYPE;
BEGIN
  -- 1. Data for Luke Skywalker
  INSERT INTO TODO_USER (NAME, EMAIL)
  VALUES ('Luke Skywalker', 'lastjedi@starwars.io')
  RETURNING ID INTO L_TODO_USER_ID;
  
  INSERT INTO TODO (TITLE, DESCRIPTION, DEADLINE, NOTIFICATIONS, USER_ID)
  VALUES ('The Rise of Skywalker', 'Last time to show off jedi master skills', SYSTIMESTAMP - INTERVAL '60' DAY, SYSTIMESTAMP - INTERVAL '60' DAY, L_TODO_USER_ID)
  RETURNING ID INTO L_TODO_ID;
  
  INSERT INTO CATEGORY (NAME, PRIORITY, COLOR)
  VALUES ('Jedi Master', 10, 'green')
  RETURNING ID INTO L_CATEGORY_ID;
  
  INSERT INTO TODO_CATEGORY (IS_PLANNED, CATEGORY_ID, TODO_ID)
  VALUES ('T', L_CATEGORY_ID, L_TODO_ID);
  
  INSERT INTO TODO_COMMENT (BODY, USER_ID, TODO_ID)
  VALUES ('The force is strong with you', L_TODO_USER_ID, L_TODO_ID);
  
  INSERT INTO TODO (TITLE, DESCRIPTION, DEADLINE, NOTIFICATIONS, USER_ID)
  VALUES ('Like father like son', 'I am a Jedi like my father before me', SYSTIMESTAMP - INTERVAL '60' DAY, SYSTIMESTAMP - INTERVAL '60' DAY, L_TODO_USER_ID)
  RETURNING ID INTO L_TODO_ID;
  
  INSERT INTO CATEGORY (NAME, PRIORITY, COLOR)
  VALUES ('Sith Lord', 2, 'orange')
  RETURNING ID INTO L_CATEGORY_ID;
  
  INSERT INTO TODO_CATEGORY (IS_PLANNED, CATEGORY_ID, TODO_ID)
  VALUES ('F', L_CATEGORY_ID, L_TODO_ID);
  
  INSERT INTO TODO_COMMENT (BODY, USER_ID, TODO_ID)
  VALUES ('May the force be with you', L_TODO_USER_ID, L_TODO_ID);

  -- 2. Data for Darth Vader
  INSERT INTO TODO_USER (NAME, EMAIL)
  VALUES ('Darth Vader', 'black-attire@starwars.io')
  RETURNING ID INTO L_TODO_USER_ID;
  
  INSERT INTO TODO (TITLE, DESCRIPTION, DEADLINE, NOTIFICATIONS, USER_ID)
  VALUES ('The Empire Strikes Back', 'You underestimate the power of the dark side', SYSTIMESTAMP - INTERVAL '60' DAY, SYSTIMESTAMP - INTERVAL '60' DAY, L_TODO_USER_ID)
  RETURNING ID INTO L_TODO_ID;
  
  INSERT INTO CATEGORY (NAME, PRIORITY, COLOR)
  VALUES ('Sith Lord', 10, 'red')
  RETURNING ID INTO L_CATEGORY_ID;
  
  INSERT INTO TODO_CATEGORY (IS_PLANNED, CATEGORY_ID, TODO_ID)
  VALUES ('T', L_CATEGORY_ID, L_TODO_ID);
  
  INSERT INTO TODO_COMMENT (BODY, USER_ID, TODO_ID)
  VALUES ('Luke I am your father', L_TODO_USER_ID, L_TODO_ID);
  
  INSERT INTO TODO (TITLE, DESCRIPTION, DEADLINE, NOTIFICATIONS, USER_ID)
  VALUES ('Reunite with old friend Obi Wan Kenobi', 'Mentoring with Friend', SYSTIMESTAMP - INTERVAL '60' DAY, SYSTIMESTAMP - INTERVAL '60' DAY, L_TODO_USER_ID)
  RETURNING ID INTO L_TODO_ID;
  
  INSERT INTO CATEGORY (NAME, PRIORITY, COLOR)
  VALUES ('Jedi Master', 5, 'blue')
  RETURNING ID INTO L_CATEGORY_ID;
  
  INSERT INTO TODO_CATEGORY (IS_PLANNED, CATEGORY_ID, TODO_ID)
  VALUES ('T', L_CATEGORY_ID, L_TODO_ID);
  
  INSERT INTO TODO_COMMENT (BODY, USER_ID, TODO_ID)
  VALUES ('I must obey my master', L_TODO_USER_ID, L_TODO_ID);

  -- 3. Data for Princess Leia
  INSERT INTO TODO_USER (NAME, EMAIL)
  VALUES ('General Leia', 'princess@starwars.io')
  RETURNING ID INTO L_TODO_USER_ID;
  
  INSERT INTO TODO (TITLE, DESCRIPTION, DEADLINE, NOTIFICATIONS, USER_ID)
  VALUES ('Return of the Jedi', 'I feel very passionate about Luke', SYSTIMESTAMP - INTERVAL '60' DAY, SYSTIMESTAMP - INTERVAL '60' DAY, L_TODO_USER_ID)
  RETURNING ID INTO L_TODO_ID;
  
  INSERT INTO CATEGORY (NAME, PRIORITY, COLOR)
  VALUES ('Jedi Apprentice', 10, 'green')
  RETURNING ID INTO L_CATEGORY_ID;
  
  INSERT INTO TODO_CATEGORY (IS_PLANNED, CATEGORY_ID, TODO_ID)
  VALUES ('T', L_CATEGORY_ID, L_TODO_ID);
  
  INSERT INTO TODO_COMMENT (BODY, USER_ID, TODO_ID)
  VALUES ('My father was seduced by the dark side', L_TODO_USER_ID, L_TODO_ID);
  
  INSERT INTO TODO (TITLE, DESCRIPTION, DEADLINE, NOTIFICATIONS, USER_ID)
  VALUES ('Someone has to save our skins', 'Punishing Han Solo', SYSTIMESTAMP - INTERVAL '60' DAY, SYSTIMESTAMP - INTERVAL '60' DAY, L_TODO_USER_ID)
  RETURNING ID INTO L_TODO_ID;
  
  INSERT INTO CATEGORY (NAME, PRIORITY, COLOR)
  VALUES ('Jedi Master', 3, 'blue')
  RETURNING ID INTO L_CATEGORY_ID;
  
  INSERT INTO TODO_CATEGORY (IS_PLANNED, CATEGORY_ID, TODO_ID)
  VALUES ('F', L_CATEGORY_ID, L_TODO_ID);
  
  INSERT INTO TODO_COMMENT (BODY, USER_ID, TODO_ID)
  VALUES ('Punish Kylo Ren', L_TODO_USER_ID, L_TODO_ID);

  -- 4. Data for Han Solo
  INSERT INTO TODO_USER (NAME, EMAIL)
  VALUES ('Han Solo', 'i-heart-me-falcon@starwars.io')
  RETURNING ID INTO L_TODO_USER_ID;
  
  INSERT INTO TODO (TITLE, DESCRIPTION, DEADLINE, NOTIFICATIONS, USER_ID)
  VALUES ('A New Hope', 'I think Leia likes me', SYSTIMESTAMP - INTERVAL '60' DAY, SYSTIMESTAMP - INTERVAL '60' DAY, L_TODO_USER_ID)
  RETURNING ID INTO L_TODO_ID;
  
  INSERT INTO CATEGORY (NAME, PRIORITY, COLOR)
  VALUES ('Rebel Alliance', 10, 'blue')
  RETURNING ID INTO L_CATEGORY_ID;
  
  INSERT INTO TODO_CATEGORY (IS_PLANNED, CATEGORY_ID, TODO_ID)
  VALUES ('T', L_CATEGORY_ID, L_TODO_ID);
  
  INSERT INTO TODO_COMMENT (BODY, USER_ID, TODO_ID)
  VALUES ('When did I have a son', L_TODO_USER_ID, L_TODO_ID);
  
  INSERT INTO TODO (TITLE, DESCRIPTION, DEADLINE, NOTIFICATIONS, USER_ID)
  VALUES ('Dont everybody thank me at once', 'sometimes I amaze even myself', SYSTIMESTAMP - INTERVAL '60' DAY, SYSTIMESTAMP - INTERVAL '60' DAY, L_TODO_USER_ID)
  RETURNING ID INTO L_TODO_ID;
  
  INSERT INTO CATEGORY (NAME, PRIORITY, COLOR)
  VALUES ('Jedi Master', 7, 'green')
  RETURNING ID INTO L_CATEGORY_ID;
  
  INSERT INTO TODO_CATEGORY (IS_PLANNED, CATEGORY_ID, TODO_ID)
  VALUES ('F', L_CATEGORY_ID, L_TODO_ID);
  
  INSERT INTO TODO_COMMENT (BODY, USER_ID, TODO_ID)
  VALUES ('Payback Lando', L_TODO_USER_ID, L_TODO_ID);

  -- 4. Data for Darth Sidious
  INSERT INTO TODO_USER (NAME, EMAIL)
  VALUES ('Darth Sidious', 'evilsenator@starwars.io')
  RETURNING ID INTO L_TODO_USER_ID;
  
  INSERT INTO TODO (TITLE, DESCRIPTION, DEADLINE, NOTIFICATIONS, USER_ID)
  VALUES ('Revenge of the Sith', 'Unlimited Power', SYSTIMESTAMP - INTERVAL '60' DAY, SYSTIMESTAMP - INTERVAL '60' DAY, L_TODO_USER_ID)
  RETURNING ID INTO L_TODO_ID;
  
  INSERT INTO CATEGORY (NAME, PRIORITY, COLOR)
  VALUES ('Sith Lord', 10, 'black')
  RETURNING ID INTO L_CATEGORY_ID;
  
  INSERT INTO TODO_CATEGORY (IS_PLANNED, CATEGORY_ID, TODO_ID)
  VALUES ('T', L_CATEGORY_ID, L_TODO_ID);
  
  INSERT INTO TODO_COMMENT (BODY, USER_ID, TODO_ID)
  VALUES ('the Sith will rule the galaxy and we shall have peace', L_TODO_USER_ID, L_TODO_ID);
  
  -- 5. Data for Yoda
  INSERT INTO TODO_USER (NAME, EMAIL)
  VALUES ('Master Yoda', 'green-guys-need-love-2@starwars.io')
  RETURNING ID INTO L_TODO_USER_ID;
  
  INSERT INTO TODO (TITLE, DESCRIPTION, DEADLINE, NOTIFICATIONS, USER_ID)
  VALUES ('Do or do not - there is no try', 'that is why you fail', SYSTIMESTAMP - INTERVAL '60' DAY, SYSTIMESTAMP - INTERVAL '60' DAY, L_TODO_USER_ID)
  RETURNING ID INTO L_TODO_ID;
  
  INSERT INTO CATEGORY (NAME, PRIORITY, COLOR)
  VALUES ('Jedi Master', 10, 'green')
  RETURNING ID INTO L_CATEGORY_ID;
  
  INSERT INTO TODO_CATEGORY (IS_PLANNED, CATEGORY_ID, TODO_ID)
  VALUES ('T', L_CATEGORY_ID, L_TODO_ID);
  
  INSERT INTO TODO_COMMENT (BODY, USER_ID, TODO_ID)
  VALUES ('patience you must have, my young padawan', L_TODO_USER_ID, L_TODO_ID);
  
  -- 6. Data for Batch Users
  INSERT INTO TODO_USER (NAME, EMAIL)
  VALUES ('Chewbacca', 'no-i-dont-know-bigfoot@starwars.io');

  INSERT INTO TODO_USER (NAME, EMAIL)
  VALUES ('R2D2', 'beep-boop-beep@starwars.io');
  
  INSERT INTO TODO_USER (NAME, EMAIL)
  VALUES ('C-3PO', 'thisismadness@starwars.io');

  INSERT INTO TODO_USER (NAME, EMAIL)
  VALUES ('Boba Fett', 'mandalorian@starwars.io');  

  COMMIT;
END;
/
*/

/* START OF 20 SQL SELECT STATEMENTS */

-- Select all columns and all rows from one table

SELECT * FROM TODO_USER;

-- Select 5 columns and all rows from one table

SELECT USER_ID,ID,TITLE,DESCRIPTION,DEADLINE FROM TODO;

-- Select all columns and all rows from one view

SELECT * FROM VIEW_TODO_COMMENTS;

-- Using a join on 2 tables, select all columns and all rows from the tables without the use of a Cartesian product

SELECT * FROM TODO_USER, TODO;

-- Select and order data retrieved from one table

SELECT * FROM TODO_COMMENT ORDER BY TODO_ID;

-- Using a join on 3 tables, select 5 columns from the 3 tables. Use syntax that would limit the output to 10 rows

SELECT TODO.ID, TODO.TITLE, TODO.DESCRIPTION, TODO.DEADLINE, TODO_COMMENT.ID, TODO_USER.ID
FROM (TODO INNER JOIN TODO_COMMENT ON TODO.ID=TODO_COMMENT.TODO_ID) INNER JOIN TODO_USER ON TODO_COMMENT.USER_ID=TODO_USER.ID
WHERE ROWNUM<11;

-- vii.	Select distinct rows using joins on 3 tables

SELECT DISTINCT CATEGORY.ID, todo_category.ID
FROM (CATEGORY INNER JOIN todo_category ON CATEGORY.ID=todo_category.category_id) INNER JOIN todo ON todo_category.todo_id=todo.ID;


/*
viii.	Use group by & having in a select statement using one or more tables.
ix.	Use IN clause to select data from one or more tables.
x.	Select Length of one column from one table (use Length function)
xi.	Use the SQL DELETE statement to delete one record from one table. Add select statements to demonstrate the table contents before and after the DELETE statement. Make sure to use ROLLBACK afterwards so that the data will not be physically removed. For example:
-- Query 11: use the SLQ DELETE statement to delete one record from one table
-- Business purpose: delete the HR department
DELETE FROM DEPARTMENT WHERE DEPT_NAME = 'HR'; 
-- revert the change
ROLLBACK;
xii.	Use the SQL UPDATE statement to change some data. Add select statements to demonstrate the table contents before and after the UPDATE statement. You can either COMMIT or ROLLBACK afterwards. For example:
-- Query 12: use the SQL UPDATE statement to change some data
-- Business purpose: change the location of HR department to Largo, MD 
UPDATE DEPARTMENT SET DEPT_LOCATION = 'Largo, MD' WHERE DEPT_NAME = 'HR';
-- revert the change
ROLLBACK;
xiii.	Perform 8 additional advanced (multiple table joins, sub-queries, aggregate, etc.) SQL statements.
*/



