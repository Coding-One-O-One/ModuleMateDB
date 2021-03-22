/*********************************************************
Divan van Zyl for Coding101
2021
Server version: Microsoft SQL Azure (RTM) - 12.0.2000.8   Feb 20 2021 17:51:58
**********************************************************/

-----------
-- Views --
-----------

begin tran
go

create view [VW_StudentModules]
as
select 
	s.fullName as Student,
	m.fullName as Module
from Student s
inner join StudentModule sm
on s.studentID = sm.studentID
inner join Module m
on m.moduleID = sm.moduleID

go

commit tran