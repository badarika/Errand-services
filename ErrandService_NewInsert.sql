--TBL_ES_SERVICE INSERT 
insert into TBL_ES_SERVICE values (1,'General',2);
insert into TBL_ES_SERVICE values (2,'Car Maintenance',1);
insert into TBL_ES_SERVICE values (3,'Delivery',1);
insert into TBL_ES_SERVICE values (4,'Senior Citizen Service',2);
insert into TBL_ES_SERVICE values (5,'Pet Service',1);

--TBL_ES_SERVICE_CATEGORY INSERT
insert into TBL_ES_SERVICE_CATEGORY values (1,'Grocery',1);
insert into TBL_ES_SERVICE_CATEGORY values (2,'Kid Pickup',1);
insert into TBL_ES_SERVICE_CATEGORY values (1,'Car Fueling',2);
insert into TBL_ES_SERVICE_CATEGORY values (2,'Car Wash',2);
insert into TBL_ES_SERVICE_CATEGORY values (3,'Car Service',2);
insert into TBL_ES_SERVICE_CATEGORY values (1,'Document Handling',3);
insert into TBL_ES_SERVICE_CATEGORY values (2,'Gift/Special Package',3);
insert into TBL_ES_SERVICE_CATEGORY values (1,'Driving',4);
insert into TBL_ES_SERVICE_CATEGORY values (2,'House Cleaning',4);
insert into TBL_ES_SERVICE_CATEGORY values (1,'Dog walk',5);
insert into TBL_ES_SERVICE_CATEGORY values (2,'Pet vet',5);

--TBL_ES_EMPLOYEE INSERT
insert into TBL_ES_employee values(12345, 'Timothy', 8742310760, 'timothy@gmail.com', 'Full time',12345);
insert into TBL_ES_employee values(23456, 'Darren', 9723303636, NULL , 'Part time', 23456);
insert into TBL_ES_employee values(34567, 'Kirkman', 4693188080, 'kirk@gmail.com', 'Full time', 34567);
insert into TBL_ES_employee values(45678, 'Clay', 7767140463, NULL, 'Full time', 45678);
insert into TBL_ES_employee values(56789, 'Alex', 5436212345, 'alex@gmail.com', 'Part time',56789);

update TBL_ES_employee set FK_Emp_Bkp = 34567 where PK_EID = 12345;
update TBL_ES_employee set FK_Emp_Bkp = 12345 where PK_EID = 23456;
update TBL_ES_employee set FK_Emp_Bkp = 45678 where PK_EID = 34567;
update TBL_ES_employee set FK_Emp_Bkp = 56789 where PK_EID = 45678;
update TBL_ES_employee set FK_Emp_Bkp = 23456 where PK_EID = 56789;

--TBL_ES_CUSTOMER INSERT

INSERT INTO TBL_ES_CUSTOMER VALUES(12,'Hannah','12-DEC-1994','123 Monroe Street',21356782020);
INSERT INTO TBL_ES_CUSTOMER VALUES(23,'Stacy','07-AUG-1989','234 Spring Creek',2147290044);
INSERT INTO TBL_ES_CUSTOMER VALUES(34,'Nancy','20-JUN-1979','456 Wade Blvd',7434621576);
INSERT INTO TBL_ES_CUSTOMER VALUES(45,'John','10-OCT-1980','9000 warren pkwy',4692341456);
INSERT INTO TBL_ES_CUSTOMER VALUES(56,'Jennifer','05-MAY-1990','6000 ohio rd',4692352323);
INSERT INTO TBL_ES_CUSTOMER VALUES(67,'Emily','05-AUG-1950','1234 Mayo st',4693187574);
INSERT INTO TBL_ES_CUSTOMER VALUES(78,'Mike','30-JAN-1945','6000 Monroe st',9723303633);

--TBL_ES_PRICING INSERT
insert into TBL_ES_pricing values(1, 'Gold', 15);
insert into TBL_ES_pricing values(1, 'Execuctive', 13);
insert into TBL_ES_pricing values(2, 'Gold', 15);
insert into TBL_ES_pricing values(2, 'Executive', 10);
insert into TBL_ES_pricing values(3, 'Gold', 25);
insert into TBL_ES_pricing values(3, 'Executive', 23);
insert into TBL_ES_pricing values(4, 'Gold', 20);
insert into TBL_ES_pricing values(4, 'Executive', 17);
insert into TBL_ES_pricing values(5, 'Gold', 13);
insert into TBL_ES_pricing values(5, 'Executive', 25);

