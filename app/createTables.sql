DROP TABLE IF EXISTS users;

DROP TABLE IF EXISTS user_role;

CREATE TABLE IF NOT EXISTS user_role (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(30)
);

INSERT INTO
    user_role(role_name)
VALUES
    ('Customer'),
    ('Rider'),
    ('Admin'),
    ('Restaurant Admin');

CREATE TABLE IF NOT EXISTS users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(30) UNIQUE NOT NULL,
    password VARCHAR(30) NOT NULL,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    role_id INT,
    FOREIGN KEY(role_id) REFERENCES user_role(role_id)
);

INSERT INTO
    users(username, password, name, email, role_id)
VALUES
    ('test1', 'test1','test1','test1@gmail.com', 1),
    ('test2', 'test2','test2','test2@gmail.com', 2),
    ('test3', 'test3','test3','test3@gmail.com', 3),
    ('test4', 'test4','test4','test4@gmail.com', 4);