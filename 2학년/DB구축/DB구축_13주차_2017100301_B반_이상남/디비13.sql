set sqlprompt"_USER>"
set line 200;
set pagesize 500;

GRANT CREATE VIEW To scott;

CREATE VIEW v_prof_dept2
AS
SELECT p.profno, p.name, d.dname
FROM professor p , department d
WHERE p.deptno = d.deptno;

select * from v_prof_dept2;
DROP VIEW v_prof_dept2

select dname,MAX(height) "MAX_HEIGHT",MAX(weight) "MAX_WEIGHT"
FROM (SELECT d.dname,s.height,s.weight
      FROM student s, department d
      WHERE s.deptno1 = d.deptno)
GROUP BY dname;


select d.dname,v.max_height,s.name,s.height
FROM (SELECT deptno1,MAX(height) "MAX_HEIGHT"
      FROM student
      GROUP BY deptno1) v, department d, student s
WHERE s.deptno1 = v.deptno1
AND  s.height = v.max_height
AND  s.deptno1 = d.deptno ;

SELECT v.grade, s.name, s.height,v.avg_height
FROM (SELECT grade, AVG(height) avg_height
     FROM student
     GROUP BY grade ) v, student s
WHERE     v.grade = s.grade
AND   s.height > v.avg_height
ORDER BY 1;


SELECT    s.grade "학년",s.name "이름",s.height "키",a.avg_height "평균키"
FROM ( SELECT grade , AVG(height) avg_height FROM student GROUP BY grade ) a, student s
WHERE     a.grade = s.grade
AND         s.height > a.avg_height
ORDER BY 1 ;



select * from
(select rank() over(order by pay desc) Ranking, name, pay
from professor)
where Ranking <=5;


select num, profno, name, pay, sum(pay), round(avg(pay),1)
from(select rownum num,profno,name,pay from professor)
group by CEIL(num/3), rollup((profno,name,pay,num)); )
//CEIL 근접한 정수의 값찾아주기 (팀나누기할때 자주사용)
