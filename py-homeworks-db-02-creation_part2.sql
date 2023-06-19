CREATE TABLE employee (
	id serial PRIMARY KEY,
	hid integer REFERENCES employee(id),
	name varchar(60) NOT NULL,
	department integer NOT NULL
);

COMMENT ON COLUMN employee.hid IS 'Руководитель';
COMMENT ON COLUMN employee.name IS 'Имя сотрудника';
COMMENT ON COLUMN employee.department IS 'Отдел сотрудника';