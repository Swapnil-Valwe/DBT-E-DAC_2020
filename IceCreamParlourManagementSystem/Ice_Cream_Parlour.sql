create database Ice_Cream_Parlour;
use  Ice_Cream_Parlour;

-- create table ice_cream and insert values 
create table Ice_Cream(Ice_Cream_ID int primary key not null unique, Flavours varchar(50),Price numeric(4),Type varchar(50),Quantity numeric(5));
			insert into Ice_Cream values (101,'VANILLA',40,'CUP',70);
             insert into Ice_Cream values (102,'BUTTERSCOTCH',180,'FAMILYPACK',30);
             insert into Ice_Cream values (103,'ANJEER',200,'COCKTAILS',54);
             insert into Ice_Cream values (104,'REDVELVET',80,'CORNETTO',60);
             insert into Ice_Cream values (105,'MINT',50,'SCOOP',45);

-- create table Juices and insert values 
create table Juices(Juice_ID int primary key unique not null,Flavour varchar(50),Price numeric(5),Quantity varchar(10));
		insert into Juices values(200,'APPLE',120,'full'),
             (201,'PINEAPPLE',50,'HALF'),
             (202,'KIWI',150,'FULL'),
             (203,'SWEETLIME',100,'FULL'),
             (204,'ORANGE',45,'HALF'),
             (205,'WATERMELON',110,'FULL');
             
-- create table shakes and insert values
create table Shakes(Shakes_ID int primary key not null unique,Flavours varchar(50),Price numeric(5),Quantity varchar(10));
		 insert into Shakes values(300,'BADAM',90,'FULL'),
           (301,'STRAWBERRY',70,'HALF'),
           (302,'OREO',180,'FULL'),
           (303,'WHITECHOCOLATE',150,'FULL'),
           (304,'COLD-COFEE',80,'HALF');

-- create table Products and add constraints and foreign keys in Products table
create table Products(Product_ID int primary key unique not null, ProductName varchar(50), Ice_Cream_ID int, Juice_ID int, Shakes_ID int);
alter table Products add constraint Ice_Cream_ID_FK foreign key (Ice_Cream_ID) references Ice_Cream(Ice_Cream_ID);
alter table Products add constraint Juice_ID_FK foreign key (Juice_ID) references Juices(Juice_ID);
alter table Products add constraint Shakes_ID_FK foreign key (Shakes_ID) references Shakes(Shakes_ID);

		insert into Products values(1001,'Ice_Cream', 101, null, null);
        insert into Products values(1002,'Ice_Cream', 102, null, null);
        insert into Products values(1003,'Ice_Cream', 103, null, null);
        insert into Products values(1004,'Ice_Cream', 104, null, null);
        insert into Products values(1005,'Ice_Cream', 105, null, null);
        
         insert into Products values(2001,'Juices', null, 200, null);
         insert into Products values(2002,'Juices', null, 201, null);
         insert into Products values(2003,'Juices', null, 202, null);
         insert into Products values(2004,'Juices', null, 203, null);
         insert into Products values(2005,'Juices', null, 204, null);
         insert into Products values(2006,'Juices', null, 205, null);
         
         insert into Products values(3001,'Shake', null, null, 303);
         insert into Products values(3002,'Shake', null, null, 302);
         insert into Products values(3003,'Shake', null, null, 301);
         insert into Products values(3004,'Shake', null, null, 304);
         insert into Products values(3005,'Shake', null, null, 300);

         
         select * from products order by product_ID asc;
 
 -- create table Worker and insert values
create table Workers(Worker_ID int primary key unique not null,Worker_Name varchar(50),Worker_Designation varchar(50),Worker_Salary numeric(5));
insert into Workers values(20000,'SUHAS','CASHIER',18000),
                                 (20001,'SHYAM','HELPER',1000),
                                 (20002,'RAJ','BARISTA',14000),
                                 (20003, 'SUPEKAR', 'MANAGER',25000);

-- create table Customer_Details and insert values
create table Customer_Details(Customer_ID int primary key unique not null, Customer_Name varchar(50),Contact_No numeric(11),Address varchar(50));
insert into customer_details values(1201, 'MEGHNA PATIL', 6573528737, "SION"),
									(1202, 'UDIT NEMADE', 539753795, "DADAR"),
                                    (1203, 'SWAPNIL ANDHALE', 3856783267, "ANDHERI"),
                                    (1204, 'TEJAS RANE', 9287389683, "DOMBIVLI"),
                                    (1205, 'TANUJA PATIL', 1384536875, "BORIVALI"),
                                    (1206, 'UNNATI TAPPE', 86738495273, "COLABA"),
                                    (1207, 'MRUNALI DESHMUKH', 85398265483, "GHATKOPAR"),
                                    (1208, 'MANOJ BHOYE', 36329759358, "THANE"),
                                    (1209, 'UMESH CHAUDHARY', 7862387468, "MULUND"),
                                    (1210, 'SWAPNIL VALWE', 8276863857, "BANDRA");
                                  insert into customer_details values  (1212, 'KIRTI ROY', 9337568347, "MATUNGA");


