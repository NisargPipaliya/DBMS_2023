

-- create--
CREATE TABLE ADDRESS(
  AID INTEGER PRIMARY KEY,
  BLOCK VARCHAR(10) NOT NULL,
  STREET VARCHAR(25) NOT NULL,
  LOCALITY VARCHAR(30) ,
  CITY VARCHAR(25) NOT NULL,
  PINCODE INTEGER NOT NULL CHECK(PINCODE <= 999999 AND PINCODE >=100000),
  STATE VARCHAR(25) NOT NULL,
  COUNTRY VARCHAR(25) NOT NULL
);

CREATE TABLE SEASON (
  seid INTEGER PRIMARY KEY,
  name VARCHAR(10) NOT NULL
);
CREATE TABLE EMPLOYEE (
  EID INTEGER PRIMARY KEY,
  NAME VARCHAR(30) NOT NULL,
  MNO numeric(10) NOT NULL,
  SALARY INTEGER NOT NULL,
  AID INTEGER references ADDRESS(AID) 
);


CREATE TABLE TOOLS(
  TID INTEGER PRIMARY KEY,
  NAME VARCHAR(20) NOT NULL,
  mode VARCHAR(15) not NULL,
  price INTEGER not NULL
);


CREATE TABLE PRODUCT(
  PID INTEGER PRIMARY KEY,
  SEID INTEGER references SEASON(SEID)
);
CREATE TABLE DISEASE(
  DID INTEGER PRIMARY KEY,
  NAME VARCHAR(25) NOT NULL,
  PID INTEGER references PRODUCT(PID) NOT NULL
);

CREATE TABLE MEDICINE(
  NAME VARCHAR(25) NOT NULL,
  COST INTEGER NOT NULL,
  COMPANY VARCHAR(25) NOT NULL,
  DID INTEGER references DISEASE(DID)
);


CREATE TABLE FRUITS(
  PID INTEGER references PRODUCT(PID) PRIMARY KEY,
  NAME VARCHAR(25) NOT NULL,
  SEID INTEGER references SEASON(SEID)
);


CREATE TABLE FLOWERS(
  PID INTEGER references PRODUCT(PID) PRIMARY KEY,
  NAME VARCHAR(25) NOT NULL,
  HABITATE VARCHAR(10) NOT NULL,
  SEID INTEGER references SEASON(SEID) NOT NULL
);

CREATE TABLE BERRIES(
  PID INTEGER references PRODUCT(PID) PRIMARY KEY,
  NAME VARCHAR(25) NOT NULL,
  SEID INTEGER references SEASON(SEID) NOT NULL
);

 
 
CREATE TABLE MANAGER(
  MID INTEGER references EMPLOYEE(EID) PRIMARY KEY
);
 
CREATE TABLE MANAGES( 
  MID INTEGER references MANAGER(MID) NOT NULL,
  PID INTEGER references PRODUCT(PID) NOT NULL
);

CREATE TABLE CUSTOMER(
  CID INTEGER PRIMARY KEY,
  NAME VARCHAR(30) NOT NULL,
  AID INTEGER references ADDRESS(AID) NOT NULL
);

CREATE TABLE USED_FOR(
  TID INTEGER references TOOLS(TID) NOT NULL,
  PID INTEGER references PRODUCT(PID) NOT NULL
);

CREATE TABLE GARDEN_OWNERS(
  GID INTEGER PRIMARY KEY,
  NAME VARCHAR(30) NOT NULL,
  number char(10) NOT NULL CHECK(LENGTH(number) =10),
  DURATION INTEGER NOT NULL CHECK(DURATION >0  AND DURATION <13),
  AREA numeric(6,2) NOT NULL CHECK (AREA > 0),
  CHARGEPERMONTH INTEGER NOT NULL CHECK(CHARGEPERMONTH > 0),
  TOTAL numeric(30,2) GENERATED ALWAYS AS (DURATION * CHARGEPERMONTH) STORED
);
-- TOTAL DECIMAL(30,2) AS (DURATION * CHARGEPERMONTH) STORED);

CREATE TABLE OWNS(
  GID INTEGER references GARDEN_OWNERS(GID) NOT NULL,
  PID INTEGER references PRODUCT(PID) NOT NULL
);

