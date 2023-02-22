USE company;

SELECT 
	D.Dname AS Departamento,
    COUNT(E.Dno) AS "Quantidade de Empregados"
FROM
	employee E
INNER JOIN
	departament D ON E.Dno = D.Dnumber
GROUP BY 
	D.Dname
ORDER BY 
	2 DESC
LIMIT 1

CREATE INDEX idx_employee ON employee(Dno);
    

SELECT
	DL.Dlocation AS Cidade,
    D.Dname AS Departamento
FROM
	departament D
LEFT JOIN
	dept_locations DL ON D.Dnumber = DL.Dnumber
ORDER BY
	DL.Dlocation;

CREATE INDEX idx_departament ON departament(Dnumber);
    

SELECT 
	CONCAT(E.Fname, " ", COALESCE(E.Minit, ""), " ", E.Lname) AS Empregado,
    D.Dname AS Departamento
FROM
	employee E
LEFT JOIN
	departament D ON D.Dnumber = E.Dno
ORDER BY 
	D.Dname, E.Fname, E.Fname , E.Lname ;
    
CREATE INDEX idx_employee_FullName ON employee((concat(Fname, " ", Minit, " ", Lname)));
CREATE INDEX idx_employee_Fname ON employee(Fname);
CREATE INDEX idx_employee_Minit ON employee(Minit);
CREATE INDEX idx_employee_Lname ON employee(Lname);