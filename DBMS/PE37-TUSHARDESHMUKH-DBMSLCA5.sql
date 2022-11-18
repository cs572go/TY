USE DB;

CREATE TABLE PROJECT(
    PROJECT_ID INT,
    PROJ_NAME VARCHAR(200) NOT NULL,
    CHIEF_ARCH VARCHAR(200),
    PRIMARY KEY(PROJECT_ID)
);

CREATE TABLE EMPLOYEE(
    EMP_ID INT,
    EMP_NAME VARCHAR(200) NOT NULL,
    PRIMARY KEY(EMP_ID)
);

CREATE TABLE ASSIGNEDTO(
    PROJECT_ID INT,
    EMP_ID INT,
    WORK_HRS INT DEFAULT 0,
    FOREIGN KEY(PROJECT_ID) REFERENCES PROJECT(PROJECT_ID),
    FOREIGN KEY(EMP_ID) REFERENCES EMPLOYEE(EMP_ID),
    PRIMARY KEY(PROJECT_ID, EMP_ID)
);

INSERT INTO PROJECT VALUES(
    353,
    "database",
    NULL
);

INSERT INTO PROJECT VALUES(
    354,
    "DBMS",
    NULL
);

INSERT INTO PROJECT VALUES(
    453,
    "Web3",
    NULL
);

INSERT INTO EMPLOYEE VALUES(
    101,
    "Xerxes"
);

INSERT INTO EMPLOYEE VALUES(
    102,
    "Smith"
);

INSERT INTO EMPLOYEE VALUES(
    103,
    "David"
);

INSERT INTO EMPLOYEE VALUES(
    104,
    "Amit"
);

INSERT INTO EMPLOYEE VALUES(
    105,
    "Sam"
);

DESC ASSIGNEDTO;

INSERT INTO ASSIGNEDTO VALUES(
    353,
    101,
    50
);

INSERT INTO ASSIGNEDTO VALUES(
    353,
    102,
    39
);

INSERT INTO ASSIGNEDTO VALUES(
    353,
    103,
    42
);

INSERT INTO ASSIGNEDTO VALUES(
    354,
    102,
    18
);

INSERT INTO ASSIGNEDTO VALUES(
    354,
    103,
    42
);

INSERT INTO ASSIGNEDTO VALUES(
    453,
    104,
    17
);

INSERT INTO ASSIGNEDTO VALUES(
    354,
    104,
    18
);

INSERT INTO ASSIGNEDTO VALUES(
    453,
    105,
    18
);

UPDATE PROJECT
SET
    CHIEF_ARCH = "Smith"
WHERE
    PROJECT_ID = 353;

UPDATE PROJECT
SET
    CHIEF_ARCH = "David"
WHERE
    PROJECT_ID = 354;

UPDATE PROJECT
SET
    CHIEF_ARCH = "Amit"
WHERE
    PROJECT_ID = 453;

SELECT
    *
FROM
    ASSIGNEDTO;

-- next exrecise table in assign 2 and in duty_alloc change it to date datatype


CREATE DATABASE PE35;

CREATE TABLE PE35.ROOM(
    R_NUMBER INT PRIMARY KEY,
    CAPACITY INT DEFAULT(0) CHECK(CAPACITY >= 0),
    BUILDING VARCHAR(2) UNIQUE NOT NULL
);

CREATE TABLE PE35.COURSE(
    C_NUMBER INT PRIMARY KEY,
    C_NAME VARCHAR(30) UNIQUE NOT NULL,
    DEPARTMENT VARCHAR(30) NOT NULL
);

CREATE TABLE PE35.SECTION(
    C_NUMBER INT,
    S_NUMBER INT,
    ENROLLMENT INT DEFAULT(0) CHECK(ENROLLMENT >= 0),
    PRIMARY KEY(C_NUMBER, S_NUMBER),
    FOREIGN KEY(C_NUMBER) REFERENCES PE35.COURSE(C_NUMBER)
);

CREATE TABLE PE35.EXAM(
    C_NUMBER INT,
    S_NUMBER INT,
    R_NUMBER INT,
    TIME_EXAM DATETIME NOT NULL,
    FOREIGN KEY(C_NUMBER, S_NUMBER) REFERENCES PE35.SECTION(C_NUMBER, S_NUMBER),
    FOREIGN KEY(R_NUMBER) REFERENCES PE35.ROOM(R_NUMBER),
    PRIMARY KEY(C_NUMBER, S_NUMBER, R_NUMBER)
);

