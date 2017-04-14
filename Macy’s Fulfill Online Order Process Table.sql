------------------------------------------------------------------------CUSTOMER----------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
Create table customer
(
cust_id number(5)  PRIMARY Key,                        /*Customer Information with unique customer id*/ 
cust_first_name    VARCHAR2(20) not null,             /* The First name and the email id are details required */
cust_last_name     varchar2(20),
Cust_DOB           DATE,
cust_add_line1     VARCHAR2(50),
CUST_ADD_LINE2     VARCHAR2(50), 
CUST_CITY          VARCHAR2(50),
CUST_ZIP           VARCHAR2(5),
CUST_STATE         VARCHAR2(20),
CUST_EMAIL_ID      VARCHAR2(50) not null,
CUST_MOBILE_NUMBER NUMBER(10)
);

insert into customer values (23918,'Bourne','','4-Oct-85','Appt# 747','747 Elm Drive','New York City',11530,'New York', 'bourne@gmail.com',2858266220); 
insert into customer values (39976,'Jutta','Anderson','3-Mar-76','4255 Hill Croft Farm Road','HOLTSVILLE','New York',00501,'New York','jutta.a@gmail.com', 3139562535);
insert into customer values (99146,'Hilaria','Downes','15-Jan-80','41 Sycamore Road',' ','BOSTON',60064,'MA','hilaria.downes@gmail.com', 1033822967);
insert into customer values (23050,'Cammy','Wyatt','9-Jan-71','21 Pringle Drive','','Boston','60601','MA','cammy.w@gmail.com', 4236450265);
insert into customer values (28012,'Gregoria','Craig','25-May-60','4255 HillCroft Farm Road','','Sacramento',95826,'CT','gregoria.c@gmail.com', 5163500081);
insert into customer values (16951,'Destiny','Keenan','28-Apr-88','4834 Rebecca StreetPark Ridge','','Stamford',2110,'CT','destiny.k@gmail.com',5161230081);
insert into customer values (47127,'Jeanna','Mustafa','21-Mar-87','2852 Sunburst Drive','McDade Road','Fort Lee',33901,'NJ','jeanna.mus@gmail.com',9596450265);
insert into customer values (70029,'Lorette','Gibbins','5-Jul-88','1611 County Line Road','','New Port Richey',34652,'NJ','lorette.gib@gmail.com',9996450212);
insert into customer values (61019,'Branden','Fitzpatrick','11-Nov-92','3271 Florence Street','','Hartford',75247,'CT','b.fitzpatrick@gmail.com',9599991022);
insert into customer values (61238,'Hays','Gerald','19-Jul-72','863 Carolyns Circle','','Hartford',75204,'CT','hays.gerald@gmail.com',9991451451);

------------------------------------------------------------------------ORDERS------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
Create table orders
( 
order_id VARCHAR2(7) PRIMARY KEY,                               /*Deatils of all the orders */    
Cust_id NUMBER(5) not null,                                     /* The order date and the customer id (from customer table) are required */
order_date DATE not null,                                       /* Delivery option or pick up option should also be not null */         
Delivery_Pickup VARCHAR2(8) not null,
Delivery_street_addr  varchar2(30),
Delivery_city varchar2(20),
Delivery_state varchar2(10),
Delivery_zip number(5),
Pickup_Store_number varchar(2),
Foreign key (cust_id) references Customer(cust_id)
);

Insert into Orders values ('O1001',23918,'23-JAN-16','Delivery','Appt# 747','Garden City','New York',11530,'NA');
Insert into Orders values ('O1002',39976,'25-JAN-16','Pickup','NA','NA','NA','','S1');
Insert into Orders values ('O1003',99146,'30-JAN-16','Delivery','41 Sycamore Road','CHICAGO','Illinois',60064,'NA');
Insert into Orders values ('O1004',23050,'04-FEB-16','Pickup','NA','NA','NA','','s3');
Insert into Orders values ('O1005',28012,'10-FEB-16','Delivery','4255 Hill','Sacramento','California',95826,'NA');
Insert into Orders values ('O1006',16951,'20-FEB-16','Pickup','NA','NA','NA','','s4');
Insert into Orders values ('O1007',47127,'26-FEB-16','Pickup','NA','NA','NA','','s1');
Insert into Orders values ('O1008',70029,'02-MAR-16','Delivery','808-Main street','Hartford','CT',6106,'NA');
Insert into Orders values ('O1009',61019,'10-MAR-16','Pickup','NA','NA','NA','','s1');
Insert into Orders values ('O1010',61238,'17-MAR-16','Delivery','863 Carolyns Circle','Dallas','Texas',75204,'NA');

