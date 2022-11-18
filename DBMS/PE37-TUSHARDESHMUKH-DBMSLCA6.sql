DROP DATABASE AIRLINE;

CREATE DATABASE AIRLINE;

USE AIRLINE;

CREATE TABLE FLIGHT_DETAILS(
    FLIGHT_ID INT AUTO_INCREMENT,
    DEP_DATE DATE NOT NULL,
    PRICE INT NOT NULL,
    AVAILABLE_SEATS INT NOT NULL DEFAULT 0 CHECK(AVAILABLE_SEATS >= 0),
    PRIMARY KEY(FLIGHT_ID)
);

CREATE TABLE PASSENGER(
    PASSENGER_ID INT AUTO_INCREMENT,
    FIRST_NAME VARCHAR(30) NOT NULL,
    LAST_NAME VARCHAR(30) NOT NULL,
    PHONE VARCHAR(10) NOT NULL,
    EMAIL VARCHAR(30) NOT NULL,
    AGE INT NOT NULL,
    PRIMARY KEY(PASSENGER_ID)
);

CREATE TABLE TICKET(
    TICKET_ID INT AUTO_INCREMENT,
    PASSENGER_ID INT NOT NULL,
    FLIGHT_ID INT NOT NULL,
    DEPART_DATE DATE NOT NULL,
    STATUS VARCHAR(20) NOT NULL,
    PRIMARY KEY(TICKET_ID),
    FOREIGN KEY(PASSENGER_ID) REFERENCES PASSENGER(PASSENGER_ID),
    FOREIGN KEY(FLIGHT_ID) REFERENCES FLIGHT_DETAILS(FLIGHT_ID)
);

ALTER TABLE FLIGHT_DETAILS AUTO_INCREMENT = 1000;

ALTER TABLE PASSENGER AUTO_INCREMENT = 100;

ALTER TABLE TICKET AUTO_INCREMENT = 10000;

DESC FLIGHT_DETAILS;

DESC PASSENGER;

INSERT INTO FLIGHT_DETAILS VALUES(
    NULL,
    '2020-08-20',
    2000,
    50
);

INSERT INTO FLIGHT_DETAILS VALUES(
    NULL,
    '2020-08-24',
    3000,
    40
);

INSERT INTO FLIGHT_DETAILS VALUES(
    NULL,
    '2020-08-25',
    4200,
    20
);

INSERT INTO PASSENGER VALUES(
    NULL,
    'Tushar',
    'Dodo',
    '6969696969',
    'dodo@gmail.com',
    20
);

INSERT INTO PASSENGER VALUES(
    NULL,
    'Dean',
    'Winchister',
    '7458612563',
    'deanwinchi@gmail.com',
    28
);

INSERT INTO PASSENGER VALUES(
    NULL,
    'Sam',
    'Winchister',
    '8574237469',
    'samwin@gmail.com',
    25
);

DELIMITER
/

CREATE PROCEDURE BOOK(
    IN P_ID INT,
    IN F_ID INT,
    IN DEPTDATE DATE,
    OUT RESULT VARCHAR(30)
)
BEGIN
    DECLARE
        V         INT;
        DECLARE   ID INT;
        SELECT    AVAILABLE_SEATS INTO V FROM FLIGHT_DETAILS WHERE FLIGHT_ID = F_ID;
        INSERT    INTO TICKET VALUES(NULL, P_ID, F_ID, DEPTDATE, 'waiting');
        SELECT    LAST_INSERT_ID() INTO ID;
        IF        V > 0 THEN
            BEGIN UPDATE TICKET SET STATUS='confirmed' WHERE TICKET_ID = ID;
            UPDATE    FLIGHT_DETAILS SET AVAILABLE_SEATS = AVAILABLE_SEATS - 1 WHERE FLIGHT_ID = F_ID;
            SELECT    "success" INTO RESULT;
        END;
        ELSE     
        SELECT
            "waiting" INTO RESULT;
    END IF;
END/ CALL BOOK(100, 1000, '2020-08-20', @M);
    SELECT
        @M;
    SELECT
        *
    FROM
        TICKET;
    SELECT
        *
    FROM
        FLIGHT_DETAILS;
    CALL BOOK(100, 1002, '2020-08-24', @M);
    SELECT
        @M;
    SELECT
        *
    FROM
        TICKET;
    SELECT
        *
    FROM
        FLIGHT_DETAILS;
    CALL BOOK(100, 1001, '2020-08-24', @M);
    SELECT
        @M;
    SELECT
        *
    FROM
        TICKET;
    SELECT
        *
    FROM
        FLIGHT_DETAILS;
    DELIMITER / CREATE DEFINER=`ROOT`@`LOCALHOST` FUNCTION `TICKET_CONFIRMATION`(FIRSTNAME VARCHAR(20), LASTNAME VARCHAR(20)) RETURNS VARCHAR(20) CHARSET UTF8MB4 DETERMINISTIC
    BEGIN
        DECLARE
            ISCONFIRMED VARCHAR(20);
            SELECT      STATUS INTO ISCONFIRMED FROM TICKET WHERE PASSENGER_ID = (
                SELECT
                    PASSENGER_ID
                FROM
                    PASSENGER
                WHERE
                    FIRST_NAME = FIRSTNAME
                    AND LAST_NAME = LASTNAME
            );
            RETURN      ISCONFIRMED;
        END