INSERT INTO PE35.ROOM VALUES(
    1,
    60,
    'DR'
);

INSERT INTO PE35.ROOM VALUES(
    2,
    100,
    'CH'
);

INSERT INTO PE35.ROOM VALUES(
    3,
    110,
    'KS'
);

INSERT INTO PE35.COURSE VALUES(
    1,
    "DBMS",
    "Data Analytics"
);

INSERT INTO PE35.COURSE VALUES(
    2,
    "ML",
    "Artificial Intelligence"
);

INSERT INTO PE35.COURSE VALUES(
    3,
    "ICS",
    "CET"
);

INSERT INTO PE35.SECTION VALUES(
    1,
    2,
    40
);

INSERT INTO PE35.SECTION VALUES(
    3,
    1,
    60
);

INSERT INTO PE35.SECTION VALUES(
    3,
    5,
    80
);

INSERT INTO PE35.SECTION VALUES(
    3,
    6,
    80
);

INSERT INTO PE35.SECTION VALUES(
    3,
    4,
    80
);

INSERT INTO PE35.SECTION VALUES(
    3,
    7,
    80
);

INSERT INTO PE35.EXAM VALUES(
    1,
    2,
    1,
    "2022-12-12 12:12:00"
);

INSERT INTO PE35.EXAM VALUES(
    3,
    1,
    2,
    "2022-12-12 12:12:00"
);

INSERT INTO PE35.EXAM VALUES(
    3,
    3,
    3,
    "2022-12-12 12:12:00"
);

SELECT
    *
FROM
    PE35.ROOM;

SELECT
    *
FROM
    PE35.SECTION;

SELECT
    *
FROM
    PE35.EXAM;

SELECT
    *
FROM
    PE35.COURSE;

JOIN

SET 1

SELECT
    E.*
FROM
    EMPLOYEE   E
    JOIN ASSIGNEDTO A
    ON E.EMP_ID = A.EMP_ID
WHERE
    A.PROJECT_ID = 353;

-- q1
SELECT
    EMP_ID
FROM
    ASSIGNEDTO
WHERE
    PROJECT_ID = 353;

-- q2
SELECT
    E.*
FROM
    EMPLOYEE   E
    JOIN PROJECT P JOIN ASSIGNEDTO A
WHERE
    E.EMP_ID = A.EMP_ID
    AND A.PROJECT_ID = P.PROJECT_ID
    AND P.PROJ_NAME = "database";

-- q3
SELECT
    E.*
FROM
    EMPLOYEE   E
    JOIN ASSIGNEDTO A
    ON E.EMP_ID = A.EMP_ID
WHERE
    A.EMP_ID IN (
        SELECT
            DISTINCT A.EMP_ID
        FROM
            EMPLOYEE   E
            JOIN ASSIGNEDTO A
            ON E.EMP_ID = A.EMP_ID
        WHERE
            A.PROJECT_ID = 353
    )
    AND A.PROJECT_ID = 354;

-- q4
SELECT
    DISTINCT E.*
FROM
    EMPLOYEE   E
    JOIN ASSIGNEDTO A
    ON E.EMP_ID = A.EMP_ID
WHERE
    A.EMP_ID NOT IN (
        SELECT
            DISTINCT EMP_ID
        FROM
            ASSIGNEDTO
        WHERE
            PROJECT_ID = 453
    );

-- q5
SELECT
    *
FROM
    EMPLOYEE
WHERE
    EMP_NAME LIKE "s%";

-- q6
SELECT
    *
FROM
    PROJECT
WHERE
    CHIEF_ARCH = "smith";

-- q7
DELETE A.* FROM ASSIGNEDTO A JOIN PROJECT P
WHERE
    A.PROJECT_ID = P.PROJECT_ID
    AND P.PROJ_NAME = "DBMS";

-- q8
SELECT
    PROJECT_ID
FROM
    ASSIGNEDTO
WHERE
    EMP_ID = 101;

-- q9



CREATE VIEW EMPL_PROJ AS (
    SELECT DISTINCT E.* FROM EMPLOYEE E JOIN ASSIGNEDTO A ON E.EMP_ID = A.EMP_ID WHERE A.PROJECT_ID != 453
);

-- q10

-- Set 2
SELECT
    C.*,
    COUNT(S.S_NUMBER)
FROM
    COURSE  C
    JOIN SECTION S
WHERE
    C.C_NUMBER = S.C_NUMBER
GROUP BY
    C_NUMBER;

-- q1
SELECT
    C.*,
    COUNT(S.S_NUMBER)
