-- cursor
USE DB;

CREATE TABLE SALES_TAX(
    STATE CHAR(2) PRIMARY KEY,
    TAX_RATE FLOAT8 NOT NULL
);

CREATE TABLE CUSTOMER(
    C_ID INT PRIMARY KEY,
    C_NAME VARCHAR(50) NOT NULL,
    PRODUCT_PURCHASED VARCHAR(50) NOT NULL,
    PRICE_OF_PRODUCT DECIMAL NOT NULL,
    CITY VARCHAR(50) NOT NULL,
    STATE CHAR(2),
    FOREIGN KEY(STATE) REFERENCES SALES_TAX(STATE)
);

DROP TABLE SALES_TAX;

INSERT INTO SALES_TAX VALUES(
    "CA",
    13.3
);

INSERT INTO SALES_TAX VALUES(
    "HW",
    11
);

INSERT INTO SALES_TAX VALUES(
    "NY",
    10.9
);

INSERT INTO CUSTOMER VALUES(
    1,
    "Sam",
    "Comics",
    120,
    "Uptown",
    "NY"
);

INSERT INTO CUSTOMER VALUES(
    2,
    "Deven",
    "Figurines",
    850,
    "Downtown",
    "HW"
);

INSERT INTO CUSTOMER VALUES(
    3,
    "Denis",
    "Clothes",
    350,
    "Greenwich",
    "CA"
);

SELECT
    C_NAME,
    PRICE_OF_PRODUCT,
    CITY,
    TAX_RATE DELIMITER // CREATE PROCEDURE GETTAX() BEGIN DECLARE FINISHED INT DEFAULT 0;

DECLARE
    CUSNAME   VARCHAR(50);
    DECLARE   TAXPAID FLOAT;
    DECLARE   TAXRATE FLOAT;
    DECLARE   CITY VARCHAR(50);
    DECLARE   STATE CHAR(2);
    DECLARE   CURSOR_TAX CURSOR FOR
    SELECT
        C.C_NAME,
        C.PRICE_OF_PRODUCT,
        C.CITY,
        S.STATE,
        S.TAX_RATE
    FROM
        CUSTOMER C
        JOIN SALES_TAX S
    WHERE
        C.STATE = S.STATE;
    DECLARE   CONTINUE HANDLER FOR NOT FOUND SET FINISHED = 1;
    OPEN      CURSOR_TAX;
    STARTLOOP : LOOP
        BEGIN
            FETCH CURSOR_TAX INTO CUSNAME, TAXPAID, CITY, STATECODE, TAXRATE;
            IF FINISHED = 1 THEN
                LEAVE STARTLOOP;
            END IF;
            SET TAXPAID = TAXPAID * TAXRATE / 100;
            SELECT
                CUSNAME,
                TAXPAID,
                CITY,
                STATECODE;
        END;
    END LOOP STARTLOOP;
END// DELIMITER;
DROP      PROCEDURE GETTAX;
CALL      GETTAX();