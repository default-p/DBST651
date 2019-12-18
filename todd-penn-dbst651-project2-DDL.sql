SET ECHO ON;
SET SERVEROUTPUT ON;
SET LINESIZE 150;
SET PAGESIZE 30;

DROP TABLE LIBRARY CASCADE CONSTRAINTS PURGE;
DROP TABLE BRANCH CASCADE CONSTRAINTS PURGE;
DROP TABLE CATALOG_COPY CASCADE CONSTRAINTS PURGE;
DROP TABLE CATALOG CASCADE CONSTRAINTS PURGE;
DROP TABLE DVD CASCADE CONSTRAINTS PURGE;
DROP TABLE BOOK CASCADE CONSTRAINTS PURGE;
DROP TABLE CHECKOUT CASCADE CONSTRAINTS PURGE;
DROP TABLE LIBRARY_CARD CASCADE CONSTRAINTS PURGE;
DROP TABLE CUSTOMER_CARD CASCADE CONSTRAINTS PURGE;
DROP TABLE CUSTOMER CASCADE CONSTRAINTS PURGE;

/*
DROP SEQUENCE TODO_USER_ID_SEQ;
DROP SEQUENCE TODO_ID_SEQ;
DROP SEQUENCE TODO_COMMENT_ID_SEQ;
DROP SEQUENCE TODO_CATEGORY_ID_SEQ;
DROP SEQUENCE CATEGORY_ID_SEQ;
*/

CREATE TABLE LIBRARY (
  LIBRARY_ID NUMBER(10),
  LIBRARY_NAME VARCHAR2(50),
  PHONE VARCHAR2(150),
  ADDRESS VARCHAR2(150),
  CONSTRAINT LIBRARY_PK PRIMARY KEY (LIBRARY_ID)  
);

CREATE TABLE BRANCH (
  BRANCH_ID NUMBER(10),
  BRANCH_NAME VARCHAR2(50),
  PHONE VARCHAR2(150),
  ADDRESS VARCHAR2(150),
  LIBRARY_ID NUMBER(10),
  CONSTRAINT BRANCH_PK PRIMARY KEY (BRANCH_ID),
  CONSTRAINT LIBRARY_ID_BRANCH_FK FOREIGN KEY (LIBRARY_ID) REFERENCES LIBRARY (LIBRARY_ID)
);

CREATE TABLE DVD (
  DVD_ID NUMBER(10),
  GENRE VARCHAR2(300),
  DVD_LENGTH VARCHAR(50),
  CONSTRAINT DVD_PK PRIMARY KEY (DVD_ID)
);

CREATE TABLE BOOK (
  ISBN VARCHAR2(150),
  GENRE VARCHAR2(300),
  PAGE_LENGTH NUMBER(10),
  CONSTRAINT BOOK_PK PRIMARY KEY (ISBN)
);

CREATE TABLE CATALOG (
  CATALOG_ID NUMBER(10),
  TITLE VARCHAR2(150),
  DESCRIPTION VARCHAR2(300),
  RELEASE_DATE DATE,
  TYPE VARCHAR2(150),
  PUBLISHER VARCHAR2(150),  
  ISBN VARCHAR2(150),
  DVD_ID NUMBER(10),
  CONSTRAINT CATALOG_PK PRIMARY KEY (CATALOG_ID),
  CONSTRAINT BOOK_ISBN_CATALOG_FK FOREIGN KEY (ISBN) REFERENCES BOOK (ISBN),
  CONSTRAINT DVD_ID_CATALOG_FK FOREIGN KEY (DVD_ID) REFERENCES DVD (DVD_ID)
);

CREATE TABLE CATALOG_COPY (
  COPY_NUMBER NUMBER(10),  
  CATALOG_ID NUMBER(10),
  BRANCH_ID NUMBER(10),
  PURCHASE_DATE DATE,
  VENDOR_NAME VARCHAR2(50),
  CONSTRAINT CATALOG_COPY_PK PRIMARY KEY (COPY_NUMBER),  
  CONSTRAINT CATALOG_ID_CATALOG_COPY_FK FOREIGN KEY (CATALOG_ID) REFERENCES CATALOG (CATALOG_ID),
  CONSTRAINT BRANCH_ID_CATALOG_COPY_FK FOREIGN KEY (BRANCH_ID) REFERENCES BRANCH (BRANCH_ID)
);

CREATE TABLE LIBRARY_CARD (
  LIBRARY_CARD_NUMBER NUMBER(10),
  LIBRARY_ID NUMBER(10),
  PIN NUMBER(10), 
  ISSUE_DATE DATE,
  EXPIRATION_DATE DATE,
  CURRENT_BALANCE NUMBER(10),
  CONSTRAINT LIBRARY_CARD_LBC_NUMBER_PK PRIMARY KEY (LIBRARY_CARD_NUMBER),
  CONSTRAINT LIBRARY_ID_LIBRARY_CARD_FK FOREIGN KEY (LIBRARY_ID) REFERENCES LIBRARY (LIBRARY_ID)
);

