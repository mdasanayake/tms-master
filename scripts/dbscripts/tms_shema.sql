DROP SCHEMA IF EXISTS tms_shema;
CREATE SCHEMA tms_shema;
USE tms_shema;

CREATE TABLE user (
  userid INT UNSIGNED NOT NULL AUTO_INCREMENT,
  username VARCHAR(45) NOT NULL,
  password VARCHAR(45) NOT NULL,
  PRIMARY KEY  (userid),
  KEY idx_user_username (username)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE role (
  roleid SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  rolename VARCHAR(20) NOT NULL,
  PRIMARY KEY  (roleid),
  KEY idx_role_rolename (rolename)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE userpermission (
  permissionid SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  userid INT UNSIGNED NOT NULL,
  roleid SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY  (permissionid),
  FOREIGN KEY (userid) REFERENCES user(userid) ON DELETE CASCADE,
  FOREIGN KEY (roleid) REFERENCES role(roleid) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tms_shema`.`lecturer` (
  `Lecturer_ID` VARCHAR(20) NOT NULL COMMENT '',
  `Lecturer_Name` VARCHAR(100) NOT NULL COMMENT '',
  `Contact_No` VARCHAR(15) NOT NULL COMMENT '',
  `Address` VARCHAR(150) NULL COMMENT '',
  PRIMARY KEY (`Lecturer_ID`)  COMMENT '');


CREATE TABLE `tms_shema`.`cause` (
  `Cause_ID` VARCHAR(10) NOT NULL COMMENT '',
  `Cause_Name` VARCHAR(50) NOT NULL COMMENT '',
  `Lecturer_ID` VARCHAR(20) NOT NULL COMMENT '',
  `Cause_fee` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Cause_ID`)  COMMENT '',
  INDEX `Lecturer_ID_idx` (`Lecturer_ID` ASC)  COMMENT '',
  CONSTRAINT `Lecturer_ID`
    FOREIGN KEY (`Lecturer_ID`)
    REFERENCES `tms_shema`.`lecturer` (`Lecturer_ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);

CREATE TABLE `tms_shema`.`student` (
  `student_id` INT NOT NULL COMMENT '',
  `student_name` VARCHAR(100) NOT NULL COMMENT '',
  `Address` VARCHAR(150) NULL COMMENT '',
  `contact_no` VARCHAR(15) NULL COMMENT '',
  `parent_contact_no` VARCHAR(15) NULL COMMENT '',
  PRIMARY KEY (`student_id`)  COMMENT '');
  
  CREATE TABLE `tms_shema`.`student_cause_reg` (
  `Cause_ID` VARCHAR(10) NOT NULL COMMENT '',
  `student_id` INT NOT NULL COMMENT '',
  `discount` INT NULL COMMENT '',
  INDEX `Cause_ID_idx` (`Cause_ID` ASC)  COMMENT '',
  INDEX `student_id_idx` (`student_id` ASC)  COMMENT '',
  CONSTRAINT `Cause_ID`
    FOREIGN KEY (`Cause_ID`)
    REFERENCES `tms_shema`.`cause` (`Cause_ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `student_id`
    FOREIGN KEY (`student_id`)
    REFERENCES `tms_shema`.`student` (`student_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);

CREATE TABLE `tms_shema`.`tutorial` (
  `tutorial_id` VARCHAR(50) NOT NULL COMMENT '',
  `Cause_ID` VARCHAR(10) NOT NULL COMMENT '',
  `tutorial_name` VARCHAR(100) NOT NULL COMMENT '',
  `printed_amount` INT NULL COMMENT '',
  PRIMARY KEY (`tutorial_id`)  COMMENT '',
  INDEX `Cause_ID_idx` (`Cause_ID` ASC)  COMMENT '',
  CONSTRAINT `Cause_ID_Tutorial`
    FOREIGN KEY (`Cause_ID`)
    REFERENCES `tms_shema`.`cause` (`Cause_ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);
    
    CREATE TABLE `tms_shema`.`lecture_hall` (
  `lecture_hall_id` VARCHAR(10) NOT NULL COMMENT '',
  `lecture_hall_name` VARCHAR(50) NOT NULL COMMENT '',
  `capacity` INT NOT NULL COMMENT '',
  PRIMARY KEY (`lecture_hall_id`)  COMMENT '');
  
  CREATE TABLE `tms_shema`.`class_asistant` (
  `class_asistant_id` VARCHAR(20) NOT NULL COMMENT '',
  `class_asistant_name` VARCHAR(100) NOT NULL COMMENT '',
  `contact_no` VARCHAR(15) NOT NULL COMMENT '',
  PRIMARY KEY (`class_asistant_id`)  COMMENT '');

CREATE TABLE `tms_shema`.`class_schedule` (
  `class_schedule_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `lecture_hall_id` VARCHAR(10) NOT NULL COMMENT '',
  `class_asistant_id` VARCHAR(20) NULL COMMENT '',
  PRIMARY KEY (`class_schedule_id`)  COMMENT '',
  INDEX `lecture_hall_id_idx` (`lecture_hall_id` ASC)  COMMENT '',
  INDEX `class_asistant_id_idx` (`class_asistant_id` ASC)  COMMENT '',
  CONSTRAINT `lecture_hall_id`
    FOREIGN KEY (`lecture_hall_id`)
    REFERENCES `tms_shema`.`lecture_hall` (`lecture_hall_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `class_asistant_id`
    FOREIGN KEY (`class_asistant_id`)
    REFERENCES `tms_shema`.`class_asistant` (`class_asistant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `tms_shema`.`class_fee` (
  `class_fee_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Cause_ID` VARCHAR(10) NOT NULL COMMENT '',
  `student_id` INT NOT NULL COMMENT '',
  `paid_month` VARCHAR(45) NOT NULL COMMENT '',
  `amount` INT NOT NULL COMMENT '',
  PRIMARY KEY (`class_fee_id`)  COMMENT '',
  INDEX `Cause_ID_idx` (`Cause_ID` ASC)  COMMENT '',
  INDEX `student_id_idx` (`student_id` ASC)  COMMENT '',
  CONSTRAINT `Cause_ID_fee`
    FOREIGN KEY (`Cause_ID`)
    REFERENCES `tms_shema`.`cause` (`Cause_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `student_id_fee`
    FOREIGN KEY (`student_id`)
    REFERENCES `tms_shema`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    CREATE TABLE `tms_shema`.`attendance` (
  `Cause_ID` VARCHAR(10) NOT NULL COMMENT '',
  `student_id` INT NOT NULL COMMENT '',
  `date` DATETIME NOT NULL COMMENT '',
  INDEX `Cause_ID_idx` (`Cause_ID` ASC)  COMMENT '',
  INDEX `student_id_idx` (`student_id` ASC)  COMMENT '',
  CONSTRAINT `Cause_ID_att`
    FOREIGN KEY (`Cause_ID`)
    REFERENCES `tms_shema`.`cause` (`Cause_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `student_id_att`
    FOREIGN KEY (`student_id`)
    REFERENCES `tms_shema`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