------------------------------------------------------------------------PRODUCT-----------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table product
(
product_id number(7) Primary Key,
product_desc varchar2(50) not null,
product_cat varchar2(20) not null,                                        /*Details of all the products with unique product key */
product_size varchar(4),                                                  /*Master Table, all attributes are required, however size is optional */
product_colour varchar2(10) not null,                                     /* All products may not have a size for example watches */
product_price number(6,2) not null
);

insert into product values (2010654,'Petite Embellished Christmas Trees Graphic Top','WTOP','XL','NavyBlue',17.29);
insert into product values (2215654,'Petite Embellished Christmas Trees Graphic Top','WTOP','S','Green',17.29);
insert into product values (1121550,'Mens Custom-Fit Ivy Polo','MTEE','M','yellow',22);
insert into product values (1218987,'Easy Khaki Classic Fit Flat Front Pants','MPNT','L','Cream',40.1);
insert into product values (2010612,'Cashmere Blend V-Neck Sweater, Classic Fit','MSWEAT','XL','NavyBlue',12.61);
insert into product values (1487234,'2-Pc. Heavyweight Puffer Jacket Fleece Hat Set','KJACK','S','Pink',23.76);
insert into product values (3123765,'Juniors Paneled Sweater Dress','KSWEAT','S','Grey',58.32);
insert into product values (2215987,'Curvy Fit Bootcut Pull On Pants','WPNT','S','Grey',45.32); 
insert into product values (1118417,'Men UA Tech Jacquard T-Shirt','MTEE','M','Cream',43.1);
insert into product values (1123417,'Men UA Tech Jacquard T-Shirt','MTEE','M','Grey',23.1);
------------------------------------------------------------------------SHOPPING_CART----------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE shopping_cart
(
Order_id VARCHAR2(7) REFERENCES orders(order_id),
product_id NUMBER(7) references product(product_id),                      /* Product level information in an order */
quantity NUMBER(8) not null,                                              /*Quantity ordered is required */
PRIMARY KEY (Order_id,product_id)
);

insert into shopping_cart values ('O1001',2215654,1);
insert into shopping_cart values ('O1001',1487234,1);
insert into shopping_cart values ('O1002',1118417,1);
insert into shopping_cart values ('O1003',2010654,1);
insert into shopping_cart values ('O1003',2010612,1);
insert into shopping_cart values ('O1003',1218987,1);
insert into shopping_cart values ('O1004',3123765,2);
insert into shopping_cart values ('O1005',2215654,1);
insert into shopping_cart values ('O1006',1118417,1);
insert into shopping_cart values ('O1006',2215987,1);
insert into shopping_cart values ('O1007',1121550,2);
insert into shopping_cart values ('O1007',2215654,1);
insert into shopping_cart values ('O1008',2010654,15);
insert into shopping_cart values ('O1009',1118417,1);
insert into shopping_cart values ('O1009',1121550,1);
insert into shopping_cart values ('O1010',2215654,1);
insert into shopping_cart values ('O1010',1487234,1);
insert into shopping_cart values ('O1010',3123765,1);
insert into shopping_cart values ('O1010',1118417,1);

------------------------------------------------------------------------LOCATION_DETAILS----------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table location_details
(
location_id varchar2(8) primary key,                                /*Location details of all the stores and warehouses */
street_address  varchar2(30),
city varchar2(20),
state varchar2(4) not null,
zip_code number(5)
);

insert into location_details VALUES ('ST001', '100 Westfarms Mall', 'Hartford', 'CT', 06032);
insert into location_details VALUES ('ST002', '400 Commons Way', 'Bridgewater', 'NJ' ,08807);
insert into location_details VALUES ('ST003', '151 West 34th Street', 'New York', 'NY', 10001);
insert into location_details VALUES ('ST004', '450 Washington Street', 'Boston', 'MA', 02111);
insert into location_details VALUES ('ST005', '151 Broad Street', 'Stamford', 'CT', 06901);
insert into location_details VALUES ('WR001', '1004 Ross Park Mall', 'Pittsburgh', 'PA', 15237);

