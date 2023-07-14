-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar
create table student(student_id serial, 
					 first_name varchar(30), 
					 last_name varchar(30), 
					 birthday date,
					 phone varchar(20));

-- 2. Добавить в таблицу student колонку middle_name varchar
alter table student add column middle_name varchar(30);

-- 3. Удалить колонку middle_name
alter table student drop column middle_name;


-- 4. Переименовать колонку birthday в birth_date
alter table student rename birthday to birth_date;


-- 5. Изменить тип данных колонки phone на varchar(32)
alter table student alter column phone set data type varchar(32);

-- 6. Вставить три любых записи с автогенерацией идентификатора
insert into student (first_name, last_name, birth_date, phone)
values('Vlad', 'Linuxsov', '1999-11-23', '8(911)999-888-77'),
('Kristina','Ivanova','1994-11-04','8(911)666-555-44'),
('Nikolay','Indigo','1996-09-12','8(911)333-222-11');

-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
truncate student restart identity
