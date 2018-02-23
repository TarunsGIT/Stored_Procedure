/*
SQLyog Ultimate v9.02 
MySQL - 5.0.24-community-nt : Database - employee_dept
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`employee_dept` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `employee_dept`;

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `Department_ID` int(11) NOT NULL,
  `Department_Name` varchar(15) default NULL,
  PRIMARY KEY  (`Department_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `department` */

insert  into `department`(`Department_ID`,`Department_Name`) values (1,'HR'),(2,'IT'),(3,'Finance'),(4,'Networking'),(5,'CCD'),(6,'Back Office');

/*Table structure for table `department_backup` */

DROP TABLE IF EXISTS `department_backup`;

CREATE TABLE `department_backup` (
  `Department_ID` int(11) NOT NULL,
  `Department_Name` varchar(15) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `department_backup` */

insert  into `department_backup`(`Department_ID`,`Department_Name`) values (1,'HR'),(2,'Finance'),(3,'IT'),(4,'Networking'),(5,'CCD');

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `Employee_ID` int(11) NOT NULL,
  `Employee_FIRST_NAME` varchar(20) default NULL,
  `Employee_LAST_NAME` varchar(20) default NULL,
  `Employee_ADDRESS` varchar(50) default NULL,
  `Employee_SALARY` int(11) default NULL,
  `Dep_ID` int(11) default NULL,
  PRIMARY KEY  (`Employee_ID`),
  KEY `fk_employee_IDX` (`Dep_ID`),
  CONSTRAINT `fk_employee_IDX` FOREIGN KEY (`Dep_ID`) REFERENCES `department` (`Department_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employee` */

insert  into `employee`(`Employee_ID`,`Employee_FIRST_NAME`,`Employee_LAST_NAME`,`Employee_ADDRESS`,`Employee_SALARY`,`Dep_ID`) values (522601,'PRAVIN','RAO','DOWNTOWN BANGLORE',250000,1),(522602,'RAJIV','BANSAL','HYDERABAD SEZ',20000,2),(522603,'RAVI','VENKATESH','CHENNAI STP',150000,3),(522604,'DAVID','KENNEDY','ATLANTA SEZ',350000,4),(522605,'SHRIKANT','MOORTHY','BANGLORE HEADQUATERS',50000,5),(522606,'SANJAY','PUROHIT','INDORE SEZ',55000,1),(522607,'ROHIT','JADHAV','BANGLORE HEADQUATERS',200000,2),(522608,'KIRS','RAO','MYSORE GEC',100000,2),(522609,'AJIT','KULKARNI','MYSORE DC',25000,3),(522610,'MOHIT','JADHAV','MANGLORE DC',70000,4),(522611,'TARUN','JADHAV','MANGLORE DC',75000,NULL);

/*Table structure for table `employee_backup` */

DROP TABLE IF EXISTS `employee_backup`;

CREATE TABLE `employee_backup` (
  `Employee_ID` int(11) NOT NULL,
  `Employee_FIRST_NAME` varchar(20) default NULL,
  `Employee_LAST_NAME` varchar(20) default NULL,
  `Employee_ADDRESS` varchar(50) default NULL,
  `Dep_ID` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employee_backup` */

insert  into `employee_backup`(`Employee_ID`,`Employee_FIRST_NAME`,`Employee_LAST_NAME`,`Employee_ADDRESS`,`Dep_ID`) values (522601,'PRAVIN','RAO','DOWNTOWN BANGLORE',1),(522602,'RAJIV','BANSAL','HYDERABAD SEZ',2),(522603,'RAVI','VENKATESH','CHENNAI STP',3),(522604,'DAVID','KENNEDY','ATLANTA SEZ',4),(522605,'SHRIKANT','MOORTHY','BANGLORE HEADQUATERS',5),(522606,'SANJAY','PUROHIT','INDORE SEZ',1),(522607,'ROHIT','JADHAV','BANGLORE HEADQUATERS',2),(522608,'KIRS','RAO','MYSORE GEC',2),(522609,'AJIT','KULKARNI','MYSORE DC',3),(522610,'MOHIT','JADHAV','MANGLORE DC',4),(522611,'TARUN','JADHAV','MANGLORE DC',NULL);

/* Procedure structure for procedure `get_employee` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_employee` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_employee`(IN Dep_IDs INT)
begin
select Employee_ID,Employee_FIRST_NAME,Employee_LAST_NAME,Employee_SALARY,Employee_ADDRESS
From employee where Dep_ID=Dep_IDs;
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_no_department_employee` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_no_department_employee` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_no_department_employee`()
BEGIN
SELECT Employee_ID,Employee_FIRST_NAME,Employee_LAST_NAME,Employee_SALARY,Employee_ADDRESS FROM employee 
WHERE 
Dep_ID IS NULL; 
END */$$
DELIMITER ;

/*Table structure for table `collective_view` */

DROP TABLE IF EXISTS `collective_view`;

/*!50001 DROP VIEW IF EXISTS `collective_view` */;
/*!50001 DROP TABLE IF EXISTS `collective_view` */;

/*!50001 CREATE TABLE  `collective_view`(
 `Employee_ID` int(11) ,
 `Employee_FIRST_NAME` varchar(20) ,
 `Employee_LAST_NAME` varchar(20) ,
 `Employee_ADDRESS` varchar(50) ,
 `Employee_SALARY` int(11) ,
 `Dep_ID` int(11) ,
 `Department_ID` int(11) ,
 `Department_Name` varchar(15) 
)*/;

/*Table structure for table `higest_salary` */

DROP TABLE IF EXISTS `higest_salary`;

/*!50001 DROP VIEW IF EXISTS `higest_salary` */;
/*!50001 DROP TABLE IF EXISTS `higest_salary` */;

/*!50001 CREATE TABLE  `higest_salary`(
 `Employee_ID` int(11) ,
 `Employee_FIRST_NAME` varchar(20) ,
 `Employee_LAST_NAME` varchar(20) ,
 `Employee_ADDRESS` varchar(50) ,
 `Employee_SALARY` int(11) ,
 `Dep_ID` int(11) 
)*/;

/*View structure for view collective_view */

/*!50001 DROP TABLE IF EXISTS `collective_view` */;
/*!50001 DROP VIEW IF EXISTS `collective_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `collective_view` AS select `e`.`Employee_ID` AS `Employee_ID`,`e`.`Employee_FIRST_NAME` AS `Employee_FIRST_NAME`,`e`.`Employee_LAST_NAME` AS `Employee_LAST_NAME`,`e`.`Employee_ADDRESS` AS `Employee_ADDRESS`,`e`.`Employee_SALARY` AS `Employee_SALARY`,`e`.`Dep_ID` AS `Dep_ID`,`d`.`Department_ID` AS `Department_ID`,`d`.`Department_Name` AS `Department_Name` from (`employee` `e` join `department` `d` on((`e`.`Dep_ID` = `d`.`Department_ID`))) */;

/*View structure for view higest_salary */

/*!50001 DROP TABLE IF EXISTS `higest_salary` */;
/*!50001 DROP VIEW IF EXISTS `higest_salary` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `higest_salary` AS select `employee`.`Employee_ID` AS `Employee_ID`,`employee`.`Employee_FIRST_NAME` AS `Employee_FIRST_NAME`,`employee`.`Employee_LAST_NAME` AS `Employee_LAST_NAME`,`employee`.`Employee_ADDRESS` AS `Employee_ADDRESS`,`employee`.`Employee_SALARY` AS `Employee_SALARY`,`employee`.`Dep_ID` AS `Dep_ID` from `employee` order by `employee`.`Employee_SALARY` desc */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