--TBL_ES_COMMENT INSERT
insert into TBL_ES_comment values(12, 5, 'Excellent', 056);
insert into TBL_ES_comment values(23, 4, 'Good', 023);
insert into TBL_ES_comment values(34, 3, NULL ,034 );
insert into TBL_ES_comment values(45, 5, 'Excellent',034);
insert into TBL_ES_comment values(56,4, NULL,045);

--TBL_ES_MEMBERSHIP INSERT
insert into TBL_ES_membership values(1234567,'Gold', 012);
insert into TBL_ES_membership values(2345671,'Gold', 023);
insert into TBL_ES_membership values(3456789,'Executive', 034);
insert into TBL_ES_membership values(7687654,'Gold', 045);
insert into TBL_ES_membership values(5432176,'Executive', 056);

--TBL_ES_PAYMENT_METHOD INSERT
insert into TBL_ES_PAYMENT_METHOD values (1,'Credit Card','Chip Read');
insert into TBL_ES_PAYMENT_METHOD values (2,'Debit Card','Chip Read');
insert into TBL_ES_PAYMENT_METHOD values (3,'Paypal','Online');
insert into TBL_ES_PAYMENT_METHOD values (4,'Cash','By-hand');
insert into TBL_ES_PAYMENT_METHOD values (5,'Netbanking','Online');

--TBL_ES_BILL INSERT
insert into TBL_ES_BILL values (12,'12-OCT-2018',100,1,012);
insert into TBL_ES_BILL values (23,'10-AUG-2018',80,2,023);
insert into TBL_ES_BILL values (34,'03-DEC-2017',20,4,034);
insert into TBL_ES_BILL values (45,'13-MAY-2018',120,3,045);
insert into TBL_ES_BILL values (56,'30-SEP-2018',60,5,056);

--TBL_ES_DISCOUNT INSERT 
insert into TBL_ES_DISCOUNT values ('Senior Citizen Discount',15);
insert into TBL_ES_DISCOUNT values ('Volume Discount',15);
insert into TBL_ES_DISCOUNT values ('Trial Discount',10);
insert into TBL_ES_DISCOUNT values ('Seasonal',5);
insert into TBL_ES_DISCOUNT values ('Happy Hours',5);

--TBL_ES_OFFER INSERT
insert into TBL_ES_OFFER values ('Senior Citizen Discount',4);
insert into TBL_ES_OFFER values ('Volume Discount',3);
insert into TBL_ES_OFFER values ('Volume Discount',1);
insert into TBL_ES_OFFER values ('Volume Discount',5);
insert into TBL_ES_OFFER values ('Trial Discount',1);
insert into TBL_ES_OFFER values ('Trial Discount',2);
insert into TBL_ES_OFFER values ('Trial Discount',3);
insert into TBL_ES_OFFER values ('Trial Discount',4);
insert into TBL_ES_OFFER values ('Seasonal',1);
insert into TBL_ES_OFFER values ('Seasonal',2);
insert into TBL_ES_OFFER values ('Seasonal',3);
insert into TBL_ES_OFFER values ('Seasonal',4);
insert into TBL_ES_OFFER values ('Happy Hours',1);
insert into TBL_ES_OFFER values ('Happy Hours',2);
insert into TBL_ES_OFFER values ('Happy Hours',3);
insert into TBL_ES_OFFER values ('Happy Hours',4);

--TBL_ES_BOOKING INSERT Associative Entity

insert into TBL_ES_BOOKING values(12,2,012,'12-OCT-2018');
insert into TBL_ES_BOOKING values(23,1,023,'10-AUG-2018');
insert into TBL_ES_BOOKING values(34,3,034,'03-DEC-2017');
insert into TBL_ES_BOOKING values(45,1,012,'12-OCT-2018');
insert into TBL_ES_BOOKING values(56,5,012,'12-OCT-2018');
insert into TBL_ES_BOOKING values(67,2,056,'12-OCT-2018');
insert into TBL_ES_BOOKING values(78,4,045,'30-MAY-2018');