CREATE TABLE CHECKOUT (
  LIBRARY_CARD_NUMBER NUMBER(10),
  LIBRARY_ID NUMBER(10),
  COPY_NUMBER NUMBER(10), 
  CHECKOUT_DATE DATE,
  DUE_DATE DATE,
  RETURN_DATE DATE,
  CONSTRAINT CATALOG_COPY_CHECKOUT_FK FOREIGN KEY (COPY_NUMBER) REFERENCES CATALOG_COPY (COPY_NUMBER),
  CONSTRAINT LBC_NUMBER_CHECKOUT_FK FOREIGN KEY (LIBRARY_CARD_NUMBER) REFERENCES LIBRARY_CARD (LIBRARY_CARD_NUMBER),
  CONSTRAINT LIBRARY_ID_CHECKOUT_FK FOREIGN KEY (LIBRARY_ID) REFERENCES LIBRARY (LIBRARY_ID)
);

CREATE TABLE CUSTOMER (
  CUSTOMER_ID NUMBER(10),
  NAME VARCHAR2(50),
  PHONE VARCHAR2(150),
  ADDRESS VARCHAR2(150),
  CONSTRAINT CUSTOMER_CUSTOMER_ID_PK PRIMARY KEY (CUSTOMER_ID)
);

CREATE TABLE CUSTOMER_CARD (
  LIBRARY_CARD_NUMBER NUMBER(10),
  CUSTOMER_ID NUMBER(10),
  DESCRIPTION VARCHAR2(300),
  CONSTRAINT LBC_NUMBER_CUSTOMER_CARD_FK FOREIGN KEY (LIBRARY_CARD_NUMBER) REFERENCES LIBRARY_CARD (LIBRARY_CARD_NUMBER),
  CONSTRAINT CUSTOMER_CARD_CUSTOMER_FK FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER (CUSTOMER_ID)
);

