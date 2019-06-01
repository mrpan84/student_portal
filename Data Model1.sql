DROP DATABASE IF EXISTS `dyuni_portal`;
CREATE DATABASE `dyuni_portal`;
USE `dyuni_portal`;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `admin`;
DROP TABLE IF EXISTS `roles`;
DROP TABLE IF EXISTS `user_role`;
DROP TABLE IF EXISTS `student`;
DROP TABLE IF EXISTS `employee`;
DROP TABLE IF EXISTS `admin`;
DROP TABLE IF EXISTS `faculty`;
DROP TABLE IF EXISTS `program`;
DROP TABLE IF EXISTS `course`;
DROP TABLE IF EXISTS `cRequisites`;
DROP TABLE IF EXISTS `cLearningOutcomes`;
DROP TABLE IF EXISTS `cContent`;
DROP TABLE IF EXISTS `cContentSub1`;
DROP TABLE IF EXISTS `cContentSub2`;
DROP TABLE IF EXISTS `cMoAssessment`;
DROP TABLE IF EXISTS `MoAssessment`;
DROP TABLE IF EXISTS `TnLApproaches`;
DROP TABLE IF EXISTS `cTnLApproaches`;
DROP TABLE IF EXISTS `materials`;
DROP TABLE IF EXISTS `cReferences`;
DROP TABLE IF EXISTS `prog_course`;
DROP TABLE IF EXISTS `academician`;
DROP TABLE IF EXISTS `qualification`;
DROP TABLE IF EXISTS `publication`;
DROP TABLE IF EXISTS `pubAuthor`;
DROP TABLE IF EXISTS `research`;
DROP TABLE IF EXISTS `researcher`;
DROP TABLE IF EXISTS `assessment`;
DROP TABLE IF EXISTS `studProg`;
DROP TABLE IF EXISTS `continuous`;
DROP TABLE IF EXISTS `finalExam`;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `user` (
    `uid` INTEGER(12) NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(15),
    `fname` VARCHAR(35) NOT NULL,
    `sname` VARCHAR(35) NOT NULL,
    `middle` VARCHAR(35) NOT NULL,
    `email` VARCHAR(65) NOT NULL,
    `password` VARCHAR(65) NOT NULL,
    `phone` VARCHAR(20),
    `logs` INTEGER(20) NOT NULL,
    `attempts` INTEGER(1) NOT NULL,
    `logtime` TIMESTAMP NOT NULL,
    `joined` DATETIME NOT NULL,
    `lastAttempt` DATETIME NOT NULL,
    PRIMARY KEY (`uid`),
    UNIQUE (`email`)
);

CREATE TABLE `admin` (
    `uid` INTEGER(12) NOT NULL,
    `added` DATETIME NOT NULL,
    PRIMARY KEY (`uid`)
);

CREATE TABLE `roles` (
    `rid` INTEGER(3) NOT NULL AUTO_INCREMENT,
    `role` VARCHAR(65) NOT NULL,
    `description` TEXT NOT NULL,
    PRIMARY KEY (`rid`),
    UNIQUE (`role`)
);

CREATE TABLE `user_role` (
    `uid` INTEGER(12) NOT NULL,
    `rid` INTEGER(3) NOT NULL,
    `granted` DATETIME NOT NULL,
    `priv_read` BOOLEAN NOT NULL,
    `priv_write` BOOLEAN NOT NULL,
    PRIMARY KEY (`uid`, `rid`)
);

CREATE TABLE `student` (
    `uid` INTEGER(12) NOT NULL,
    `sex` VARCHAR(6) NOT NULL,
    `dob` DATETIME NOT NULL,
    `status` VARCHAR(20) NOT NULL,
    `guardian_name` VARCHAR(65),
    `gPhone` VARCHAR(20),
    `gEmail` VARCHAR(45),
    `created` DATETIME NOT NULL,
    PRIMARY KEY (`uid`)
);

CREATE TABLE `employee` (
    `uid` INTEGER(12) NOT NULL,
    `empId` VARCHAR(25) NOT NULL,
    `employed` DATETIME NOT NULL,
    `salary` DECIMAL(10,2),
    `jobTitle` VARCHAR(45) NOT NULL,
    `empType` VARCHAR(30) NOT NULL,
    PRIMARY KEY (`empId`)
);

