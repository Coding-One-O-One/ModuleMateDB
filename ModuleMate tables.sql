/*********************************************************
Divan van Zyl for Coding101
2021
Server version: Microsoft SQL Azure (RTM) - 12.0.2000.8   Feb 20 2021 17:51:58
**********************************************************/

------------
-- Tables --
------------

--Note: Naming convention for foreign keys is "FK_[table name]_[column name]"

begin tran

--Base tables
create table Module
(
	moduleID int identity(1,1) primary key not null,
	code nvarchar(32) not null,
	fullName nvarchar(256) not null
)
go

create table University
(
	universityID int identity(1,1) primary key not null,
	fullName nvarchar(256) not null
)
go

create table Student
(
	studentID int identity(1,1) primary key not null,
	fullName nvarchar(256) not null
)
go

--Lookup tables
create table CourseTypeLookup
(
	courseTypeLookupID int identity(1,1) primary key not null,
	fullName nvarchar(256)
)
go

create table ProgressTypeLookup
(
	progressTypeLookupID smallint identity(1,1) primary key not null,
	fullName nvarchar(256)
)
go

create table Course
(
	courseID int identity(1,1) primary key not null,
	code nvarchar(32) not null,
	nfqLevel int not null,
	fullName nvarchar(256) not null,
	internationallyRecognised bit not null,
	typeID int not null,
	constraint FK_CourseTypeLookup_typeID foreign key (typeID) references CourseTypeLookup(courseTypeLookupID)
)
go

--Link tables
create table StudentModule
(
	studentID int not null,
	moduleID int not null,
	constraint FK_StudentModule_Student foreign key (studentID) references Student(studentID),
	constraint FK_StudentModule_Module foreign key (moduleID) references Module(moduleID),
	primary key (studentID, moduleID)
)
go

create table CourseUniversity
(
	courseID int not null,
	universityID int not null,
	constraint FK_CourseUniversity_Course foreign key (courseID) references Course(courseID),
	constraint FK_CourseUniversity_University foreign key (universityID) references University(universityID),
	primary key (courseID, universityID)
)
go

create table CourseModule
(
	courseID int not null,
	moduleID int not null,
	constraint FK_CourseModule_Course foreign key (courseID) references Course(courseID ),
	constraint FK_CourseModule_Module foreign key (moduleID) references Module(moduleID),
	primary key (courseID, moduleID)
)
go


--History tables
create table StudentModuleHistory
(
	studentID int not null,
	moduleID int not null,
	progressID smallint not null,
	mark tinyint null,
	constraint FK_StudentModuleHistory_Student foreign key (studentID) references Student(studentID),
	constraint FK_StudentModuleHistory_Module foreign key (moduleID) references Module(moduleID),
	constraint FK_StudentModuleHistory_progressID foreign key (progressID) references ProgressTypeLookup(progressTypeLookupID),
	primary key (studentID, moduleID)
)

create table StudentCourseHistory
(
	studentID int not null,
	courseID int not null,
	progressID smallint not null,
	averageMark tinyint null
	constraint FK_StudentCourseHistory_Student foreign key (studentID) references Student(studentID),
	constraint FK_StudentCourseHistory_Course foreign key (courseID) references Course(courseID),
	constraint FK_StudentCourseHistory_progressID foreign key (progressID) references ProgressTypeLookup(progressTypeLookupID),
	primary key (studentID, courseID )
)

--Dependancy table
create table ModuleDependancies
(
	moduleID int not null,
	dependancyModuleID int not null,
	constraint FK_ModuleDependancies_ModuleID foreign key (moduleID) references Module(moduleID),
	constraint FK_ModuleDependancies_DependancyModuleID foreign key (moduleID) references Module(moduleID),
	primary key (moduleID, dependancymoduleID)
)

commit tran