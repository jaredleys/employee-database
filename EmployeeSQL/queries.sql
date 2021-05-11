SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salary AS s
ON e.emp_no = s.emp_no;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM employees AS e
INNER JOIN dept_manager AS m
ON e.emp_no = m.emp_no
INNER JOIN departments AS d
ON m.dept_no = d.dept_no;

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_employees AS x
ON e.emp_no = x.emp_no
INNER JOIN departments AS d
ON x.dept_no = d.dept_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- Doesn't quite work, needs revision
SELECT e.emp_no, e.last_name, e.first_name
FROM employees AS e
WHERE e.emp_no IN (
	SELECT emp_no
	FROM dept_employees
	WHERE dept_no IN (
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
	)
);

--Another query goes here before next

SELECT last_name, COUNT(last_name) AS last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;