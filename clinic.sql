create database clinic;
use clinic;

create table doctor (
doctor_id int primary key identity ,
fullname varchar(50),
phone decimal(38, 0),
gender varchar(50),
gmail varchar(50),
Specialization varchar(50),
);


insert into doctor (fullname,phone,gender,gmail,Specialization)values('ahmedmohamedzaki',012365,'man','ahmed79','Heart disease');
insert into doctor (fullname,phone,gender,gmail,Specialization)values('mohamedabdelramanali',012587,'man','mohamed#90','bone diseases');
insert into doctor (fullname,phone,gender,gmail,Specialization)values('aliahmedali',789236,'man','ali89','Gynecology major');
insert into doctor (fullname,phone,gender,gmail,Specialization)values('moustafaelsaidhassan',456921,'man','moustafa31','Children’s diseases');
insert into doctor (fullname,phone,gender,gmail,Specialization)values('omaraleemmohamed',795163,'man','omar43','Beauty Specialist');
insert into doctor (fullname,phone,gender,gmail,Specialization)values('ayaramadanali',799521,'female','ayaahmed77','Internist');
insert into doctor (fullname,phone,gender,gmail,Specialization)values('habibaessammahmoud',875487,'female','habiba07','Dentist');
insert into doctor (fullname,phone,gender,gmail,Specialization)values('monaabdelallahahmed',786526,'female','mona32','Kidney Doctor');
insert into doctor (fullname,phone,gender,gmail,Specialization)values('rewanamrhassn',452645,'female','rewan97','eyes doctor');

create table medicine (
medicine_id int primary key identity,
thenameofmedicine varchar(50) ,
classification varchar(50) , 
[type] varchar(50),
expiry date,
ProductionDate date,
duration varchar(50),
price decimal(38, 0),
);


insert into medicine (thenameofmedicine,classification,[type],expiry,productiondate,duration,price)values('Paracetamol','Young and old','Antipyretic','2021-5-25','2020-5-25','two weeks',100);
insert into medicine (thenameofmedicine,classification,[type],expiry,productiondate,duration,price)values('Flupertine','Young and old','To relax the muscles','2021-12-29','2020-12-29','one month',200);
insert into medicine (thenameofmedicine,classification,[type],expiry,productiondate,duration,price)values('Luxra drop ','Elderly only','moisturize the eye','2021-6-18','2020-6-18','3 times in day',159);
insert into medicine (thenameofmedicine,classification,[type],expiry,productiondate,duration,price)values('Amoxicillin','Over the age of 15','Infection with the stomach germ','2021-3-11','2020-3-11','twice in day',350);
insert into medicine (thenameofmedicine,classification,[type],expiry,productiondate,duration,price)values('Ibuprofen','Young and old','Toothache','2021-6-6','2020-6-6','Once a day',500);
insert into medicine (thenameofmedicine,classification,[type],expiry,productiondate,duration,price)values('Minoprudol','Elderly only','calming the movement of the heart muscle','2021-2-22','2020-2-22','oce in day',400);

create table patient(
patient_id int primary key identity,
fullname varchar(50),
age   tinyint,
gender varchar(50),
disease varchar(50),
bloodtype varchar(50),
phone decimal(38, 0),
address  varchar(50),
doctor_id INT FOREIGN KEY REFERENCES doctor(doctor_id),
medicine_id INT FOREIGN KEY REFERENCES medicine(medicine_id)
);

insert into patient (fullname,age,gender,disease,bloodtype,phone,[address], doctor_id, medicine_id)values('magdyebrahimmohamed',35,'man','Leg broken','A+',4459236,'Mandara neighborhood',1,2);
insert into patient (fullname,age,gender,disease,bloodtype,phone,[address], doctor_id, medicine_id)values('seifalieldinmahmoud',23,'man','Inflammation of the eyes','B-',445896,'Sidi Bishr neighborhood',2,5);
insert into patient (fullname,age,gender,disease,bloodtype,phone,[address], doctor_id, medicine_id)values('ziadahmedmohamed',17,'man','Collywobbles','O-',426935,'Sidi Gaber neighborhood',6,4);
insert into patient (fullname,age,gender,disease,bloodtype,phone,[address], doctor_id, medicine_id)values('ahmedyousrykhamis',69,'man','heart disease','A-',78562,'Smouha',1, null);
insert into patient (fullname,age,gender,disease,bloodtype,phone,[address], doctor_id, medicine_id)values('ashrafhanyadly',52,'man','Kidney failure','B+',456283,'Al-Ajmi neighborhood',5,6);
insert into patient (fullname,age,gender,disease,bloodtype,phone,[address], doctor_id, medicine_id)values('minamarkhany',9,'man','Orthodontics','AB+',445963,'Al-Montazah District',3, null);
insert into patient (fullname,age,gender,disease,bloodtype,phone,[address], doctor_id, medicine_id)values('amlahmedali',45,'female','tumor','A+',442968,'Kafr El-Sheikh',2,6);
insert into patient (fullname,age,gender,disease,bloodtype,phone,[address], doctor_id, medicine_id)values('ranaelsaidessia',13,'female','week looking','B-',346695,'Al-Montazah District',null,3);
insert into patient (fullname,age,gender,disease,bloodtype,phone,[address], doctor_id, medicine_id)values('amanymohabmahmoud',70,'female','Stomach inflammation','AB+',345896,'Cairo',null, null);

