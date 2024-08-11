create database olympic;
create table projects
(
    id           serial8 primary key,
    project_name varchar(144) not null,
    status       varchar(144) not null,
    description  varchar(255),
    start_date   date,
    end_date     date

);

create table teams
(
    team_id        serial8 primary key,
    name           varchar(144) not null,
    team_structure varchar(255),
    project_id     int8 references projects (id)

);

create table users
(
    user_id   serial8 primary key,
    login     varchar(144) unique not null,
    password  varchar(144) unique not null,
    team_role varchar(144),
    team_id   int8 references teams (team_id)
);


create table tasks
(
    task_id        serial8 primary key,
    parent_task_id int8 references tasks (task_id),
    task_status    varchar(144),
    priority       varchar(144),
    description    varchar(144),
    deadline       date,
    project_id     int8 references projects (id),
    user_id        int8 references users (user_id)

);

insert into projects(project_name, status, description, start_date, end_date)
values ('Олимпиада 2024 - Разработка сайта Олимпиады Paris', 'IN_PROGRESS', 'Разработка  сайта Олимпиады в Париже',
        '2023-10-26', '2024-07-26'),
       ('Олимпиада 2026 - Разработка сайта Олимпиады Milano', 'IN_PROGRESS',
        'Разработка сайта Олимпиады в Милане  ', '2023-11-01', '2026-02-01');

insert into teams (name, project_id)
values ('Backend разработка', 1),
       ('Frontend-разработка', 1),
       ('Backend разработка', 2),
       ('Frontend-разработка', 2);

insert into users(login, password, team_role, team_id)
values ('web_dev1', 'password1', 'Frontend-разработчик', 1),
       ('back_dev2', 'password2', 'Backend-разработчик', 2),
       ('web_dev3', 'password3', 'Frontend-разработчик', 3),
       ('back_dev4', 'password4', 'Backend-разработчик', 4);

insert into tasks(parent_task_id, task_status, priority, description, deadline, project_id, user_id)
values (1, 'IN_PROGRESS', 'HIGH', 'Разработка сайта с расписанием', '2024-07-26', 1, 1),
       (1, 'DONE', 'HIGH', 'Разработка главной страницы сайта со счетчиком времени', '2024-07-26', 1, 2),
       (2, 'NEW', 'HIGH', 'Разработка главной страницы сайта Milano', '2024-12-08', 2, 4);