FROM
    COURSE  C
    JOIN SECTION S
WHERE
    C.C_NUMBER = S.C_NUMBER
    AND C.DEPARTMENT = "CET"
GROUP BY
    C_NUMBER;

-- q2
SELECT
    C.*,
    COUNT(S.S_NUMBER)
FROM
    COURSE  C
    JOIN SECTION S
WHERE
    C.C_NUMBER = S.C_NUMBER
    AND C.DEPARTMENT = "CET"
GROUP BY
    C_NUMBER
HAVING
    COUNT(S.S_NUMBER) > 5;

-- q3
SELECT
    C.*
FROM
    COURSE C
    JOIN ROOM R JOIN EXAM E
WHERE
    C.C_NUMBER = E.C_NUMBER
    AND R.R_NUMBER = E.R_NUMBER
    AND BUILDING = "DR";

-- q4
SELECT
    E.*
FROM
    EXAM   E
    JOIN COURSE C
WHERE
    C.C_NUMBER = E.C_NUMBER
    AND C_NAME = "DBMS";

-- q5
SELECT
    R.*
FROM
    EXAM   E
    JOIN ROOM R JOIN COURSE C
WHERE
    E.R_NUMBER = R.R_NUMBER
    AND E.C_NUMBER = C.C_NUMBER
    AND C.C_NAME = "DBMS";

-- q6
SELECT
    C.*,
    SUM(ENROLLMENT)
FROM
    COURSE  C
    JOIN SECTION S
WHERE
    C.C_NUMBER = S.C_NUMBER
GROUP BY
    C.C_NUMBER
HAVING
    SUM(ENROLLMENT) > (
        SELECT
            SUM(ENROLLMENT)
        FROM
            COURSE  C
            JOIN SECTION S
        WHERE
            C.C_NUMBER = S.C_NUMBER
            AND C.C_NAME = "DBMS"
        GROUP BY
            C.C_NUMBER
    );

-- q7
SELECT
    C.*,
    SUM(ENROLLMENT)
FROM
    COURSE  C
    JOIN SECTION S
WHERE
    C.C_NUMBER = S.C_NUMBER
GROUP BY
    C.C_NUMBER
HAVING
    SUM(ENROLLMENT) > (
        SELECT
            SUM(ENROLLMENT)
        FROM
            COURSE  C
            JOIN SECTION S
        WHERE
            C.C_NUMBER = S.C_NUMBER
            AND C.DEPARTMENT = "Data Analytics"
        GROUP BY
            C.DEPARTMENT
    );

-- q8

SELECT
    C.C_NUMBER,
    C.C_NAME,
    C.DEPARTMENT,
    S.S_NUMBER,
    S.ENROLLMENT
FROM
    COURSE  C
    JOIN SECTION S
WHERE
    C.C_NUMBER = S.C_NUMBER;

-- q9
CREATE VIEW V1 AS (
    SELECT C.C_NUMBER,
    C.C_NAME,
    C.DEPARTMENT,
    S.S_NUMBER,
    S.ENROLLMENT FROM COURSE C JOIN SECTION S WHERE C.C_NUMBER = S.C_NUMBER
);

-- q10


SUBQUERY

-- Set1
SELECT
    *
FROM
    EMPLOYEE
WHERE
    EMP_ID IN (
        SELECT
            DISTINCT EMP_ID
        FROM
            ASSIGNEDTO
        WHERE
            PROJECT_ID = 353
    );

-- q1
SELECT
    EMP_ID
FROM
    ASSIGNEDTO
WHERE
    PROJECT_ID = 353;

-- q2
SELECT
    *
FROM
    EMPLOYEE
WHERE
    EMP_ID IN (
        SELECT
            DISTINCT EMP_ID
        FROM
            ASSIGNEDTO
        WHERE
            PROJECT_ID = (
                SELECT
                    PROJECT_ID
                FROM
                    PROJECT
                WHERE
                    PROJ_NAME = "database"
            )
    );

-- q3
SELECT
    *
FROM
    EMPLOYEE
WHERE
    EMP_ID IN (
        SELECT
            DISTINCT EMP_ID
        FROM
            ASSIGNEDTO
        WHERE
            PROJECT_ID = "353"
    )
    AND EMP_ID IN (
        SELECT
            DISTINCT EMP_ID
        FROM
            ASSIGNEDTO
        WHERE
            PROJECT_ID = "354"
    );

-- q4
SELECT
    EMP_ID
FROM
    EMPLOYEE