create table bill(
bill_id int primary key identity ,
Theamountpaid decimal(38, 0),
Paymentmethod varchar(50),
[date] date,
patient_id INT FOREIGN KEY REFERENCES patient(patient_id)
);

insert into bill (Theamountpaid,Paymentmethod,[date], patient_id)values(156,'cash','2020-6-18',1);
insert into bill (Theamountpaid,Paymentmethod,[date], patient_id)values(248,'cash','2020-6-29',2);
insert into bill (Theamountpaid,Paymentmethod,[date], patient_id)values(1269,'credit card','2020-7-3',5);
insert into bill (Theamountpaid,Paymentmethod,[date], patient_id)values(3697,'credit card', '2020-6-25',6);
insert into bill (Theamountpaid,Paymentmethod,[date], patient_id)values(6932,'credit card', '2020-7-15',4);

-- #1 How to put Dr before the fullname of the doctor ?
select CONCAT('Dr.', fullname) from doctor;

-- #2 Which is the least age in patients? 
SELECT min(age)
FROM patient;

-- #3 What is the largest amountpaid in the bill?
SELECT MAX(Theamountpaid) 
FROM bill;  

-- #4 Bring the list number of doctors list?
SELECT COUNT(*)
FROM doctor;   

-- #5 Calculate the total prices of all medicines?
SELECT SUM(price) 
FROM medicine;  

-- #6 Calculate the average age of patients?
SELECT AVG(age)
FROM patient;

--#7 Replace the small f with a large F in the fullname list in the doctors table?
SELECT  REPLACE 
(fullname, 'f', 'F')from doctor;

--#8 Extract a number of letters into the Specialization column in the doctor table (start from right)?
SELECT right(Specialization, 3)from doctor ;       


--#9 Convert any letter in the full name list in Doctors' table into Capital?
SELECT UPPER(fullname)from doctor;

--#10 Convert any letter in the disease list in patient' table into Capital?
SELECT LOWER(disease)from patient;

--#11 What is the difference between the type and classification of the medication table?
SELECT DIFFERENCE(classification, [type])from medicine;

--#12 Place the gender list between () in the patient table?
SELECT QUOTENAME(gender, '()')from patient;

--#13 Repeat the gmail twice form the doctors'table?
SELECT REPLICATE(gmail, 2)
FROM doctor;

--#14 Reflect the content in the bloodtype column in the patient table?
SELECT REVERSE(bloodtype)from patient;

--#15 return the ASCII value of the address column?
SELECT  ASCII([address]) 
FROM patient;

--#16 Calculate the number of letters in the fullname in the doctors' table?
SELECT LEN (fullname)
from patient;

--#17  List  the count of all mdicine?
Select count (*) 
From medicine ;

--#18 Remove leading spaces from the fullname column in the doctors table?
SELECT LTRIM( fullname) from doctor;


--#19 select the word from the first letter to the third letter from the paymentmethod list from the bill table?
SELECT SUBSTRING(Paymentmethod, 1, 3)from bill;

 --#20 Extract a number of letters into the disease column in the patient table (start from left)?
SELECT LEFT(disease, 3)from patient ;   

-- SUB QUERY
SELECT * FROM PATIENT WHERE doctor_id in (SELECT doctor_id FROM DOCTOR WHERE fullname='mohamedabdelramanali' );
SELECT * FROM bill WHERE patient_id in (SELECT patient_id FROM patient WHERE fullname='ahmedyousrykhamis' );
SELECT * FROM PATIENT WHERE medicine_id in (SELECT  medicine_id FROM  medicine WHERE thenameofmedicine='Ibuprofen' );    

--COUNT AND GROUP BY
SELECT gender, COUNT(*) FROM PATIENT GROUP BY gender;
SELECT bloodtype, COUNT(*)from patient GROUP BY bloodtype;

-- JOINS

--INNER
SELECT doctor.doctor_ID,doctor.gender, doctor.Specialization
FROM doctor
INNER JOIN patient ON doctor.doctor_ID=patient.doctor_ID;

--left
SELECT patient.fullname,  patient.disease, bill.date
FROM PATIENT
LEFT JOIN BILL
ON PATIENT.PATIENT_ID = BILL.PATIENT_ID;

--right
SELECT medicine.medicine_id ,patient.age
FROM medicine
RIGHT JOIN patient
ON medicine.medicine_id= patient.medicine_id;

--full join
SELECT doctor.doctor_id,patient.disease
FROM doctor
FULL OUTER JOIN patient
ON doctor.doctor_id = patient.doctor_id;

--self
SELECT A.thenameofmedicine ,B.thenameofmedicine
FROM medicine A, medicine B;

--update

update doctor set phone=252536 where doctor_id=7;
update patient set bloodtype='A+' where patient_id=4;
update medicine set price=227 where medicine_id=2;
update bill set Theamountpaid=969 where bill_id=3;
update doctor set fullname='seifmahmoudalieldin' where doctor_id=2;

--delete
delete from bill where bill_id=4;
delete from patient where patient_id=6;
delete from doctor where doctor_id=3;
delete from bill where bill_id=3;
DELETE FROM  bill WHERE bill_id = 5;  