CREATE TABLE ORDERS(
  OID INTEGER PRIMARY KEY,
  ODATE DATE NOT NULL,
  OAMOUNT INTEGER NOT NULL CHECK (OAMOUNT > 0),
  QUANTITY INTEGER NOT NULL CHECK(QUANTITY > 0),
  PID INTEGER references PRODUCT(PID) NOT NULL,
  CID INTEGER references CUSTOMER(CID) NOT NULL
);

INSERT INTO address (aid, block, street, locality, city, pincode, state, country)
VALUES 
  (1, 123, 'Main Street', 'XYZ Colony', 'Mumbai', 400000, 'Maharashtra', 'India'),
  (2, 456, 'Park Avenue', 'ABC Nagar', 'Delhi', 110001, 'Delhi', 'India'),
  (3, 789, 'Ocean Drive', 'LMN Society', 'Goa', 403001, 'Goa', 'India'),
  (4, 987, 'River Road', 'PQR Colony', 'Chennai', 600000, 'Tamil Nadu', 'India'),
  (5, 654, 'Mountain View', 'STU Nagar', 'Hyderabad', 500032, 'Telangana', 'India'),
  (6, 321, 'Desert Drive', 'VWX Society', 'Jaipur', 302001, 'Rajasthan', 'India'),
  (7, 741, 'Highway Road', 'YZ Colony', 'Kolkata', 700064, 'West Bengal', 'India'),
  (8, 852, 'Beach Drive', 'AB Society', 'Vishakapatnam', 530001, 'Andhra Pradesh', 'India'),
  (9, 963, 'Meadow Lane', 'CD Nagar', 'Lucknow', 226001, 'Uttar Pradesh', 'India'),
  (10, 147, 'Forest Road', 'EF Colony', 'Bengaluru', 560001, 'Karnataka', 'India'),
  (11, 256, 'Sunset Boulevard', 'GHI Nagar', 'Pune', 411001, 'Maharashtra', 'India'),
  (12, 369, 'Rainbow Road', 'JKL Society', 'Ahmedabad', 380009, 'Gujarat', 'India'),
  (13, 159, 'River Bank', 'MNO Colony', 'Surat', 395007, 'Gujarat', 'India'),
  (14,753, 'Mountain Trail', 'PQR Nagar', 'Nagpur', 440018, 'Maharashtra', 'India'),
  (15, 951, 'Valley View', 'STU Society', 'Indore', 452001, 'Madhya Pradesh', 'India'),
  (16, 864, 'Desert Mirage', 'VWX Colony', 'Bhopal', 462001, 'Madhya Pradesh', 'India'),
  (17, 729, 'Highway Hill', 'YZ Nagar', 'Chandigarh', 160017, 'Chandigarh', 'India'),
  (18, 638, 'Beach Shore', 'AB Society', 'Dehradun', 248001, 'Uttarakhand', 'India'),
  (19, 547, 'Meadow Fields', 'CD Nagar', 'Patna', 800001, 'Bihar', 'India'),
  (20, 456, 'Forest Glade', 'EF Colony', 'Ranchi', 834001, 'Jharkhand', 'India');





INSERT INTO customer (cid, name, aid)
VALUES 
  (101, 'John Doe', 2),
  (102, 'Jane Smith', 1),
  (103, 'Bob Brown', 3),
  (104, 'Alice Smith', 5),
  (105, 'Tom Jones', 4),
  (106, 'Sarah Johnson', 6),
  (107, 'Michael Davis', 7),
  (108, 'Emily Martinez', 8),
  (109, 'William Anderson', 9)
  ;

INSERT INTO season (seid, name)
VALUES
  (1, 'Spring'),
  (2, 'Summer'),
  (3, 'Autumn'),
  (4, 'Winter'),
  (5, 'Monsoon'),
  (6,'nse');

INSERT INTO employee (eid, name, mno, salary, aid)
VALUES
  (201, 'John Doe', '9876543210', 50000, 10),
  (202, 'Jane Doe', '9765432100', 60000, 11),
  (203, 'Jim Smith', '9567432100', 70000, 12),
  (204, 'Emily Brown', '9234567890', 80000, 13),
  (205, 'Michael Johnson', '9632147850', 90000, 14),
  (206, 'Emily Davis', '9087654321', 55000, 15),
  (207, 'William Wilson', '9867123456', 65000, 16),
  (208, 'Daniel Brown', '9561237890', 75000, 17),
  (209, 'David Anderson', '9461237890', 85000, 18),
  (210, 'Richard Wilson', '9741503698', 95000, 19);

