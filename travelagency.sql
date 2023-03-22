SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `travelagency` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `travelagency`;

DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `Answer_Date` date NOT NULL,
  `Emp_ID` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `answer` (`Answer_Date`, `Emp_ID`) VALUES
('2021-12-13', 1000005),
('2021-12-23', 1000002),
('2022-01-03', 1000001),
('2022-01-13', 1000003),
('2022-02-23', 1000004);

DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking` (
  `C_ID` int(7) NOT NULL,
  `B_ID` int(7) NOT NULL,
  `Pack_ID` int(7) NOT NULL,
  `cost` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `booking` (`C_ID`, `B_ID`, `Pack_ID`, `cost`) VALUES
(1100002, 801, 3, 16600),
(1100003, 802, 4, 30000),
(1100005, 803, 1, 37500),
(1100004, 804, 5, 118000),
(1100001, 805, 2, 86500);

DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `C_ID` int(7) NOT NULL,
  `FNAME` varchar(20) NOT NULL,
  `LNAME` varchar(20) NOT NULL,
  `Mobile` varchar(12) DEFAULT NULL,
  `E_mail` varchar(32) DEFAULT NULL,
  `Vaccination` tinyint(1) NOT NULL,
  `Vac_Certificate` varchar(20) NOT NULL,
  `COVID_19_Report` varchar(20) NOT NULL,
  `Budget` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `client` (`C_ID`, `FNAME`, `LNAME`, `Mobile`, `E_mail`, `Vaccination`, `Vac_Certificate`, `COVID_19_Report`, `Budget`) VALUES
(1100001, 'Rahul', 'Shrivatsav', '8763330254', 'rahuls@gmail.com', 1, 'Available', '-', 25000),
(1100002, 'Mahendra', 'jadeja', '7859642138', 'mahij@yahoo.com', 0, 'Unavailable', 'Negative', 10000),
(1100003, 'Charlie', 'Shinghania', '9988775642', 'charlie@gmail.com', 1, 'Available', '-', 30000),
(1100004, 'Esha', 'Gupta', '8759463217', 'eshagupta@gmail.com', 1, 'Available', '-', 15000),
(1100005, 'Jahnavi', 'shetty', '6985472132', 'jshetty@rediff.com', 1, 'Available', '-', 18000);

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `Emp_ID` int(7) NOT NULL,
  `FNAMAE` varchar(20) NOT NULL,
  `LNAME` varchar(20) NOT NULL,
  `Salary` int(6) NOT NULL,
  `Mobile` varchar(12) DEFAULT NULL,
  `E_Mail` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `employee` (`Emp_ID`, `FNAMAE`, `LNAME`, `Salary`, `Mobile`, `E_Mail`) VALUES
(1000001, 'Ahaan', 'Shetty', 50000, '8795462130', 'ashetty@gmail.com'),
(1000002, 'Balki', 'Kumar', 40000, '9768542130', 'balkik@rediff.com'),
(1000003, 'Chirag', 'Patil', 40000, '8769548213', 'chiragpatil@gmail.com'),
(1000004, 'Dhruv', 'Navani', 45000, '9768548212', 'dna@yahoo.com'),
(1000005, 'Eshwar', 'Chetti', 42000, '8695472130', 'eswarc@gmail.com');

DROP TABLE IF EXISTS `enquiry`;
CREATE TABLE `enquiry` (
  `Emp_ID` int(7) NOT NULL,
  `C_ID` int(7) NOT NULL,
  `Subject` varchar(30) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Remark` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `enquiry` (`Emp_ID`, `C_ID`, `Subject`, `Description`, `Remark`) VALUES
(1000005, 1100002, 'Reg. Vehicle', 'Is the vehicle fuel price included in the package?', 'Yes, the package is inclusive of all the things, including the fuel cost'),
(1000002, 1100005, 'Reg. Hotel', 'Which room is allotted to us in the Hotel?', 'You can choose any room of your choice from the list of rooms reserved for our agency'),
(1000003, 1100004, 'Reg. Refund', 'If i choose to cancel the booking, will i receive my moneyback?', 'Yes, there is 80% refund policy on cancellations'),
(1000001, 1100003, 'Reg. Roads', 'Is it safe to travel by highways(many of them are having pot holes and prone to accidents)', 'Yes, We will travel in highwayroads,we promise customers will not have any complaints'),
(1000004, 1100001, 'Reg. Food ', 'Is the cost of Food included in package?,what about snacks?', 'Yes, You get morning breakfast,Afternoon lunch and evening snacks and dinner is also included');

