 --Pregunta 1
 SELECT E.first_name, E.last_name, E.hire_date, E.salary, D.department_name, J.job_title
 FROM employees E, departments D, jobs J, job_history H  
 WHERE E.salary >=4500 AND E.salary < 15000 AND E.department_id= D.department_id AND 
 E.job_id=J.job_id AND J.job_id =H.job_id AND E.job_id=H.job_id AND D.department_id=H.department_id;


 --Pregunta 2
 SELECT E.employee_id, E.first_name, E.last_name, J.job_title, C.country_name
 FROM employees E, jobs J, countries C, locations L, departments D
 WHERE J.job_title='Accountant' AND E.job_id=J.job_id AND E.department_id= D.department_id AND 
 D.location_id=L.location_id AND L.country_id=C.country_id;
 
 --Pregunta 3
 SELECT *
 FROM employees E, countries C, locations L, departments D
 WHERE (C.country_name='United States of America' OR L.city='Mexico City') AND
 E.department_id= D.department_id AND D.location_id=L.location_id AND L.country_id=C.country_id;
 
 --Pregunta 4
 SELECT *
 FROM employees E, departments D, jobs J, job_history H, countries C, locations L
 WHERE C.country_name='United Kingdom' AND (J.job_title='Sales Manager' OR  
 J.job_title='Sales Representative') AND E.department_id= D.department_id AND
 D.location_id=L.location_id AND L.country_id=C.country_id AND 
 E.job_id=J.job_id AND J.job_id =H.job_id AND E.job_id=H.job_id AND D.department_id=H.department_id;

 --Pregunta 5
SELECT E.employee_id, E.first_name, E.last_name
 FROM employees E, departments D, jobs J, job_history H, countries C, locations L, regions R
 WHERE E.department_id= D.department_id AND
 D.location_id=L.location_id AND L.country_id=C.country_id AND R.region_name='Americas' AND
 E.job_id=J.job_id AND J.job_id =H.job_id AND E.job_id=H.job_id AND D.department_id=H.department_id
 AND C.region_id=R.region_id AND E.salary < (SELECT AVG(salary) FROM employees WHERE 
E.department_id= D.department_id AND
 D.location_id=L.location_id AND L.country_id=C.country_id AND 
 E.job_id=J.job_id AND J.job_id =H.job_id AND E.job_id=H.job_id AND D.department_id=H.department_id);
 
 --Pregunta 6
 SELECT R.region_name, C.country_name, COUNT(*)
 FROM employees E, departments D, jobs J, job_history H, countries C, locations L, regions R
 WHERE E.department_id= D.department_id AND
 D.location_id=L.location_id AND L.country_id=C.country_id AND 
 E.job_id=J.job_id AND J.job_id =H.job_id AND E.job_id=H.job_id AND D.department_id=H.department_id
 AND C.region_id=R.region_id GROUP BY R.region_name, C.country_name HAVING COUNT(*)>3;
 
 

