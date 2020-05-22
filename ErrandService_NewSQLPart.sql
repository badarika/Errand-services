select * from TBL_ES_DISCOUNT;
select * from TBL_ES_OFFER;
select * from TBL_ES_BILL;
select * from TBL_ES_PAYMENT_METHOD;
select * from TBL_ES_MEMBERSHIP;
select * from TBL_ES_COMMENT;
select * from TBL_ES_PRICING;
select * from TBL_ES_SERVICE_CATEGORY;
select * from TBL_ES_SERVICE;
select * from TBL_ES_EMPLOYEE;
select * from TBL_ES_CUSTOMER;
select * from TBL_ES_BOOKING;

--12)List only primary keys values for three different tables. (Select command on three different tables. No join operation is required.)
select PK_SID as Service_ID from TBL_ES_SERVICE;
select PK_BID as Booking_ID from TBL_ES_BOOKING;
select PK_EID as Employee_ID from TBL_ES_EMPLOYEE;

--13) Demonstrate two (2) SELECT commands with WHERE statement.
--Select customer details who have Gold membership
select c.PK_CID as Customer_ID,C_Name as Customer_Name,PK_CardNO as Card_Number,Card_Type as Membership_Type 
from TBL_ES_customer c ,TBL_ES_membership m 
where c.PK_CID = m.FK_CID and m.Card_Type='Gold';
--select discount percentage for Senior citizens
select PK_Discount_Type as Service_Type, d_percent as Discount_Percentage 
from TBL_ES_DISCOUNT 
where PK_Discount_Type='Senior Citizen Discount';

--14) Demonstrate two (2) SELECT command with GROUP BY statement.
--Number of Gold and Executive customers
select * from TBL_ES_MEMBERSHIP;
select Card_Type as Membership_Type,count(*) as Number_Of_Members 
from TBL_ES_MEMBERSHIP 
group by Card_Type;
--Number of Part time and Full time employees
--update TBL_ES_EMPLOYEE set type='Part time' where e_id=56;
select E_Type as Employee_Type,count(*) as Number_Of_Employees 
from TBL_ES_EMPLOYEE 
group by E_Type;
--Number of service categories under each service
select PK_FK_SID as Service_ID, count(*) as Number_Of_Service_Categories from TBL_ES_service_category group by PK_FK_SID;
--Number of customers who have availed service on 12-OCT-2018
select Date_of_service, count(*) 
from TBL_ES_booking 
where Date_of_service='12-OCT-18' 
group by Date_of_service;

--15)Demonstrate two (2) SELECT command with HAVING statement.
--Display services which has been availed by customers more than once
select FK_SID as Service_Number,count(*) as No_of_times 
from TBL_ES_booking 
group by FK_SID 
having count(*)>1;
--Select type of offers offered for more than 3 services
select * from TBL_ES_OFFER;
select PK_FK_Discount_Type, count(*) as Count_Of_Services from TBL_ES_OFFER group by PK_FK_Discount_Type having count(*)>3;

/*
16) Using two related table (meaning logically connected with primary-key and foreign-key pairs), 
run an inner join statement to show matching rows. 
For instance, assume that Table A and Table B has 4 and 5 attributes respectively. 
Also, assume that Table A’s primary key is seen as foreign key in Table B. 
Use join operations to show matching rows whose primary key and foreign key is same.
*/
--insert into TBL_ES_service_category values(3,'Car Service',2);
--Type of services available under Car Maintenance
SELECT   sc.SC_Type
FROM    (TBL_ES_service s JOIN TBL_ES_service_category sc ON s.PK_SID = sc.PK_FK_SID)
WHERE    s.S_Name = 'Car Maintenance';

--17) Demonstrate a left join statement.
--Pet Service displayed though there are no offers available for it
select * from TBL_ES_offer;
--delete from TBL_ES_offer where type='Volume Discount' and s_no=5;
select s.S_Name,o.PK_FK_Discount_Type
from (TBL_ES_service s  LEFT OUTER JOIN TBL_ES_offer o on o.PK_FK_SID = s.PK_SID);