CREATE TABLE `faculty` (
    `faculty` VARCHAR(65) NOT NULL,
    `since` DATETIME NOT NULL,
    `hod` VARCHAR(25) NOT NULL,
    PRIMARY KEY (`faculty`),
    UNIQUE (`hod`)
);

CREATE TABLE `program` (
    `faculty` VARCHAR(65) NOT NULL,
    `progName` VARCHAR(255) NOT NULL,
    `level` INTEGER(1),
    `introduced` DATETIME,
    `language` VARCHAR(65) NOT NULL,
    PRIMARY KEY (`progName`)
);

CREATE TABLE `course` (
    `cFaculty` VARCHAR(65) NOT NULL,
    `cCode` VARCHAR(25) NOT NULL,
    `cTitle` VARCHAR(65) NOT NULL,
    `cLevel` VARCHAR(10) NOT NULL,
    `cCredits` INTEGER(1) NOT NULL,
    `cSemester` VARCHAR(10) NOT NULL,
    `cLectureHrs` INTEGER(3) NOT NULL,
    `cRevisedIn` INTEGER(2) NOT NULL,
    `cApproved` DATETIME NOT NULL,
    `cAim` TEXT,
    `cDescriptor` TEXT,
    PRIMARY KEY (`cCode`)
);

CREATE TABLE `cRequisites` (
    `cCode` VARCHAR(25) NOT NULL,
    `requisite` VARCHAR(25) NOT NULL,
    `relevance` VARCHAR(13) NOT NULL,
    PRIMARY KEY (`cCode`, `requisite`)
);

CREATE TABLE `cLearningOutcomes` (
    `ocid` INTEGER(6) NOT NULL AUTO_INCREMENT,
    `cCode` VARCHAR(25) NOT NULL,
    `outcome` TEXT NOT NULL,
    PRIMARY KEY (`ocid`)
);

CREATE TABLE `cContent` (
    `cid` INTEGER(10) NOT NULL AUTO_INCREMENT,
    `cCode` VARCHAR(25) NOT NULL,
    `content` TEXT NOT NULL,
    PRIMARY KEY (`cid`)
);

CREATE TABLE `cContentSub1` (
    `cid` INTEGER(6) NOT NULL,
    `cSub1Id` INTEGER(7) NOT NULL AUTO_INCREMENT,
    `sub1` TEXT NOT NULL,
    PRIMARY KEY (`cSub1Id`)
);

CREATE TABLE `cContentSub2` (
    `cSub1Id` INTEGER(7) NOT NULL,
    `cSub2Id` INTEGER(8) NOT NULL AUTO_INCREMENT,
    `sub2` TEXT NOT NULL,
    PRIMARY KEY (`cSub2Id`)
);

CREATE TABLE `cMoAssessment` (
    `cCode` VARCHAR(25) NOT NULL,
    `methodId` INTEGER(2) NOT NULL,
    `contribution` INTEGER(3) NOT NULL,
    PRIMARY KEY (`cCode`, `methodId`)
);

CREATE TABLE `MoAssessment` (
    `methodId` INTEGER(2) NOT NULL AUTO_INCREMENT,
    `method` VARCHAR(65) NOT NULL,
    `description` TEXT,
    PRIMARY KEY (`methodId`)
);

CREATE TABLE `TnLApproaches` (
    `aId` INTEGER(2) NOT NULL AUTO_INCREMENT,
    `approach` VARCHAR(30) NOT NULL,
    `description` TEXT NOT NULL,
    PRIMARY KEY (`aId`)
);

CREATE TABLE `cTnLApproaches` (
    `cCode` VARCHAR(25) NOT NULL,
    `aId` INTEGER(2) NOT NULL,
    PRIMARY KEY (`cCode`, `aId`)
);

CREATE TABLE `materials` (
    `mid` INTEGER(15) NOT NULL AUTO_INCREMENT,
    `mTitle` VARCHAR(65) NOT NULL,
    `mCategory` VARCHAR(30) NOT NULL,
    `author` VARCHAR(65) NOT NULL,
    `year` DATE,
    `added` DATETIME NOT NULL,
    `uploader` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`mid`)
);