INSERT INTO tools (tid, name, mode, price)
VALUES
  (301, 'Lawn Mower', 'Manual', 1000),
  (302, 'Pruning Shears', 'Manual', 100),
  (303, 'Hedge Trimmer', 'Electric', 1500),
  (304, 'Leaf Blower', 'Gas', 2000),
  (305, 'Garden Trowel', 'Manual', 50),
  (306, 'Garden Hoe', 'Manual', 75),
  (307, 'Garden Rake', 'Manual', 80),
  (308, 'Wheelbarrow', 'Manual', 300),
  (309, 'Gardening Gloves', 'Manual', 20),
  (310, 'Watering Can', 'Manual', 25),
  (311, 'Garden Shovel', 'Manual', 75),
  (312, 'Tree Pruner', 'Manual', 200),
  (313, 'Garden Scissors', 'Manual', 60),
  (314, 'Soil Knife', 'Manual', 40),
  (315, 'Garden Spade', 'Manual', 90);
  
  INSERT INTO product (pid, seid)
VALUES 
  (401, 1),
  (402, 2),
  (403, 3),
  (404, 4),
  (405, 5),
  (406, 1),
  (407, 2),
  (408, 3),
  (409, 4),
  (410, 5),
  (411, 1),
  (412, 2),
  (413, 3),
  (414, 4),
  (415, 5),
  (416, 1),
  (417, 2),
  (418, 3),
  (419, 4),
  (420, 5);

INSERT INTO disease (did, name, pid)
VALUES
  (501, 'Blackspot', 402),
  (502, 'Powdery Mildew', 402),
  (503, 'Rust', 403),
  (504, 'Leaf Spot', 404),
  (505, 'Bacterial Wilt', 405),
  (506, 'Late Blight', 406),
  (507, 'Downy Mildew', 407),
  (508, 'Verticillium Wilt', 408),
  (509, 'Fusarium Wilt', 409),
  (510, 'Clubroot', 410),
  (511, 'Root Rot', 411),
  (512, 'Crown Rot', 412),
  (513, 'Aphid Infestation', 413),
  (514, 'Spider Mite Infestation', 414),
  (515, 'Thrips Infestation', 415),
  (516, 'Whitefly Infestation', 415),
  (517, 'Blossom End Rot', 417),
  (518, 'Fire Blight', 418),
  (519, 'Scab', 419),
  (520, 'Verticillium Wilt',420),
  (521, 'Damping Off', 411),
  (522, 'Virus Infection', 412);


INSERT INTO medicine (name, cost, company, did)
VALUES
  ('Amoxicillin', 15, 'XYZ Laboratories', 501),
  ('Metronidazole', 20, 'PQR Inc.', 502),
  ('Ciprofloxacin', 25, 'DEF Corp', 503),
  ('Clindamycin', 30, 'GHI Enterprises', 504),
  ('Azithromycin', 35, 'JKL Ltd', 505),
  ('Erythromycin', 40, 'MNO Inc', 506),
  ('Doxycycline', 45, 'STU Enterprises', 507),
  ('Minocycline', 50, 'VWX Pvt Ltd', 508),
  ('Tetracycline', 55, 'YZ Company', 509),
  ('Levofloxacin', 60, 'ABC Limited', 510),
  ('Linezolid', 65, 'DEF Pvt Ltd', 511),
  ('Nitrofurantoin', 70, 'GHI Corp', 512), 
  ('Penicillin', 75, 'JKL Inc', 513),
  ('Sulfamethoxazole', 80, 'MNO Laboratories', 514),
  ('Trimethoprim', 85, 'PQR Enterprises', 515),
  ('Cefuroxime', 90, 'STU Corp', 516),
  ('Cefpodoxime', 95, 'VWX Ltd',517),
  ('Cefixime', 100, 'YZ Pvt Ltd',518),
  ('Ceftriaxone', 105, 'ABC Limited', 519),
  ('Ceftazidime', 110, 'DEF Enterprises',520);


