create database Assignment;

use Assignment;

create table Airlines 
	(Airlines_ID nvarchar(50) Primary Key, 
	Airlines_Name nvarchar(50));

	insert into Airlines values ('EA1709','Echo Airline');
	insert into Airlines values ('SA1865','Spark Airways');
	insert into Airlines values ('PA2098','Peak Airways');
	insert into Airlines values ('CA8760','Core Airways');

	select * from Airlines;

create table Flight 
	(Flight_ID nvarchar(50) Primary Key, 
	Total_Seats_Business int, 
	Total_Seats_Economy int,
	Departure_Date date,
	Departure_Time time,
	Arrival_Date date,
	Arrival_Time time,
	Origin_State nvarchar(50),
	Destination_State nvarchar(50),
	Airlines_ID nvarchar(50) Foreign Key References Airlines(Airlines_ID));

	insert into Flight values ('FL1001','255','255','1 Jan 2023','23:00',
								'2 Jan 2023','01:00','Wilayah Persekutuan Kuala Lumpur','Sabah','EA1709');
	insert into Flight values ('FL1002','21','123','3 Jan 2023','23:15',
								'4 Jan 2023','01:30','Sarawak','Pahang','SA1865');
	insert into Flight values ('FL1003','235','436','5 Jan 2023','23:45',
								'6 Jan 2023','01:50','Pahang','Sabah','PA2098');
	insert into Flight values ('FL1004','135','356','7 Jan 2023','23:55',
								'8 Jan 2023','01:00','Negeri Sembilan','Sarawak','CA8760');
	insert into Flight values ('FL1005','153','235','9 Jan 2023','23:12',
								'10 Jan 2023','01:24','Perak','Wilayah Persekutuan Kuala Lumpur','EA1709');
	insert into Flight values ('FL1006','38','44','28 Feb 2023','11:00',
								'28 Feb 2023','13:00','Perak','Negeri Sembilan','SA1865');

	select * from Flight;

create table Pilot 
	(Pilot_ID nvarchar(50) Primary Key, 
	First_Name nvarchar(50), 
	Last_Name nvarchar(50),
	Age tinyint,
	Experience tinyint, -- In years
	Position nvarchar(50),
	Flying_Hours int,
	Salary decimal(10,2));

	insert into Pilot values ('PI1001','James','Tan','28','5','Senior Pilot','20000','3000');
	insert into Pilot values ('PI1002','Jane','Gan','29','6','Pilot','10000','4000');
	insert into Pilot values ('PI1003','Jackson','Lim','30','7','Pilot','15000','3000');
	insert into Pilot values ('PI1004','Julian','Ong','31','8','Senior Pilot','25000','4000');
	insert into Pilot values ('PI1005','John','Lee','32','9','Senior Pilot','30000','3000');
	insert into Pilot values ('PI1006','Joseph','Ng','33','10','Pilot','19000','3000');
	insert into Pilot values ('PI1007','Mikael','Tinnason','33','10','Pilot','19000','3000');
	insert into Pilot values ('PI1008','Julia','Chong','33','10','Pilot','5000','4000');

	select * from Pilot;

create table Pilot_Flight 
	(Pilot_Flight_ID nvarchar(50) Primary Key, 
	Pilot_ID nvarchar(50) Foreign Key References Pilot(Pilot_ID),
	Flight_ID nvarchar(50) Foreign Key References Flight(Flight_ID));

	insert into Pilot_Flight values ('PF1001','PI1001','FL1001');
	insert into Pilot_Flight values ('PF1002','PI1002','FL1002');
	insert into Pilot_Flight values ('PF1003','PI1003','FL1003');
	insert into Pilot_Flight values ('PF1004','PI1004','FL1004');
	insert into Pilot_Flight values ('PF1005','PI1005','FL1005');
	insert into Pilot_Flight values ('PF1006','PI1007','FL1006');

	select * from Pilot_Flight;

create table Address_FA
	(Address_ID nvarchar(50) Primary Key, 
	Street nvarchar(100),
	City nvarchar(50),
	State nvarchar(50),
	Postal_Code nvarchar(50),
	Country nvarchar(50));

	insert into Address_FA values ('ADFA1001','14, Jalan Junid','Muar','Johor','84000','Malaysia');
	insert into Address_FA values ('ADFA1002','40, Jalan Tan Chay Yan','Melaka','Melaka','75300','Malaysia');
	insert into Address_FA values ('ADFA1003','Lot 1591,Jalan Persiaran Indahpura 6, Taman Indahpura','Kulai','Johor','81000','Malaysia');
	insert into Address_FA values ('ADFA1004','59-C, Jalan Ibrahim Sultan','Johor Bahru','Johor','80300','Malaysia');
	insert into Address_FA values ('ADFA1005','Jalan Purnama 4, Bandar Seri Alam','Masai','Johor','81750','Malaysia');
	insert into Address_FA values ('ADFA1006','1/2, Jalan St Thomas, Off, Jln Sultan Azlan Shah, Batu 3','Kuala Lumpur','Kuala Lumpur','51100','Malaysia');

	select * from Address_FA;