CREATE TABLE `cReferences` (
    `cCode` VARCHAR(25) NOT NULL,
    `mid` INTEGER(15) NOT NULL,
    `selected` DATETIME NOT NULL,
    PRIMARY KEY (`cCode`, `mid`)
);

CREATE TABLE `prog_course` (
    `progName` VARCHAR(225) NOT NULL,
    `cCode` VARCHAR(25) NOT NULL,
    `year` INTEGER(1) NOT NULL,
    `semester` INTEGER(2) NOT NULL,
    `coordinator` VARCHAR(25) NOT NULL,
    `progCourseId` INTEGER(10) NOT NULL,
    PRIMARY KEY (`progName`, `cCode`),
    UNIQUE (`progCourseId`)
);

CREATE TABLE `academician` (
    `empId` VARCHAR(25) NOT NULL,
    `joined` DATETIME NOT NULL,
    `faculty` VARCHAR(65) NOT NULL,
    PRIMARY KEY (`empId`)
);

CREATE TABLE `qualification` (
    `qid` INTEGER(10) NOT NULL AUTO_INCREMENT,
    `empId` VARCHAR(25) NOT NULL,
    `qualification` VARCHAR(255) NOT NULL,
    `awarded_by` VARCHAR(255) NOT NULL,
    `year` DATE NOT NULL,
    `grade` VARCHAR(255) NOT NULL,
    `suffix` VARCHAR(10),
    `certificate` BLOB,
    `ext` VARCHAR(25) NOT NULL,
    PRIMARY KEY (`qid`)
);

CREATE TABLE `publication` (
    `pubId` INTEGER(12) NOT NULL primary key AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `released` DATE NOT NULL,
    `publisher` VARCHAR(255) NOT NULL
);

CREATE TABLE `pubAuthor` (
    `pubId` INTEGER(12) NOT NULL,
    `author` VARCHAR(25) NOT NULL,
    PRIMARY KEY (`pubId`, `author`)
);

CREATE TABLE `research` (
    `resId` INTEGER(12) NOT NULL AUTO_INCREMENT,
    `topic` VARCHAR(255) NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `description` TEXT,
    PRIMARY KEY (`resId`)
);

CREATE TABLE `researcher` (
    `resId` INTEGER(12) NOT NULL,
    `researcher` VARCHAR(25) NOT NULL,
    `role` TEXT,
    PRIMARY KEY (`resId`, `researcher`)
);

CREATE TABLE `assessment` (
    `regNo` VARCHAR(25) NOT NULL,
    `progCourseId` INTEGER(10) NOT NULL,
    `assessmentId` INTEGER(15) NOT NULL AUTO_INCREMENT,
    `attempt` INTEGER(2) NOT NULL,
    `acYear` VARCHAR(11) NOT NULL,
    `semester` INTEGER(1) NOT NULL,
    `decision` VARCHAR(35),
    PRIMARY KEY (`regNo`, `progCourseId`, `attempt`),
    UNIQUE (`assessmentId`)
);

CREATE TABLE `studProg` (
    `uid` INTEGER(12) NOT NULL,
    `reg_no` VARCHAR(25),
    `admission` DATETIME,
    `password` VARCHAR(30),
    `progName` VARCHAR(225) NOT NULL,
    PRIMARY KEY (`uid`, `progName`),
    UNIQUE (`reg_no`)
);

CREATE TABLE `continuous` (
    `contNo` INTEGER(17) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`assessmentId` INTEGER(15) NOT NULL,
    `method` VARCHAR(65) NOT NULL,
    `contributes` DECIMAL(3,2) NOT NULL,
    `submitted` DATETIME NOT NULL,
    `duedate` DATETIME NOT NULL,
    `marks` INTEGER(3) NOT NULL,
    `scored` DECIMAL(5,2) NOT NULL,
    `observation` TEXT NOT NULL,
    `marked_by` VARCHAR(65) NOT NULL
);

