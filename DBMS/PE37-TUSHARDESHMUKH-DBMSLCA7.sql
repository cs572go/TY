-- trigger
USE DB;

CREATE TABLE PRODUCT(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    PNAME VARCHAR(50) NOT NULL,
    PDESC VARCHAR(100) NOT NULL,
    SPROD INT,
    LPROD INT NOT NULL
);

INSERT INTO PRODUCT VALUES(
    NULL,
    "rice",
    "whole food",
    NULL,
    0
);

INSERT INTO PRODUCT VALUES(
    NULL,
    "banana",
    "fruits",
    1,
    1
);

INSERT INTO PRODUCT VALUES(
    NULL,
    "kit-kat",
    "chocolate",
    1,
    1
);

INSERT INTO PRODUCT VALUES(
    NULL,
    "amul milk",
    "dairy",
    2,
    2
);

INSERT INTO PRODUCT VALUES(
    NULL,
    "sugar",
    "grocery",
    NULL,
    0
);

CREATE TRIGGER AFTER_DELETE_PROD AFTER
    DELETE ON PRODUCT FOR EACH ROW
        DELETE FROM PRODUCT WHERE SPROD = OLD.ID;
        SHOW TRIGGERS;
            DELETE FROM PRODUCT WHERE ID = 2;