CREATE TABLE Customer (
    CustomerID NUMBER(5),
    FirstName  VARCHAR2(50) NOT NULL
        CONSTRAINT chk_fname CHECK (FirstName = INITCAP(FirstName)),
    LastName   VARCHAR2(50) NOT NULL
        CONSTRAINT chk_lname CHECK (LastName = INITCAP(LastName)),
    PhoneNo    VARCHAR2(15)
        CONSTRAINT chk_phone CHECK (REGEXP_LIKE(PhoneNo, '^[0-9]{10,15}$')),
    Email      VARCHAR2(50)
        CONSTRAINT chk_email CHECK (REGEXP_LIKE(Email, '^[^@]+@[^@]+\.[^@]+$')),
    Address    VARCHAR2(100),
    CONSTRAINT pk_Customer PRIMARY KEY (CustomerID));