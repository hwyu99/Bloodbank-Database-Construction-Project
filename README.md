## Bloodbank-Database-Construction-Project
"This project is to practice the logical database design techniques. In your project report, please include the detailed description of the problem statement, analysis and formulation, ER diagrams, schema, relational algebra, and SQL scripts. Please include the constraints in your diagram and describe them in your description, e.g., key constraint, total participation constraint, and etc."

### Schema & ERD
Patient (pid: integer, pname: string, pgroup:string, disease:string)  
Donor (did: integer, dname: string, dgroup: string, report: string, daddress: string, dnumber: string)  
BloodBank (cid:integer, pid: integer, did: integer, bname: string, baddress: string, bnumber: string)  
Testcenter(tid:integer, tname: string, tnumber: string, ttimes:integer, tday: date)  
<img width="650" height="400" src="https://github.com/hwyu99/Bloodbank-Database-Construction-Project/blob/master/1.png"/>  
 
### Query Questions
--Q1 Find the blood group of patients who use blood from Tina Mccormick and the blood is from UP Health System.  
SELECT DISTINCT pgroup FROM Patient p,BloodBank b,donor d  
WHERE b.bname='UP Health System' AND d.dname='Tina Mccormick' ;  

--Q2 Find the pid and name of patient whose blood group is ‘AB’ or ‘O’, and print patient name in alphabetical order  
SELECT pid,pname FROM Patient WHERE  
pgroup='AB' OR pgroup ='O' ORDER by pname ASC  

--Q3 Find the did of donors whose blood group is same with patient whose name called “Gary Kier”  
SELECT did FROM Donor WHERE dgroup IN(  
SELECT pgroup FROM Patient WHERE pname='Gary Kier')  

--Q4. Find the bname who provides blood most.  
SELECT DISTINCT bname FROM BloodBank  
WHERE bnumber =(SELECT MAX(bnumber) FROM BloodBank);  

--Q5 Find the pid and name of patients whose disease is “Cerebral hemorrhage” and whose blood is provided by UP Health System.  
SELECT DISTINCT p.pid, p.pname FROM PATIENT p, BLOODBANK b  
WHERE p.pdisease='Cerebral hemorrhage' AND b.bname='UP Health System'  

--Q6 Find the name of donors who have been tested more than average test times.  
SELECT d.dname FROM DONOR d WHERE d.tid in  
(SELECT t.tid FROM TESTCENTER t  
WHERE t.ttimes > (select avg(t1.ttimes) FROM TESTCENTER t1 ) )  

--Q7 Find the did of donors donated blood to Foundation Hospital or General Hospital.  
SELECT did FROM Donor WHERE did IN (  
    SELECT did FROM BloodBank WHERE bname='Foundation Hospital'  
    OR bname='Foundation Hospital')  

--Q8 Find tid which test has been done between 2018-04-01 and 2018-05-25, print both tid and test date.  
SELECT tid,tday FROM TESTCENTER  
WHERE tday BETWEEN '2018-04-01' AND '2018-05-25'  
	
--Q9 Find pid of patient whose blood group isn't “A” and "B", and blood provided by General Hospital.  
SELECT pid FROM patient WHERE pgroup !='B' AND pgroup !='A' AND pid IN (  
  SELECT pid FROM BloodBank WHERE bname='General Hospital' )  

--Q10 Find tid, report result and test times of donors order by test times in descending order.  
SELECT d.tid, d.dreport, t.ttimes  
FROM TESTCENTER t, DONOR d  
WHERE t.tid=d.tid  
ORDER by t.ttimes DESC  

--Q11 Find the name of the donor who has been tested 4 times and whose blood is donated to Victoria Davis.  
SELECT d.dname FROM DONOR d WHERE d.tid IN  
    (SELECT t.tid FROM TESTCENTER t, DONOR d WHERE t.ttimes=4 AND t.tid=d.tid AND d.did IN  
	      (SELECT b.did FROM BLOODBANK b WHERE b.pid=  
		          (SELECT p.pid FROM PATIENT p WHERE p.pname='Victoria Davis')))  
 
 --Q12 select the disease of patient whose name begins at “A” and who is provided blood by Foundation Hospital .  
SELECT p.pdisease FROM PATIENT p WHERE p.pname LIKE 'A%' AND p.pid IN  
    (SELECT b.pid  FROM BLOODBANK b   WHERE b.bname='Foundation hospital')  
  
 --Q13 Find how many tests each testcenter have done during the year of 2018 in ascending Order.  
SELECT tname,SUM(ttimes) AS Total_number_of_tests  
FROM testcenter  
WHERE tday BETWEEN '2018-01-01' AND '2018-12-31'  
GROUP BY tname  
ORDER BY Total_number_of_tests ASC  

--Q14 Find the name of donor whose blood has been tested and qualified during Jan 2018 and March 2018.  
SELECT d.dname FROM DONOR d WHERE d.dreport='Qualified' AND d.tid IN  
(SELECT tid  
FROM TESTCENTER  
WHERE tday BETWEEN '2018-01-01' and '2018-03-31')  

--Q15 Find the name of testcenter which have done test during April 2018.  
SELECT DISTINCT tname FROM testcenter WHERE tid in (  
SELECT tid FROM testcenter WHERE tday BETWEEN '2018-04-01' and '2018-04-30')   
