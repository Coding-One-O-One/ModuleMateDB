/*********************************************************
Divan van Zyl for Coding101
2021
Server version: Microsoft SQL Azure (RTM) - 12.0.2000.8   Feb 20 2021 17:51:58
**********************************************************/

------------
-- Data --
------------
begin tran

insert into Module (code, fullname)
values 
('MAT1503','Linear Algebra 1'),
('COS1501','Theoretical Computer Science 1'),
('COS1521','Computer Systems Fundamental Concepts')

insert into Student (fullname)
values 
('Divan van Zyl')

insert into CourseTypeLookup (fullName)
values
('bachelor''s degree'),
('Diploma'),
('Higher Certificate')

insert into Course (code,nfqLevel,fullName,internationallyRecognised,typeID)
values
('98906 - COM','7','Bachelor of Science in Computing',1,1)

insert into University (fullName)
values
('University of South Africa')

insert into ProgressTypeLookup (fullName)
values
('Not registered'),
('Registered'),
('Done')

insert into StudentModule
values
(1,1),
(1,2),
(1,3)

insert into CourseUniversity
values
(1,1)

insert into CourseModule (courseID,moduleID)
values
(1,1),
(1,2),
(1,3)

insert into StudentModuleHistory(studentID,moduleID,progressID,mark)
values
(1,1,2,NULL),
(1,2,2,NULL),
(1,3,2,NULL)

insert into StudentCourseHistory (studentID,courseID,progressID,averageMark)
values
(1,1,2,NULL)

insert into Module (code, fullname)
values
('COS2601','Theoretical Computer Science 2')

insert into ModuleDependancies (moduleID,dependancyModuleID)
values
(4,2)

commit tran