# Employee, HR, Admin Portal

### Steps to run the app

- run the spring boot application
- access the h2 inmemory database console - ```http://localhost:8080/h2-ui/login.do``` and click on connect button.
- run below commands to insert the basic roles:

```agsl
INSERT INTO roles(name) VALUES('ROLE_ADMIN');
INSERT INTO roles(name) VALUES('ROLE_HR');
INSERT INTO roles(name) VALUES('ROLE_EMPLOYEE');

-- Pre-inset one admin user, username: admin, password: admin123 (minimum password length is 6 char)

-- Admin role
insert into users (id,  password, username) values (101, '$2a$10$LB0IPgoAClVzx/0obUfYJecFSgYqqO23nCUvu.N89qaOt8qnHJLWi', 'admin');
insert into user_roles (user_id, role_id) values(101, 1);

-- HR role
insert into users (id, password, username) values (102, '$2a$10$LB0IPgoAClVzx/0obUfYJecFSgYqqO23nCUvu.N89qaOt8qnHJLWi', 'hr');
insert into user_roles (user_id, role_id) values(102, 2);

-- Emp1 role
insert into users (id, password, username) values (103, '$2a$10$LB0IPgoAClVzx/0obUfYJecFSgYqqO23nCUvu.N89qaOt8qnHJLWi', 'emp1');
insert into user_roles (user_id, role_id) values(103, 3);
-- Emp2 role
insert into users (id, password, username) values (104, '$2a$10$LB0IPgoAClVzx/0obUfYJecFSgYqqO23nCUvu.N89qaOt8qnHJLWi', 'emp2');
insert into user_roles (user_id, role_id) values(104, 3);
-- Emp3 role
insert into users (id, password, username) values (105, '$2a$10$LB0IPgoAClVzx/0obUfYJecFSgYqqO23nCUvu.N89qaOt8qnHJLWi', 'emp3');
insert into user_roles (user_id, role_id) values(105, 3);
```
<img width="939" alt="image" src="https://user-images.githubusercontent.com/116070875/208569518-0b4dce95-cf0b-451e-b4e7-e2b85422249b.png">

- open the portal - ```http://localhost:8080/myapp``` which redirects to login page

Admin pages will be accessed by only admin, Employee pages will be accessed only by employee. accounts will be pre-inserted in database. Once logged into the portal we must logout to see the login page. without logout employees will be landed on home pages(emp page) of respective user roles(hr, employee or admin)