INSERT INTO FRUITS (PID, NAME, SEID)VALUES
(401, 'Apple', 4),
(402, 'Banana', 6),
(403, 'Mango', 2),
(404, 'Papaya', 2),
(405, 'Grapes', 4),
(420,'Watermelon',2);


INSERT INTO FLOWERS (PID, NAME,HABITATE, SEID)VALUES
(411,'Rose','Garden',5),
(412,'Marigold','Wild',3),
(413,'Hibiscus','Tropical',4),
(414,'Jasmin','Temperate',2),
(415,'Lotus','Woodland',2);

INSERT INTO BERRIES (PID,NAME,SEID) VALUES
(406,'Blackberry',5),
(407,'Blueberry',3),
(408,'Craneberry',1),
(409,'Avocado',1),
(410,'Tayberry',4),
(416,'Strawberry',4),
(417,'Raspberry',2),
(418,'Lychee',2),
(419,'abcberry',5);

INSERT INTO MANAGER (MID) VALUES
(210),
(209),
(208);

INSERT INTO MANAGES(MID,PID) VALUES
(210,401),
(210,411),
(208,416),
(209,417),
(210,402),
(209,403),
(210,404),
(208,405),
(209,406),
(209,407),
(208,408),
(209,409),
(210,410),
(208,412),
(208,413),
(210,414),
(210,415),
(209,418),
(209,419),
(208,420);

INSERT INTO USED_FOR(TID,PID) VALUES
(301,411),
(303,412),
(302,413),
(301,414),
(302,401),
(305,402),
(303,403),
(305,404),
(304,405),
(306,412),
(310,417),
(310,420),
(315,410),
(313,417),
(314,418);






  insert into GARDEN_OWNERS(gid, name, number,DURATION, AREA, CHARGEPERMONTH) VALUES
  (101, 'Nisarg', 9999999999, 12,50,50000),
  (102, 'Snehal', 9998999999, 10,22,5000), 
  (103, 'Akshay', 9999999989, 6,100,100000),
  (104, 'ABC', 9999999999, 12,120,80000),
  (105, 'XYZ', 9999999999, 5,500,125000);

 insert into owns(gid, pid) VALUES
 (101,402),
 (101,405),
 (102,412),
 (103,415),
 (103,404),
 (104,405),
 (105,420);

 insert into ORDERS(oid, odate, oamount, QUANTITY,pid, cid) VALUES
 (201,'2023-02-09', 20000,12, 402, 101),
(202,'2023-02-14', 29000,50, 405, 102),
(203,'2023-02-15', 1000,3, 412, 105),
(204,'2023-02-10', 89000,50, 415, 107),
(205,'2023-02-12', 36000,23, 420, 106),
(206,'2023-01-10', 96000,100,415,109);




-- cursor project 

create or replace procedure calc_tax()
language plpgsql
as $$
declare
rec1 record;
tax integer;
cur1 cursor for select * from employee ;
begin 
    open cur1;
     loop
        fetch cur1 into rec1;
        exit when not found;
        tax := rec1.salary*0.3;
        raise notice 'NAME = %',rec1.name;
        raise NOTICE 'Tax = %',tax;
     end loop;
    close cur1;
end;
$$;


-- trigger project

CREATE OR REPLACE FUNCTION update_employee_salary() 
RETURNS TRIGGER AS $$
BEGIN
  UPDATE employee
  SET salary = salary + (salary * 0.1)
  WHERE eid = NEW.eid;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER increase_employee_salary
AFTER INSERT ON employee
FOR EACH ROW
EXECUTE FUNCTION update_employee_salary();





CREATE OR REPLACE FUNCTION prevent_deletion() RETURNS trigger AS $$
DECLARE
  orders_count INTEGER;
BEGIN
  SELECT COUNT(*) INTO orders_count
  FROM orders
  WHERE pid = OLD.pid;
  IF orders_count > 0 THEN
    RAISE EXCEPTION 'Cannot delete product with associated orders.';
  END IF;
  RETURN OLD;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER prevent_deletion
BEFORE DELETE ON product
FOR EACH ROW
EXECUTE FUNCTION prevent_deletion();
