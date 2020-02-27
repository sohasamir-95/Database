--sp for insert statment
CREATE PROC INSERT_Dept
@dept_id int,
@dept_name varchar(255)
as 
begin 
INSERT INTO Department (Dept_Id,Dept_Name) VALUES(@dept_id,@dept_name);
END
INSERT_Dept  5,'Digital Marketing'
-----------------------------------------------------------------------------
--sp for delete statment
CREATE PROC DELETE_Dept
@dept_id int,
@dept_name varchar(255)
as 
begin 
DELETE FROM Department
where 
@dept_id=Dept_Id
and  
@dept_name=Dept_Name
END
DELETE_Dept 5,'Digital Marketing'
--------------------------------------------------------------------------------
--sp for Select statment
CREATE PROC SELECT_Dept
@dept_id int 
as 
select d.Dept_Name,s.Std_Name 
from Department  as d
inner join Student as s
on d.Dept_Id=s.Dept_Id
where d.Dept_Id=@dept_id
SELECT_Dept 1
------------------------------------------------------------------------------------
--sp for Update statment
CREATE PROC UPDATE_Dept
@dept_name varchar(255),
@old_dept_name varchar(255)
as
UPDATE Department
SET Dept_Name = @dept_name
WHERE Dept_Name=@old_dept_name;
UPDATE_Dept 'PD','Mobile'
----------------------------------------------------------------------------------------
--sp fpr insert examQues
alter proc INSERT_EQ
@exam_id int ,@qus_id int 
as 
begin 
INSERT INTO Exam_Question(Exam_Id,Qus_Id) VALUES(@exam_id,@qus_id);
END
--alter proc INSERT_EQ  @exam_id int ,@qus_id int
--as 
--declare @eid int = (select Exam_Id from Exam_Question where Exam_Id=@exam_id )
--declare @qid int = (select Qus_Id from Exam_Question where Qus_Id=@qus_id )
--if (@eid is not null and @qid is not null )
--INSERT INTO Exam_Question(Exam_Id,Qus_Id) VALUES(@exam_id,@qus_id);
--else
-- PRINT 'Please insert ExamID and QuestID';
  INSERT_EQ 1,3
--------------------------------------------------------------------------------------------
--sp for select examQues
create proc  SELECT_EQ
@exam_id int
as 
select Q.Question,EQ.Qus_Id
from Question as Q
inner join 
Exam_Question as EQ
on Q.Qus_Id=EQ.Qus_Id
inner join 
Exam as e
on e.Exam_Id=EQ.Exam_Id

where e.Exam_Id=@exam_id

SELECT_EQ 3

-----------------------------------------------------------------
---sp num3 report
create proc GetCoursesName
@insid int
as 
select c.Crs_Name ,count(s.Std_Id) as numofstudents
from  Course as c
join Std_Crs as sc
on c.Crs_Id=sc.Crs_Id
join Student as s
on s.Std_Id=sc.Std_Id
join Ins_Crs as ic
on ic.Crs_Id=c.Crs_Id
join Instructor as i
on i.Ins_Id=ic.Ins_Id
where i.Ins_Id=@insid
group by (Crs_Name)
GetCoursesName 1
-----------------------------------------------------------------------------------------------
insert into Instructor(Ins_Id,Ins_Name)Values(1,'mahmoud')
insert into Instructor(Ins_Id,Ins_Name)Values(2,'rami')
insert into Instructor(Ins_Id,Ins_Name)Values(3,'eman')
insert into Instructor(Ins_Id,Ins_Name)Values(4,'somia')
insert into Topic(Topic_Id,Topic_Name) values(1,'prgramming')
insert into Topic(Topic_Id,Topic_Name) values(2,'DB')
insert into Topic(Topic_Id,Topic_Name) values(3,'meanstack')
insert into Course(Crs_Id,Crs_Name,Topic_Id)values(1,'C#',1)
insert into Course(Crs_Id,Crs_Name,Topic_Id)values(2,'C++',1)
insert into Course(Crs_Id,Crs_Name,Topic_Id)values(3,'sqlserver',2)
insert into Course(Crs_Id,Crs_Name,Topic_Id)values(4,'mysql',2)
insert into Course(Crs_Id,Crs_Name,Topic_Id)values(5,'js',3)
insert into Course(Crs_Id,Crs_Name,Topic_Id)values(6,'reactjs',3)
insert into Std_Crs(Std_Id,Crs_Id)values(1,1)
insert into Std_Crs(Std_Id,Crs_Id)values(1,2)
insert into Std_Crs(Std_Id,Crs_Id)values(1,5)
insert into Std_Crs(Std_Id,Crs_Id)values(2,1)
insert into Std_Crs(Std_Id,Crs_Id)values(2,2)
insert into Std_Crs(Std_Id,Crs_Id)values(2,5)
insert into Std_Crs(Std_Id,Crs_Id)values(3,3)
insert into Std_Crs(Std_Id,Crs_Id)values(3,6)
insert into Std_Crs(Std_Id,Crs_Id)values(3,5)
insert Ins_Crs (Ins_Id,Crs_Id)values(1,1)
insert Ins_Crs (Ins_Id,Crs_Id)values(1,2)
insert Ins_Crs (Ins_Id,Crs_Id)values(2,3)
insert Ins_Crs (Ins_Id,Crs_Id)values(2,4)
insert Ins_Crs (Ins_Id,Crs_Id)values(3,5)
insert Ins_Crs (Ins_Id,Crs_Id)values(3,6)