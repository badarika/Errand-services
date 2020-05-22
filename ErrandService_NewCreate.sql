CREATE TABLE TBL_ES_SERVICE (
  PK_SID integer, --PK_SID
  S_Name varchar(50) NOT NULL, --S_Name
  min_hours int NOT NULL, --Min_Hours
  CONSTRAINT es_service_pk PRIMARY KEY (PK_SID)
);

CREATE TABLE TBL_ES_SERVICE_CATEGORY (
  PK_SCID integer, --PK_SCID
  SC_Type varchar(50) NOT NULL, --SC_Type
  PK_FK_SID int NOT NULL, --PK_FK_SID
  CONSTRAINT es_service_category_pk PRIMARY KEY (PK_SCID,PK_FK_SID),
  CONSTRAINT es_service_category_fk FOREIGN KEY (PK_FK_SID) REFERENCES TBL_ES_service(PK_SID)
);

CREATE TABLE TBL_ES_EMPLOYEE (
    PK_EID       integer, --PK_EID
    Emp_Name       VARCHAR(20) NOT NULL, --Emp_Name
    E_PhoneNO   INTEGER NOT NULL, --E_PhoneNO
    E_Email      VARCHAR(30), --E_Email
    E_Type       VARCHAR(10) NOT NULL, --E_Type
    FK_Emp_Bkp integer NOT NULL, --FK_Emp_Bkp
    CONSTRAINT es_employee_pk PRIMARY KEY ( PK_EID ),
    CONSTRAINT es_employee_fk FOREIGN KEY (FK_Emp_Bkp) REFERENCES TBL_ES_employee(PK_EID)
);

CREATE TABLE TBL_ES_CUSTOMER (
    PK_CID       INTEGER, --PK_CID
    C_Name       VARCHAR(20) NOT NULL, --C_Name
    C_DOB        DATE, --C_DOB
    C_Address    VARCHAR(30) NOT NULL, --C_Address
    C_PhoneNO   INTEGER NOT NULL, --C_PhoneNO
    CONSTRAINT es_customer_pk PRIMARY KEY ( PK_CID )
);

CREATE TABLE TBL_ES_PRICING (
  PK_FK_SID integer, --PK_FK_SID
  membership varchar(25), 
  price_per_hour integer not null, 
  CONSTRAINT es_pricing_pk PRIMARY KEY (PK_FK_SID,membership),
  CONSTRAINT es_pricing_fk FOREIGN KEY (PK_FK_SID) REFERENCES TBL_ES_service(PK_SID)
);

CREATE TABLE TBL_ES_COMMENT (
    PK_ComID       INTEGER, --PK_ComID
    rating     INTEGER NOT NULL, 
    comments   VARCHAR(50),
    FK_CID       integer NOT NULL, --FK_CID
    CONSTRAINT es_comment_pk PRIMARY KEY ( PK_ComID ),
    CONSTRAINT es_comment_fk FOREIGN KEY ( FK_CID )
        REFERENCES TBL_ES_customer ( PK_CID )
);

CREATE TABLE TBL_ES_MEMBERSHIP (
  PK_CardNO integer, --PK_CardNO
  Card_Type varchar(25) not null, --Card_Type
  FK_CID integer not null, --FK_CID
  CONSTRAINT es_membership_pk PRIMARY KEY (PK_CardNO),
  CONSTRAINT es_membership_fk FOREIGN KEY (FK_CID) REFERENCES TBL_ES_customer(PK_CID)
);

CREATE TABLE TBL_ES_PAYMENT_METHOD (
    PK_PMID          INTEGER, --PK_PMID
    payment_type   VARCHAR(20), 
    entry_method varchar(20) NOT NULL,
    CONSTRAINT es_payment_method_pk PRIMARY KEY ( PK_PMID )
);

CREATE TABLE TBL_ES_BILL (
  PK_BillNO integer, --PK_BillNO
  b_date date not null,
  amount float not null,
  FK_PMID integer not null, --FK_PMID
  FK_CID integer not null, --FK_CID
  CONSTRAINT es_bill_pk PRIMARY KEY (PK_BillNO),
  CONSTRAINT es_bill_fk FOREIGN KEY (FK_PMID) REFERENCES TBL_ES_payment_method(PK_PMID),
  CONSTRAINT es_bill1_fk FOREIGN KEY (FK_CID) REFERENCES TBL_ES_customer(PK_CID)
);

CREATE TABLE TBL_ES_DISCOUNT (
    PK_Discount_Type        VARCHAR(30), --PK_Discount_Type
    d_percent   INTEGER not null, --Disc_Percent
    CONSTRAINT es_discount_pk PRIMARY KEY (PK_Discount_Type)
);

CREATE TABLE TBL_ES_OFFER (
  PK_FK_Discount_Type varchar(50), --PK_Discount_Type
  PK_FK_SID integer not null, --PK_FK_SID
  CONSTRAINT es_offer_pk PRIMARY KEY (PK_FK_Discount_Type,PK_FK_SID),
  CONSTRAINT es_offer_fk FOREIGN KEY (PK_FK_SID) REFERENCES TBL_ES_service(PK_SID),
  CONSTRAINT es_offer1_fk FOREIGN KEY (PK_FK_Discount_Type) REFERENCES TBL_ES_DISCOUNT(PK_Discount_Type)
);

CREATE TABLE TBL_ES_BOOKING (
  PK_BID integer, --PK_BID
  FK_SID integer NOT NULL, --FK_SID
  FK_CID integer NOT NULL, --FK_CID
  date_of_service date NOT NULL,
  CONSTRAINT es_booking_pk PRIMARY KEY (PK_BID),
  CONSTRAINT es_booking1_fk FOREIGN KEY (FK_SID) REFERENCES TBL_ES_service(PK_SID),
  CONSTRAINT es_booking2_fk FOREIGN KEY (FK_CID) REFERENCES TBL_ES_Customer(PK_CID)
);