WHERE
    EMP_ID NOT IN (
        SELECT
            DISTINCT EMP_ID
        FROM
            ASSIGNEDTO
        WHERE
            PROJECT_ID = 453
    );

-- q5
SELECT
    *
FROM
    EMPLOYEE
WHERE
    EMP_NAME LIKE "s%";

-- q6
SELECT
    *
FROM
    PROJECT
WHERE
    CHIEF_ARCH = "smith";

-- q7
DELETE FROM ASSIGNEDTO
WHERE
    PROJECT_ID = (
        SELECT
            PROJECT_ID
        FROM
            PROJECT
        WHERE
            PROJ_NAME = "dbms"
    );

-- q8
SELECT
    PROJECT_ID
FROM
    ASSIGNEDTO
WHERE
    EMP_ID = 101;

-- q9
CREATE VIEW EMPL_PROJ AS (
    SELECT * FROM EMPLOYEE WHERE EMP_ID IN (SELECT DISTINCT EMP_ID FROM ASSIGNEDTO WHERE PROJECT_ID = 353)
);

-- q10



SET 2

SELECT
    C_NUMBER,
    COUNT(S_NUMBER)
FROM
    SECTION
GROUP BY
    C_NUMBER;

-- q1

SELECT
    C_NUMBER,
    COUNT(S_NUMBER)
FROM
    SECTION
WHERE
    C_NUMBER IN (
        SELECT
            C_NUMBER
        FROM
            COURSE
        WHERE
            DEPARTMENT = "CET"
    )
GROUP BY
    C_NUMBER;

-- q2

SELECT
    C_NUMBER,
    COUNT(S_NUMBER)
FROM
    SECTION
WHERE
    C_NUMBER IN (
        SELECT
            C_NUMBER
        FROM
            COURSE
        WHERE
            DEPARTMENT = "CET"
    )
GROUP BY
    C_NUMBER
HAVING
    COUNT(S_NUMBER)> 5;

-- q3
SELECT
    *
FROM
    COURSE
WHERE
    C_NUMBER IN (
        SELECT
            C_NUMBER
        FROM
            EXAM
        WHERE
            R_NUMBER IN (
                SELECT
                    R_NUMBER
                FROM
                    ROOM
                WHERE
                    BUILDING = "DR"
            )
    );

-- q4
SELECT
    *
FROM
    EXAM
WHERE
    C_NUMBER = (
        SELECT
            C_NUMBER
        FROM
            COURSE
        WHERE
            C_NAME = "DBMS"
    );

-- q5
SELECT
    *
FROM
    ROOM
WHERE
    R_NUMBER = (
        SELECT
            R_NUMBER
        FROM
            EXAM
        WHERE
            C_NUMBER = (
                SELECT
                    C_NUMBER
                FROM
                    COURSE
                WHERE
                    C_NAME = "DBMS"
            )
    );

-- q6
SELECT
    *
FROM
    COURSE
WHERE
    C_NUMBER IN (
        SELECT
            C_NUMBER
        FROM
            SECTION
        GROUP BY
            C_NUMBER
        HAVING
            SUM(ENROLLMENT) > (
                SELECT
                    SUM(ENROLLMENT)
                FROM
                    SECTION
                WHERE
                    C_NUMBER = (
                        SELECT
                            C_NUMBER
                        FROM
                            COURSE
                        WHERE
                            C_NAME = "DBMS"
                    )
            )
    );

-- q7
SELECT
    *
FROM
    COURSE
WHERE
    C_NUMBER IN (
        SELECT
            C_NUMBER
        FROM
            SECTION
        GROUP BY
            C_NUMBER
        HAVING
            SUM(ENROLLMENT) > (
                SELECT
                    SUM(ENROLLMENT)
                FROM
                    SECTION
                WHERE
                    C_NUMBER = (
                        SELECT
                            C_NUMBER
                        FROM
                            COURSE
                        WHERE
                            DEPARTMENT = "Data Analytics"
                    )
            )
    );

-- q8
SELECT
    C.C_NUMBER,
    C.C_NAME,
    C.DEPARTMENT,
    S.S_NUMBER,
    S.ENROLLMENT
FROM
    COURSE  C
    JOIN SECTION S
WHERE
    C.C_NUMBER = S.C_NUMBER;

-- q9
CREATE VIEW V1 AS (
    SELECT C_NUMBER,
    COUNT(S_NUMBER) FROM SECTION WHERE C_NUMBER IN (SELECT C_NUMBER FROM COURSE WHERE DEPARTMENT = "CET") GROUP BY C_NUMBER
);

-- q10