CREATE TABLE `finalExam` (
    `examNo` INTEGER(17) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`assessmentId` INTEGER(15) NOT NULL,
    `type` VARCHAR(16) NOT NULL,
    `sat` DATETIME NOT NULL,
    `attended` BOOLEAN NOT NULL,
    `marks` INTEGER(3) NOT NULL,
    `scored` DECIMAL(5,2) NOT NULL,
    `observation` TEXT NOT NULL,
    `marked_by` VARCHAR(65) NOT NULL
);

ALTER TABLE `admin` ADD FOREIGN KEY (`uid`) REFERENCES `user`(`uid`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `user_role` ADD FOREIGN KEY (`uid`) REFERENCES `user`(`uid`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `user_role` ADD FOREIGN KEY (`rid`) REFERENCES `roles`(`rid`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `student` ADD FOREIGN KEY (`uid`) REFERENCES `user`(`uid`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `admin` ADD FOREIGN KEY (`uid`) REFERENCES `user`(`uid`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `faculty` ADD FOREIGN KEY (`hod`) REFERENCES `employee`(`empId`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `program` ADD FOREIGN KEY (`faculty`) REFERENCES `faculty`(`faculty`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `course` ADD FOREIGN KEY (`cFaculty`) REFERENCES `faculty`(`faculty`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `cRequisites` ADD FOREIGN KEY (`cCode`) REFERENCES `course`(`cCode`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `cRequisites` ADD FOREIGN KEY (`requisite`) REFERENCES `course`(`cCode`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `cLearningOutcomes` ADD FOREIGN KEY (`cCode`) REFERENCES `course`(`cCode`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `cContent` ADD FOREIGN KEY (`cCode`) REFERENCES `course`(`cCode`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `cContentSub1` ADD FOREIGN KEY (`cid`) REFERENCES `cContent`(`cid`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `cContentSub2` ADD FOREIGN KEY (`cSub1Id`) REFERENCES `cContentSub1`(`cSub1Id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `cMoAssessment` ADD FOREIGN KEY (`cCode`) REFERENCES `course`(`cCode`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `cMoAssessment` ADD FOREIGN KEY (`methodId`) REFERENCES `MoAssessment`(`methodId`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `cTnLApproaches` ADD FOREIGN KEY (`cCode`) REFERENCES `course`(`cCode`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `cTnLApproaches` ADD FOREIGN KEY (`aId`) REFERENCES `TnLApproaches`(`aId`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `cReferences` ADD FOREIGN KEY (`cCode`) REFERENCES `course`(`cCode`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `cReferences` ADD FOREIGN KEY (`mid`) REFERENCES `materials`(`mid`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `prog_course` ADD FOREIGN KEY (`progName`) REFERENCES `program`(`progName`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `prog_course` ADD FOREIGN KEY (`cCode`) REFERENCES `course`(`cCode`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `prog_course` ADD FOREIGN KEY (`coordinator`) REFERENCES `academician`(`empId`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `academician` ADD FOREIGN KEY (`faculty`) REFERENCES `faculty`(`faculty`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `academician` ADD FOREIGN KEY (`empId`) REFERENCES `employee`(`empId`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `qualification` ADD FOREIGN KEY (`empId`) REFERENCES `employee`(`empId`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `pubAuthor` ADD FOREIGN KEY (`author`) REFERENCES `academician`(`empId`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `pubAuthor` ADD FOREIGN KEY (`pubId`) REFERENCES `publication`(`pubId`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `researcher` ADD FOREIGN KEY (`resId`) REFERENCES `research`(`resId`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `researcher` ADD FOREIGN KEY (`researcher`) REFERENCES `academician`(`empId`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `assessment` ADD FOREIGN KEY (`regNo`) REFERENCES `studProg`(`reg_no`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `assessment` ADD FOREIGN KEY (`progCourseId`) REFERENCES `prog_course`(`progCourseId`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `studProg` ADD FOREIGN KEY (`uid`) REFERENCES `student`(`uid`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `studProg` ADD FOREIGN KEY (`progName`) REFERENCES `program`(`progName`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `continuous` ADD FOREIGN KEY (`assessmentId`) REFERENCES `assessment`(`assessmentId`) ON DELETE CASCADE ON UPDATE CASCADE;