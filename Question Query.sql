/**GMU CS 504 007 Spring 2019 Blood Donation System Database Project**/

--Q1 Find the name of donors whose medical report is ¡°Qualified¡±
SELECT dname FROM Donor WHERE dreport='Qualified';

--Q2 Find the name of donors whose blood donated to UP Health System.
SELECT dname FROM donor ,BloodBank WHERE donor.did=BloodBank.did AND BloodBank.bname='UP Health System'

--Q3 Find the id of patient who use blood from both Foundation Hospital and General Hospital.
SELECT p.pid FROM Patient p,BloodBank b WHERE 
p.pid=b.pid AND b.bname='Foundation Hospital' AND b.bname='General Hospital'

--Q4 Find the blood group of patients who use blood from Tina Mccormick and the blood is from UP Health System. 
SELECT DISTINCT pgroup FROM Patient p,BloodBank b,donor d 
WHERE b.bname='UP Health System' AND d.dname='Tina Mccormick' ;

--Q5 Find the pid and name of patient whose blood group is ¡®AB¡¯ or ¡®O¡¯, and print patient name in alphabetical order 
SELECT pid,pname FROM Patient WHERE  
pgroup='AB' OR pgroup ='O' ORDER by pname ASC

--Q6 Find the did of donors whose blood group is same with patient whose name called ¡°Gary Kier¡±
SELECT did FROM Donor WHERE dgroup IN( 
SELECT pgroup FROM Patient WHERE pname='Gary Kier')

--Q7. Find the bname who provides blood most.
SELECT DISTINCT bname FROM BloodBank 
WHERE bnumber =(SELECT MAX(bnumber) FROM BloodBank);

--Q8 Find the pid and name of patients whose disease is ¡°Cerebral hemorrhage¡± and whose blood is provided by UP Health System.
SELECT DISTINCT p.pid, p.pname FROM PATIENT p, BLOODBANK b 
WHERE p.pdisease='Cerebral hemorrhage' AND b.bname='UP Health System'

--Q9 Find the name of donors who have been tested more than average test times.
SELECT d.dname FROM DONOR d WHERE d.tid in
(SELECT t.tid FROM TESTCENTER t
WHERE t.ttimes > (select avg(t1.ttimes) FROM TESTCENTER t1 ) )

--Q10 Find the id of patient who blood provided by ¡®UP Health System¡¯.
SELECT p.pid FROM PATIENT p WHERE p.pid IN (SELECT p.pid 
FROM BLOODBANK b, PATIENT p WHERE b.bname='UP Health System'AND p.pid=b.pid)

--Q11 Find the did of donors donated blood to Foundation Hospital or General Hospital.
SELECT did FROM Donor WHERE did IN (
    SELECT did FROM BloodBank WHERE bname='Foundation Hospital'
    OR bname='Foundation Hospital')

--Q12 Find tid which test has been done between 2018-04-01 and 2018-05-25, print both tid and test date.
SELECT tid,tday FROM TESTCENTER
WHERE tday BETWEEN '2018-04-01' AND '2018-05-25'
	
--Q13 Find pid of patient whose blood group isn't ¡°A¡± and "B", and blood provided by General Hospital.
SELECT pid FROM patient WHERE pgroup !='B' AND pgroup !='A' AND pid IN (
  SELECT pid FROM BloodBank WHERE bname='General Hospital' )
  
--Q14 For each test center, print the name of test center and the total number of donors tested.
SELECT tname,COUNT(DISTINCT tid) as Numberofdonors
FROM TESTCENTER   GROUP BY tname

--Q15 Find tid, report result and test times of donors order by test times in descending order. 
SELECT d.tid, d.dreport, t.ttimes
FROM TESTCENTER t, DONOR d
WHERE t.tid=d.tid 
ORDER by t.ttimes DESC

--Q16 Find the name of the donor who has been tested 4 times and whose blood is donated to Victoria Davis.
SELECT d.dname FROM DONOR d WHERE d.tid IN 
    (SELECT t.tid FROM TESTCENTER t, DONOR d WHERE t.ttimes=4 AND t.tid=d.tid AND d.did IN 
	      (SELECT b.did FROM BLOODBANK b WHERE b.pid=
		          (SELECT p.pid FROM PATIENT p WHERE p.pname='Victoria Davis')))
 
 --Q17 select the disease of patient whose name begins at ¡°A¡± and who is provided blood by Foundation Hospital .
SELECT p.pdisease FROM PATIENT p WHERE p.pname LIKE 'A%' AND p.pid IN 
    (SELECT b.pid  FROM BLOODBANK b   WHERE b.bname='Foundation hospital')
  
--Q18 Find the name of patient who have Kidney disease and donated by Stephanie Copeland.
SELECT  pid FROM patient, donor  WHERE pdisease='Kidney disease' AND dname= 'Stephanie Copeland'
  
 --Q19 Find how many tests each testcenter have done during the year of 2018 in ascending Order.
SELECT tname,SUM(ttimes) AS Total_number_of_tests
FROM testcenter
WHERE tday BETWEEN '2018-01-01' AND '2018-12-31'
GROUP BY tname
ORDER BY Total_number_of_tests ASC

--Q20 Find pid of patient whose blood group is ¡°B¡± and provided blood by General Hospital.
SELECT pid FROM patient WHERE pgroup ='B' AND pid IN (
SELECT pid FROM BloodBank WHERE bname='General Hospital' )

--Q21 Find the name of donor whose blood has been tested and qualified during Jan 2018 and March 2018.
SELECT d.dname FROM DONOR d WHERE d.dreport='Qualified' AND d.tid IN
(SELECT tid
FROM TESTCENTER 
WHERE tday BETWEEN '2018-01-01' and '2018-03-31')

--Q22 Find the name of testcenter which have done test during April 2018.
SELECT DISTINCT tname FROM testcenter WHERE tid in (
SELECT tid FROM testcenter WHERE tday BETWEEN '2018-04-01' and '2018-04-30')