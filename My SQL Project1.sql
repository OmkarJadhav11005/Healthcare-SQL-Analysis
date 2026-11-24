create database healthcare;
use healthcare;

create database if not exists healthcare;
use healthcare;

Create table diagnoses(
diagnosisID int primary key,
diagnosisname varchar(255)
);

Create table Outcomes(
OutcomeID int primary key,
Outcome varchar(255)
);

create table Patients(
PatientID int primary key,
name varchar(255),
Age int,
Gender char(1),
DiagnosisID int,
AdmissionDate Date,
DischargeDate Date,
OutcomeID int,
TreatmentCost decimal(10,2),
foreign key (diagnosisID) references Diagnoses(diagnosisID),
foreign key (outcomeID) references outcomes(outcomeID)
);

create table Labs(
Labs int primary key,
PatientID int,
TestName varchar(255),
result decimal(10,2),
Normalrange varchar(255),
foreign key (PatientID) references Patients(PatientID)
);

select * from patients;
select * from labs;
select * from outcomes;
select * from diagnoses;

-- Retrieve Detailed patients lab history
select p.patientID, p.Name, d.diagnosisname, o.Outcome, l.testname, l.result, l.normalrange
from patients p
join diagnoses d on p.diagnosisID = d.diagnosisID
join outcomes o on p.OutcomeID = o.OutcomeID
join labs l on p.PatientID = l.PatientID
order by p.PatientID, l.testname;

-- Average lab result by diagnosis
select d.diagnosisname, l.testname, avg(l.result) as avgresult
from patients p
join diagnoses d on p.diagnosisID = d.diagnosisID
join labs l on p.PatientID = l.PatientID
group by d.diagnosisname, l.TestName;

-- count of abnormal lab Results
select p.patientID, p.name, count(*) as abnormalcount
from patients p
join labs l on p.PatientID = l.PatientID
where (l.testname = 'Blood Sugar' and l.Result >120) or
(l.testname = 'Cholestrol' and l.Result > 200) or
(l.testname = 'Hemoglobin' and l.Result < 13)
group by p.patientID, p.name
order by abnormalcount desc;

-- diagnoses with Highest treatment Costs
select d.diagnosisname, sum(p.treatmentcost) as Totalcost
from patients p
join diagnoses d on p.diagnosisID = d.diagnosisID
group by d.diagnosisname
order by Totalcost desc;

-- Patient at risk by age and gender
select p.patientID, p.name, p.age, d.diagnosisname, o.outcome
from patients p
join diagnoses d on p.diagnosisID = d.diagnosisID
join outcomes o on p.OutcomeID = o.OutcomeID
where p.age > 65  and o.Outcome != 'Recoverd';

-- lab trend over time for a specific patient
select l.Testname, l.Result, p.admissiondate
from labs l
join patients p on l.PatientID = p.PatientID
where P.patientID in (2,4,6,8,10,12)
order by p.AdmissionDate;

-- distribution of outcomes by diagnosis
select d.diagnosisname, o.outcome, count(*) as outcomecount
from patients p
join diagnoses d on p.diagnosisID = d.diagnosisID
join outcomes o on p.OutcomeID = o.OutcomeID
group by d.diagnosisname, o.Outcome
order by d.diagnosisname, o.Outcome desc;