DROP TABLE IF EXISTS `package`;
CREATE TABLE `package` (
  `Package_Name` varchar(50) DEFAULT NULL,
  `Package_Type` varchar(15) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Destination` varchar(20) NOT NULL,
  `Price` int(6) NOT NULL,
  `P_ID` int(7) NOT NULL,
  `Transport_Mode` varchar(15) NOT NULL,
  `Seats` int(3) NOT NULL,
  `Vehicle_Type` varchar(20) NOT NULL,
  `Positivity_Rate` int(2) NOT NULL,
  `Reservation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `package` (`Package_Name`, `Package_Type`, `Description`, `Destination`, `Price`, `P_ID`, `Transport_Mode`, `Seats`, `Vehicle_Type`, `Positivity_Rate`, `Reservation_date`) VALUES
('Dandeli Diary', 'AdventurePack', '4 days and 3 nights in the midst of the jungle, stay at Jungle Nest Homestay apartment', 'Dandeli', 12500, 1, 'Jeep', 7, 'SUV', 10, '2022-01-23'),
('Malpe Memories', 'BeachPack', '5 days and 4 nights at the beautiful beachy Paradise Isle Beach Resort', 'Malpe', 17300, 2, 'Traveller', 10, 'MiniBus', 11, '2022-02-10'),
('Murudeshwar Mahayaatra', 'HolyBeachPack', '3 days and 3 nights in the amidst of the holy town, stay at the comfortable Royal Oak', 'Murudeshwar', 8300, 3, 'Car', 8, 'MUV', 9, '2022-02-09'),
('Go Gokarna', 'HolyBeachPack', '4 days and 3 nights in the beautiful holy city, stay at Trippr Gokarna', 'Gokarna', 10000, 4, 'Car', 5, 'Sedan', 9, '2022-03-09'),
('Monumental Hampi', 'HeritagePack', '3 days and 3 nights at the monumental town, stay at Heritage Resort', 'Hampi', 23600, 5, 'Traveller', 10, 'MiniBus', 10, '2022-05-05');

DROP TABLE IF EXISTS `register`;
CREATE TABLE `register` (
  `Reg_date` date NOT NULL,
  `C_ID` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `register` (`Reg_date`, `C_ID`) VALUES
('2021-12-12', 1100005),
('2022-01-12', 1100003),
('2022-01-02', 1100001),
('2022-02-22', 1100004),
('2021-12-22', 1100002);

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction` (
  `C_ID` int(7) NOT NULL,
  `B_ID` int(7) NOT NULL,
  `TMode` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `transaction` (`C_ID`, `B_ID`, `TMode`) VALUES
(1100003, 802, 'Debit Card'),
(1100004, 804, 'Credit Card'),
(1100005, 801, 'UPI'),
(1100002, 805, 'Net Banking'),
(1100001, 803, 'Debit Card');


ALTER TABLE `answer`
  ADD KEY `Emp_ID` (`Emp_ID`);

ALTER TABLE `booking`
  ADD PRIMARY KEY (`B_ID`),
  ADD KEY `Pack_ID` (`Pack_ID`),
  ADD KEY `C_ID` (`C_ID`);

ALTER TABLE `client`
  ADD PRIMARY KEY (`C_ID`),
  ADD UNIQUE KEY `Mobile` (`Mobile`),
  ADD UNIQUE KEY `E_mail` (`E_mail`);

ALTER TABLE `employee`
  ADD PRIMARY KEY (`Emp_ID`),
  ADD UNIQUE KEY `Mobile` (`Mobile`),
  ADD UNIQUE KEY `E_Mail` (`E_Mail`);

ALTER TABLE `enquiry`
  ADD KEY `C_ID` (`C_ID`),
  ADD KEY `Emp_ID` (`Emp_ID`);

ALTER TABLE `package`
  ADD PRIMARY KEY (`P_ID`),
  ADD UNIQUE KEY `Package_Name` (`Package_Name`);

ALTER TABLE `register`
  ADD KEY `C_ID` (`C_ID`);

ALTER TABLE `transaction`
  ADD KEY `B_ID` (`B_ID`),
  ADD KEY `C_ID` (`C_ID`);


ALTER TABLE `client`
  MODIFY `C_ID` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1100006;

ALTER TABLE `employee`
  MODIFY `Emp_ID` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000006;

ALTER TABLE `package`
  MODIFY `P_ID` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE `answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`);

ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`Pack_ID`) REFERENCES `package` (`P_ID`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`C_ID`) REFERENCES `client` (`C_ID`);

ALTER TABLE `enquiry`
  ADD CONSTRAINT `enquiry_ibfk_1` FOREIGN KEY (`C_ID`) REFERENCES `client` (`C_ID`),
  ADD CONSTRAINT `enquiry_ibfk_2` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`);

ALTER TABLE `register`
  ADD CONSTRAINT `register_ibfk_1` FOREIGN KEY (`C_ID`) REFERENCES `client` (`C_ID`);

ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`B_ID`) REFERENCES `booking` (`B_ID`),
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`C_ID`) REFERENCES `client` (`C_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