/*



DESCRIBE TODO_USER;
DESCRIBE TODO_COMMENT;
DESCRIBE TODO;
DESCRIBE CATEGORY;
DESCRIBE TODO_CATEGORY;

CREATE INDEX TODO_USER_NAME_FK_IDX ON TODO_USER
 (ID,NAME);
 
CREATE INDEX TODO_COMMENT_TEXT_FK_IDX ON TODO_COMMENT
 (TODO_ID,USER_ID,BODY);
 
CREATE INDEX TODO_TITLE_FK_IDX ON TODO
 (ID,USER_ID,TITLE);
 
CREATE INDEX TODO_SUSPENSE_FK_IDX ON TODO
 (ID,USER_ID,TITLE,DEADLINE);
 
CREATE INDEX TODO_DETAILS_FK_IDX ON TODO
 (ID,USER_ID,TITLE,DESCRIPTION,DEADLINE);
 
CREATE OR REPLACE VIEW VIRTUAL_TODO_CATEGORIES AS
SELECT 
  C.ID, 
  C.NAME, 
  C.PRIORITY, 
  C.COLOR, 
  TC.IS_PLANNED
FROM CATEGORY C INNER JOIN TODO_CATEGORY TC
ON C.ID=TC.CATEGORY_ID;
      
CREATE OR REPLACE VIEW VIRTUAL_TODO_ITEMS AS
SELECT 
  T.ID, 
  T.TITLE, 
  T.DESCRIPTION, 
  T.DEADLINE, 
  T.NOTIFICATIONS, 
  T.USER_ID, 
  U.NAME
FROM TODO T INNER JOIN TODO_USER U
ON T.USER_ID=U.ID;

CREATE OR REPLACE VIEW VIEW_TODO_ITEMS AS
SELECT 
  ID, 
  TITLE, 
  DESCRIPTION, 
  DEADLINE, 
  NOTIFICATIONS, 
  USER_ID 
FROM TODO;

CREATE OR REPLACE VIEW VIEW_TODO_COMMENTS AS
SELECT 
  ID, 
  BODY, 
  USER_ID, 
  TODO_ID
FROM TODO_COMMENT;
      
DESCRIBE VIRTUAL_TODO_CATEGORIES;
DESCRIBE VIRTUAL_TODO_ITEMS;
DESCRIBE VIEW_TODO_ITEMS;
DESCRIBE VIEW_TODO_COMMENTS;

CREATE SEQUENCE TODO_USER_ID_SEQ
 INCREMENT BY 1
 START WITH 10000
/

CREATE SEQUENCE TODO_ID_SEQ
 INCREMENT BY 1
 START WITH 1
/

CREATE SEQUENCE TODO_COMMENT_ID_SEQ
 INCREMENT BY 1
 START WITH 100
/

CREATE SEQUENCE CATEGORY_ID_SEQ
 INCREMENT BY 10
 START WITH 50
/

CREATE SEQUENCE TODO_CATEGORY_ID_SEQ
 INCREMENT BY 1
 START WITH 1000
/

CREATE OR REPLACE TRIGGER TODO_USER_ID_TRIGGER
BEFORE INSERT OR UPDATE ON TODO_USER 
FOR EACH ROW
WHEN (NEW.ID IS NULL)
BEGIN
  SELECT TODO_USER_ID_SEQ.NEXTVAL
  INTO   :NEW.ID
  FROM   DUAL;
  
  IF INSERTING THEN
    IF :NEW.CREATED_AT IS NULL THEN :NEW.CREATED_AT := SYSTIMESTAMP - INTERVAL '90' DAY; END IF;
  END IF;
  
  IF INSERTING OR UPDATING THEN
    IF :NEW.UPDATED_AT IS NULL THEN :NEW.UPDATED_AT := SYSTIMESTAMP - INTERVAL '20' DAY; END IF;
  END IF;  
END;
/

CREATE OR REPLACE TRIGGER TODO_ID_TRIGGER
BEFORE INSERT OR UPDATE ON TODO 
FOR EACH ROW
WHEN (NEW.ID IS NULL)
BEGIN
  SELECT TODO_ID_SEQ.NEXTVAL
  INTO   :NEW.ID
  FROM   DUAL;
  
  IF INSERTING THEN
    IF :NEW.CREATED_AT IS NULL THEN :NEW.CREATED_AT := SYSTIMESTAMP - INTERVAL '90' DAY; END IF;
  END IF;
  
  IF INSERTING OR UPDATING THEN
    IF :NEW.UPDATED_AT IS NULL THEN :NEW.UPDATED_AT := SYSTIMESTAMP - INTERVAL '20' DAY; END IF;
  END IF;  
END;
/

CREATE OR REPLACE TRIGGER TODO_COMMENT_ID_TRIGGER
BEFORE INSERT OR UPDATE ON TODO_COMMENT 
FOR EACH ROW
WHEN (NEW.ID IS NULL)
BEGIN
  SELECT TODO_COMMENT_ID_SEQ.NEXTVAL
  INTO   :NEW.ID
  FROM   DUAL;
  
  IF INSERTING THEN
    IF :NEW.CREATED_AT IS NULL THEN :NEW.CREATED_AT := SYSTIMESTAMP - INTERVAL '90' DAY; END IF;
  END IF;
  
  IF INSERTING OR UPDATING THEN
    IF :NEW.UPDATED_AT IS NULL THEN :NEW.UPDATED_AT := SYSTIMESTAMP - INTERVAL '20' DAY; END IF;
  END IF;  
END;
/

CREATE OR REPLACE TRIGGER CATEGORY_ID_TRIGGER
BEFORE INSERT OR UPDATE ON CATEGORY
FOR EACH ROW
WHEN (NEW.ID IS NULL)
BEGIN
  SELECT CATEGORY_ID_SEQ.NEXTVAL
  INTO   :NEW.ID
  FROM   DUAL;
  
  IF INSERTING THEN
    IF :NEW.CREATED_AT IS NULL THEN :NEW.CREATED_AT := SYSTIMESTAMP - INTERVAL '90' DAY; END IF;
  END IF;
  
  IF INSERTING OR UPDATING THEN
    IF :NEW.UPDATED_AT IS NULL THEN :NEW.UPDATED_AT := SYSTIMESTAMP - INTERVAL '20' DAY; END IF;
  END IF;  
END;
/

CREATE OR REPLACE TRIGGER TODO_CATEGORY_ID_TRIGGER
BEFORE INSERT OR UPDATE ON TODO_CATEGORY
FOR EACH ROW
WHEN (NEW.ID IS NULL)
BEGIN
  SELECT TODO_CATEGORY_ID_SEQ.NEXTVAL
  INTO   :NEW.ID
  FROM   DUAL;
  
  IF INSERTING THEN
    IF :NEW.CREATED_AT IS NULL THEN :NEW.CREATED_AT := SYSTIMESTAMP - INTERVAL '90' DAY; END IF;
  END IF;
  
  IF INSERTING OR UPDATING THEN
    IF :NEW.UPDATED_AT IS NULL THEN :NEW.UPDATED_AT := SYSTIMESTAMP - INTERVAL '20' DAY; END IF;
  END IF;  
END;
/
*/