--18) Demonstrate ORDER BY statement to order inner join operation according to foreign key. 
--(Either ascending or descending is acceptable)
--Sorting type column in ascending order
select * from ES_service_category;
SELECT   sc.PK_FK_SID, sc.SC_Type
FROM    (TBL_ES_service s JOIN TBL_ES_service_category sc ON s.PK_SID = sc.PK_FK_SID)
WHERE    s.S_Name = 'Car Maintenance'
order by sc.PK_FK_SID,sc.SC_Type;

--Order customer's with gold membership by their date of birth in descending order
select c.PK_CID as Customer_ID,C_Name as Customer_Name,C_DOB as Customer_DateOfBirth,Card_Type as Membership_Type 
from (TBL_ES_customer c JOIN TBL_ES_membership m on c.PK_CID = m.FK_CID and m.Card_Type='Gold')
order by C_DOB desc;

--19) Create a "cascade delete" SQL statement over two tables.
--When a record in TBL_ES_CUSTOMER gets deleted, all the records in TBL_ES_MEMBERSHIP
--will also be deleted that have the same c_id value
select * from TBL_ES_CUSTOMER;
select * from TBL_ES_MEMBERSHIP;

ALTER TABLE TBL_ES_MEMBERSHIP
DROP CONSTRAINT es_membership_fk;

ALTER TABLE TBL_ES_MEMBERSHIP
ADD CONSTRAINT es_membership_fk FOREIGN KEY (FK_CID) REFERENCES TBL_ES_customer(PK_CID)
    ON DELETE CASCADE;
--whenever an entry is deleted from Discount table, the corresponding entries should be deleted from Offer table    
select * from TBL_ES_DISCOUNT;
select * from TBL_ES_OFFER;

ALTER TABLE TBL_ES_OFFER
DROP CONSTRAINT es_offer1_fk;

ALTER TABLE TBL_ES_OFFER
ADD CONSTRAINT es_offer1_fk FOREIGN KEY (PK_FK_Discount_Type) REFERENCES TBL_ES_DISCOUNT(PK_Discount_Type) ON DELETE CASCADE;

--query to cross check
delete from TBL_ES_DISCOUNT where type='Senior Citizen Discount';

--20) Demonstrate UNION statement.
select Emp_Name as Names from TBL_ES_employee
UNION
select C_Name as Names from TBL_ES_customer;

--21)Demonstrate a SQL statement in which a DATE data type is subject of where statement (such as, select ... from ... where birthday > DATE)
--Display senior citizen customers whose age>60
select add_months( sysdate, -12*60 ) from dual; --Gives the date 60 years ago from today's date
select * from TBL_ES_CUSTOMER where C_DOB < add_months( sysdate, -12*60 ); --needs correction

--22)Demonstrate CREATE VIEW statement.
--create a view of customer details with "Gold" membership
select * from TBL_ES_MEMBERSHIP;

CREATE VIEW VIEW_ES_GOLD_MEMBER AS 
SELECT C.PK_CID as Customer_ID,C.C_Name as CustomerName, M.Card_Type as Membership_type,
M.PK_CardNO as Membership_Card_No
FROM TBL_ES_MEMBERSHIP M, TBL_ES_CUSTOMER C 
WHERE M.Card_Type = 'Gold' and M.FK_CID=C.PK_CID;

--cross check
insert into TBL_ES_membership values(7897890,'Gold', 067);
select * from VIEW_ES_GOLD_MEMBER;

--23) Delete three rows from a table.
delete from TBL_ES_offer where PK_FK_Discount_Type='Volume Discount';

--24) Delete all rows from a table, then delete the empty table from database.
delete from TBL_ES_offer;
drop table TBL_ES_offer;