-- Stored Procedure for adding values into Customer_details
delimiter //
create procedure Add_Customer (
in Customer_ID int (5),
in Customer_name varchar(50),
in Contact_no int (10),
in Place varchar(20)
)
begin 
insert into customer_Details values (customer_ID, Customer_name, contact_no, place);
end //
call add_Customer (1214, 'UDBHAV GARG', 375938759, 'DELHI');

-- Using Functions for showing Customer_Details
delimiter &&
CREATE FUNCTION show_CustomerDetails(

) returns int(50)
begin 
declare abcd int(10);
set abcd = 
(select count(Customer_name) from Customer_Details);
return abcd;
end &&
select show_CustomerDetails();

-- using triggers for increasing counter
set @counter = 13;
delimiter $$
create trigger countofCustomers after insert on Customer_Details 
for each row 
begin 
set @counter = @counter + 1;
end $$
select @counter;

                                    SELECT * FROM customer_details;


-- create feedback table and insert values
create table Feedback(FeedBack_number int primary key unique not null, date date,Remark varchar(50), Customer_ID int);
alter table Feedback add constraint Customer_ID_FK foreign key (Customer_ID) references Customer_Details(Customer_ID);
			insert into feedback values(1, '2019-06-26', "VERY GOOD", 1201), 
										(2, '2019-08-12', "GOOD", 1203),
                                        (3, '2020-03-05', "VERY GOOD", 1206),
                                        (4, '2020-07-21', "OKAY", 1210);
SELECT * FROM FEEDBACK;
SELECT * FROM CUSTOMER_dETAILS INNER JOIN FEEDBACK ON customer_details.CUSTOMER_id = FEEDBACK.CUSTOMER_ID;


-- create Orders table and insert values
create table Orders(Order_ID int primary key unique not null,Order_Quantity numeric(5),Order_total_Amount numeric(4), Customer_ID int, Product_ID int); 
alter table Orders add constraint Customer_ID_FK1 foreign key (Customer_ID) references Customer_Details(Customer_ID);
alter table Orders add constraint Product_ID_FK1 foreign key (Product_ID) references Products(Product_ID);
							insert into Orders values (9001, 4, 390, 1201, 1001),
													  (9002, 3, 280, 1204, 2001),
                                                      (9003, 2, 200, 1202, 2004),
                                                      (9004, 5, 430, 1206, 1005),
                                                      (9005, 7, 890, 1209, 3001);
select * from Orders;
SELECT CUSTOMER_id from customer_details JOIN Orders ON CUSTOMER_id.Order_ID = Order_ID, Order_ID;

-- create Payment_Details and insert values
create table Payment_Details(Payment_ID int primary key unique not null, Payment_Type varchar(40),Amount numeric(5), Order_ID int);
alter table Payment_Details add constraint Order_ID_FK foreign key (Order_ID) references Orders(Order_ID);
							insert into Payment_Details values (8011, "CC", 430, 9004),
																(8012, "Gpay", 890, 9005),
                                                                (8013, "Cash", 200, 9003),
                                                                (8014, "Debit Card", 390, 9001),
                                                                (8015, "PhonePay", 280, 9002);
select * from payment_details;


-- cursor 1 to show JuiceDetails using JuiceID														
DELIMITER &&
CREATE PROCEDURE SHOW_JuicesDetails(IN ID int)
BEGIN
 DECLARE FLAVOURS VARCHAR(20);
 DECLARE PRICES INT(5);
 DECLARE FLAG INT(2);
 DECLARE SHOW_CURSOR CURSOR FOR
 SELECT FLAVOUR, PRICE FROM JUICES WHERE JUICE_ID = ID;
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET FLAG=1;
 OPEN SHOW_CURSOR;
 SET FLAG=0;
 FETCH SHOW_CURSOR INTO FLAVOURS, PRICES;
 WHILE(FLAG=0) 
 DO
 FETCH SHOW_CURSOR INTO FLAVOURS, PRICES;
 SELECT FLAVOURS AS 'FLAVOUR',PRICES AS 'PRICE';
 END WHILE;
 CLOSE SHOW_CURSOR;
END &&
 
 DELIMITER ;
 CALL SHOW_JUICESDETAILS(200);																

-- cursor 2 to show JuiceDetails using Quantity
DELIMITER &&
CREATE PROCEDURE SHOW_QUANTITY(IN QUANTITY_CURSOR varchar(20))
BEGIN
 DECLARE FLAVOURS VARCHAR(20);
 DECLARE PRICES INT(5);
 DECLARE FLAG INT(2);
 DECLARE SHOW_CURSOR CURSOR FOR
 SELECT FLAVOUR, PRICE FROM JUICES WHERE QUANTITY = QUANTITY_CURSOR;
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET FLAG=1;
 OPEN SHOW_CURSOR;
 SET FLAG=0;
 FETCH SHOW_CURSOR INTO FLAVOURS, PRICES;
 WHILE(FLAG=0) 
 DO
 FETCH SHOW_CURSOR INTO FLAVOURS, PRICES;
 SELECT FLAVOURS AS 'FLAVOUR',PRICES AS 'PRICE';
 END WHILE;
 CLOSE SHOW_CURSOR;
END &&
 
 DELIMITER ;
 CALL SHOW_QUANTITY("FULL");																	

