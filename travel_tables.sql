

CREATE TABLE Employee
(
  Emp_ID INT(7) NOT NULL AUTO_INCREMENT,
  FNAMAE VARCHAR(20) NOT NULL,
  LNAME VARCHAR(20) NOT NULL,
  Salary int(6) NOT NULL,
  Mobile varchar(12) UNIQUE,
  Designations varchar(20) NOT NULL,
  E_Mail varchar(32) unique,
  PRIMARY KEY (Emp_ID)
);

CREATE TABLE Package
(
  Package_Name varchar(20) UNIQUE,
  Package_Type varchar(15) NOT NULL,
  Description varchar(100) NOT NULL,
  Destination varchar(20) NOT NULL,
  Price INT(6) NOT NULL,
  P_ID INT(7) NOT NULL AUTO_INCREMENT ,
  Transport_Mode VARCHAR(15) NOT NULL,
  Seats INT(3) NOT NULL,
  Positivity_Rate INT(2) NOT NULL,
  Vehicle_Type VARCHAR(20) NOT NULL,
  PRIMARY KEY (P_ID)
);

CREATE TABLE Client
(
  C_ID INT(7)  NOT NULL AUTO_INCREMENT ,
  FNAME VARCHAR(20) NOT NULL,
  LNAME VARCHAR(20) NOT NULL,
  Mobile VARCHAR(12) UNIQUE,
  E_mail VARCHAR(32) UNIQUE,
  Vaccination BOOLEAN NOT NULL,
  Vac_Certificate VARCHAR(20) not null,
  COVID_19_Report varchar(20) not null,
  Budget int(6) not null,
  PRIMARY KEY (C_ID)
);

CREATE TABLE Enquiry
(
  Emp_ID INT(7) NOT NULL,
  C_ID INT(7) NOT NULL,
  Subject VARCHAR(30) NOT NULL,
  Description VARCHAR(200) NOT NULL,
  Remark VARCHAR(70) NOT NULL,
 
  FOREIGN KEY (C_ID) REFERENCES Client(C_ID),
  FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID)
);

CREATE TABLE Register
(
  Reg_date DATE NOT NULL,
  C_ID INT(7) NOT NULL,
  FOREIGN KEY (C_ID) REFERENCES Client(C_ID)
);

CREATE TABLE Answer
(
  Answer_Date DATE NOT NULL,
  Emp_ID INT(7) NOT NULL,
  FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID)
);

CREATE TABLE Booking
(
  C_ID INT(7) NOT NULL,
  B_ID INT(7) NOT NULL,
  Pack_ID INT(7) NOT NULL,
  cost INT(6) NOT NULL,


  PRIMARY KEY (B_ID),
  FOREIGN KEY (Pack_ID) REFERENCES Package(P_ID),
  FOREIGN KEY (C_ID) REFERENCES Client(C_ID)
);

CREATE TABLE Transaction
(
  C_ID INT(7) NOT NULL,
  B_ID INT(7) NOT NULL,
  TMode VARCHAR(10) NOT NULL,
  FOREIGN KEY (B_ID) REFERENCES Booking(B_ID),
  FOREIGN KEY (C_ID) REFERENCES Client(C_ID)
);

DESC Transaction;