set sqlprompt"_USER>"
set line 500
set pagesize 500

select name, dname
from student s, department d
WHERE  s.deptno1 = d.deptno
and s.deptno1
=(select deptno1
from student
where name = 'Anthony Hopkins');

select name, hiredate,dname
from professor p, department d
where p.deptno = d.deptno
and hiredate > (select hiredate
from professor
where name = 'Meg Ryan');

select name,weight
from student
where weight>(select avg(weight)
from student
where deptno1 = '201');

select name,position,TO_CHAR(pay,'$999,999,999')
from emp2
where pay > (select pay from emp2
where position='Section head');

select name,grade,weight
from student
where weight <all(select weight
from student
where grade = '2');

select name,position,pay
from emp2
where (position,pay) in (select position,max(pay)
from emp2
group by position)
order by pay;