------------------------------------------------------------------------INVENTORY----------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE  inventory  
(    
	location_id varchar2(8) references location_details(location_id),
 	product_id number(7) references product(product_id),
  quantity number(4),                                                    /*The stock at each store and warehouose*/
  PRIMARY KEY (location_id,product_id)
);

INSERT INTO inventory   VALUES ('ST001', 2010654, 10);
INSERT INTO inventory   VALUES ('ST001', 2215654, 280);
INSERT INTO inventory   VALUES ('ST001', 1121550, 360);
INSERT INTO inventory   VALUES ('ST001', 1218987, 350);
INSERT INTO inventory   VALUES ('ST001', 2010612, 400);
INSERT INTO inventory   VALUES ('ST001', 3123765, 170);
INSERT INTO inventory   VALUES ('ST001', 2215987, 410);
INSERT INTO inventory   VALUES ('ST001', 1118417, 210);
INSERT INTO inventory   VALUES ('ST002', 2010654, 260);
INSERT INTO inventory   VALUES ('ST002', 2215654, 320);
INSERT INTO inventory   VALUES ('ST002', 1121550, 190);
INSERT INTO inventory   VALUES ('ST002', 1218987, 420);
INSERT INTO inventory   VALUES ('ST002', 1487234, 390);
INSERT INTO inventory   VALUES ('ST002', 2215987, 260);
INSERT INTO inventory   VALUES ('ST002', 1118417, 380);
INSERT INTO inventory   VALUES ('ST003', 2010654, 400);
INSERT INTO inventory   VALUES ('ST003', 2215654, 390);
INSERT INTO inventory   VALUES ('ST003', 1121550, 270);
INSERT INTO inventory   VALUES ('ST003', 1218987, 180);
INSERT INTO inventory   VALUES ('ST003', 2010612, 370);
INSERT INTO inventory   VALUES ('ST003', 3123765, 260);
INSERT INTO inventory  VALUES ('ST003', 2215987, 310);
INSERT INTO inventory   VALUES ('ST003', 1118417, 330);
INSERT INTO inventory   VALUES ('ST003', 1487234, 220);
INSERT INTO inventory   VALUES ('ST004', 2215654, 300);
INSERT INTO inventory   VALUES ('ST004', 1121550, 220);
INSERT INTO inventory   VALUES ('ST004', 1218987, 130);
INSERT INTO inventory   VALUES ('ST004', 2010612, 320);
INSERT INTO inventory   VALUES ('ST004', 3123765, 200);
INSERT INTO inventory   VALUES ('ST004', 2215987, 320);
INSERT INTO inventory   VALUES ('ST004', 1118417, 310);
INSERT INTO inventory   VALUES ('ST004', 1487234, 270);
INSERT INTO inventory   VALUES ('ST005', 2010654, 320);
INSERT INTO inventory   VALUES ('ST005', 2215654, 330);
INSERT INTO inventory   VALUES ('ST005', 1218987, 150);
INSERT INTO inventory   VALUES ('ST005', 2010612, 300);
INSERT INTO inventory   VALUES ('ST005', 3123765, 200);
INSERT INTO inventory   VALUES ('ST005', 1118417, 370);
INSERT INTO inventory   VALUES ('ST005', 1487234, 250);
INSERT INTO inventory   VALUES ('WR001', 2010654, 410);
INSERT INTO inventory   VALUES ('WR001', 2215654, 320);
INSERT INTO inventory   VALUES ('WR001', 1121550, 260);
INSERT INTO inventory   VALUES ('WR001', 1218987, 280);
INSERT INTO inventory   VALUES ('WR001', 2010612, 270);
INSERT INTO inventory   VALUES ('WR001', 3123765, 190);
INSERT INTO inventory  VALUES ('WR001', 2215987, 230);
INSERT INTO inventory   VALUES ('WR001', 1118417, 330);
INSERT INTO inventory   VALUES ('WR001', 1487234, 180);