create table Flight_Attendant
	(Attendant_ID nvarchar(50) Primary Key, 
	Full_Name nvarchar(50),
	Position nvarchar(50),
	Salary decimal(10,2),
	Phone_Number nvarchar(50),
	Address_ID nvarchar(50) Foreign Key References Address_FA(Address_ID));

	insert into Flight_Attendant values ('FA1001','Jacob Goh','Flight Attendant','3000','012-345 6789','ADFA1001');
	insert into Flight_Attendant values ('FA1002','Josephine Lau','Senior Flight Attendant','4000','017-101 1121','ADFA1002');
	insert into Flight_Attendant values ('FA1003','Jackson Teo','Flight Attendant','3000','018-314 1516','ADFA1003');
	insert into Flight_Attendant values ('FA1004','Jessica Neo','Senior Flight Attendant','4000','019-171 8192','ADFA1004');
	insert into Flight_Attendant values ('FA1005','Jack Tey',' Senior Flight Attendant','4000','013-021 2223','ADFA1005');
	insert into Flight_Attendant values ('FA1006','Jade Koh','Flight Attendant','3000','011-2425 2627','ADFA1006');

	select * from Bridge;

create table Bridge
	(Bridge_ID nvarchar(50) Primary Key, 
	Attendant_ID nvarchar(50) Foreign Key References Flight_Attendant(Attendant_ID),
	Flight_ID nvarchar(50) Foreign Key References Flight(Flight_ID));

	insert into Bridge values ('BR1001','FA1001','FL1001');
	insert into Bridge values ('BR1002','FA1002','FL1002');
	insert into Bridge values ('BR1003','FA1003','FL1003');
	insert into Bridge values ('BR1004','FA1004','FL1004');
	insert into Bridge values ('BR1005','FA1005','FL1005');
	insert into Bridge values ('BR1006','FA1006','FL1006');
	insert into Bridge values ('BR1007','FA1005','FL1006');

create table Mailing_Address_C
	(Address_ID nvarchar(50) Primary Key, 
	Street nvarchar(100),
	City nvarchar(50),
	State nvarchar(50),
	Postal_Code nvarchar(50),
	Country nvarchar(50));

	insert into Mailing_Address_C values ('ADC1001','Lorong Hang Jebat, City Centre','Kuala Lumpur','Wilayah Persekutuan Kuala Lumpur','50150','Malaysia');
	insert into Mailing_Address_C values ('ADC1002','Jln Syed Putra, Bukit Seputeh','Kuala Lumpur','Wilayah Persekutuan Kuala Lumpur','50150','Malaysia');
	insert into Mailing_Address_C values ('ADC1003','6, Jln Loke Yew, Pudu','Kuala Lumpur','Wilayah Persekutuan Kuala Lumpur','50150','Malaysia');
	insert into Mailing_Address_C values ('ADC1004','Jln Tun Dr. Ismail, Taman Unian','Seremban','Negeri Sembilan','70200','Malaysia');
	insert into Mailing_Address_C values ('ADC1005','Kampung Baru','Penang','Penang','11400','Malaysia');
	insert into Mailing_Address_C values ('ADC1006','Jalan Sekolah Chong Hwa','Kluang','Johor','86000','Malaysia');
	insert into Mailing_Address_C values ('ADC1007','Jalan Tanjong Laboh Batu 2','Batu Pahat','Johor','83000','Malaysia');

	select * from Mailing_Address_C;

create table Customer
	(Customer_ID nvarchar(50) Primary Key, 
	First_Name nvarchar(50),
	Last_Name nvarchar(50),
	Address_ID nvarchar(50) Foreign Key References Mailing_Address_C(Address_ID));

	insert into Customer values ('CU1001','John','Pang','ADC1001');
	insert into Customer values ('CU1002','Jasmine','Tee','ADC1002');
	insert into Customer values ('CU1003','Julian','Soh','ADC1003');
	insert into Customer values ('CU1004','Jennifer','Toh','ADC1004');
	insert into Customer values ('CU1005','Jayden','Chua','ADC1005');
	insert into Customer values ('CU1006','Jacqueline','Loh','ADC1006');
	insert into Customer values ('CU1007','Jasin','Lim','ADC1007');

	select * from Customer;

create table Office
	(Office_ID nvarchar(50) Primary Key, 
	States nvarchar(50));

	insert into Office values ('OF1001','Perak');
	insert into Office values ('OF1002','Negeri Sembilan');
	insert into Office values ('OF1003','Pahang');
	insert into Office values ('OF1004','Sabah');
	insert into Office values ('OF1005','Sarawak');
	insert into Office values ('OF1006','Wilayah Persekutuan Kuala Lumpur');

	select * from Office;

create table Booking
	(Booking_ID nvarchar(50) Primary Key, 
	Date date,
	Seats_Type nvarchar(50),
	Seats_Number int,
	Charges_For_Each_Flight decimal(10,2),
	Total_Charges decimal(10,2),
	Customer_ID nvarchar(50) Foreign Key References Customer(Customer_ID),
	Office_ID nvarchar(50) Foreign Key References Office(Office_ID));

	insert into Booking values ('BO1001','18 Dec 2022','Business','1','111','111','CU1001','OF1001');
	insert into Booking values ('BO1002','16 Sep 2022','Economy','2','121.20','242.40','CU1002','OF1002');
	insert into Booking values ('BO1003','28 Sep 2022','Business','3','131.30','393.90','CU1003','OF1003');
	insert into Booking values ('BO1004','31 Aug 2022','Economy','4','141.40','565.60','CU1004','OF1004');
	insert into Booking values ('BO1005','22 Dec 2022','Business','5','150','750','CU1005','OF1005');
	insert into Booking values ('BO1006','25 Dec 2022','Economy','6','168.99','1013.94','CU1006','OF1006');
	insert into Booking values ('BO1007','25 Dec 2022','Economy','1','168.99','1013.94','CU1005','OF1006');
	insert into Booking values ('BO1008','23 Dec 2022','Economy','1','168.99','1013.94','CU1005','OF1006');

	select * from Booking;

create table Flight_Booking
	(Flight_Booking_ID nvarchar(50) Primary Key, 
	Flight_ID nvarchar(50) Foreign Key References Flight(Flight_ID), 
	Booking_ID nvarchar(50) Foreign Key References Booking(Booking_ID));

	insert into Flight_Booking values ('FB1001','FL1001','BO1001');
	insert into Flight_Booking values ('FB1002','FL1002','BO1002');
	insert into Flight_Booking values ('FB1003','FL1003','BO1003');
	insert into Flight_Booking values ('FB1004','FL1004','BO1004');
	insert into Flight_Booking values ('FB1005','FL1005','BO1005');
	insert into Flight_Booking values ('FB1006','FL1006','BO1006');

	select * from Flight_Booking;

create table House_Phone_Number_C
	(Phone_ID nvarchar(50) Primary Key, 
	Number nvarchar(50),
	Customer_ID nvarchar(50) Foreign Key References Customer(Customer_ID));

	insert into House_Phone_Number_C values ('PH1001','014-292 4213','CU1001');
	insert into House_Phone_Number_C values ('PH1002','014-124 1295','CU1002');
	insert into House_Phone_Number_C values ('PH1003','011-1129 8412','CU1003');
	insert into House_Phone_Number_C values ('PH1004','010-125 8143','CU1004');
	insert into House_Phone_Number_C values ('PH1005','014-371 5892','CU1005');
	insert into House_Phone_Number_C values ('PH1006','017-034 2791','CU1006');

	select * from House_Phone_Number_C;

create table Email_Address_C
	(Email_ID nvarchar(50) Primary Key, 
	Email_Address nvarchar(50),
	Customer_ID nvarchar(50) Foreign Key References Customer(Customer_ID));

	insert into Email_Address_C values ('EM1001','John.Pang@dosta.com.my','CU1001');
	insert into Email_Address_C values ('EM1002','Jasmine.Tee@dosta.com.my','CU1002');
	insert into Email_Address_C values ('EM1003','Julian.Soh@dosta.com.my','CU1003');
	insert into Email_Address_C values ('EM1004','Jennifer.Toh@dosta.com.my','CU1004');
	insert into Email_Address_C values ('EM1005','Jayden.Chua@dosta.com.my','CU1005');
	insert into Email_Address_C values ('EM1006','Jacqueline.Loh@dosta.com.my','CU1006');

	select * from Email_Address_C;

create table Passenger
	(Passenger_ID nvarchar(50) Primary Key, 
	Name nvarchar(50),
	Phone nvarchar(50));

	insert into Passenger values ('PA1001','John Pang','014-292 4213');
	insert into Passenger values ('PA1002','Jasmine Tee','014-124 1295');
	insert into Passenger values ('PA1003','Julian Soh','011-1129 8412');
	insert into Passenger values ('PA1004','Jennifer Toh','010-125 8143');
	insert into Passenger values ('PA1005','Jayden Chua','011-1371 5892');
	insert into Passenger values ('PA1006','Jacqueline Loh','017-034 2791');

	select * from Passenger;

create table Booking_Passenger
	(Booking_Passenger_ID nvarchar(50) Primary Key, 
	Passenger_ID nvarchar(50) Foreign Key References Passenger(Passenger_ID),
	Booking_ID nvarchar(50) Foreign Key References Booking(Booking_ID));

	insert into Booking_Passenger values ('BP1001','PA1001','BO1001');
	insert into Booking_Passenger values ('BP1002','PA1002','BO1002');
	insert into Booking_Passenger values ('BP1003','PA1003','BO1003');
	insert into Booking_Passenger values ('BP1004','PA1004','BO1004');
	insert into Booking_Passenger values ('BP1005','PA1005','BO1005');
	insert into Booking_Passenger values ('BP1006','PA1006','BO1006');

	select * from Booking_Passenger;
