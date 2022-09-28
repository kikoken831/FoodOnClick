DROP TABLE IF EXISTS users;

DROP TABLE IF EXISTS user_role;

DROP TABLE IF EXISTS inventory;

DROP TABLE IF EXISTS restaurant;

DROP TABLE IF EXISTS restaurant_category;

DROP TABLE IF EXISTS menu;

DROP TABLE IF EXISTS category;

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
    ('test1', 'test1', 'Shawn', 'test1@gmail.com', 1),
    (
        'test2',
        'test2',
        'Raynald',
        'test2@gmail.com',
        2
    ),
    (
        'test3',
        'test3',
        'Md Abrar',
        'test3@gmail.com',
        3
    ),
    (
        'test4',
        'test4',
        'Kendrick',
        'test4@gmail.com',
        4
    ),
    (
        'test5',
        'test5',
        'Wei Yang',
        'test5@gmail.com',
        4
    ),
    (
        'test6',
        'test6',
        'Sionggo Japit',
        'test6@gmail.com',
        4
    );

CREATE TABLE IF NOT EXISTS restaurant_category (
    id SERIAL PRIMARY KEY,
    category_name VARCHAR(30) NOT NULL,
    status BOOLEAN NOT NULL
);

INSERT INTO
    restaurant_category(category_name, status)
VALUES
    ('Western', TRUE),
    ('Chinese', TRUE),
    ('Japanese', TRUE);

CREATE TABLE IF NOT EXISTS restaurant (
    id SERIAL PRIMARY KEY,
    restaurant_name VARCHAR(30) NOT NULL,
    managed_by INT NOT NULL,
    restaurant_category_id INT,
    file_path VARCHAR(30) NOT NULL,
    address VARCHAR(30) NOT NULL,
    img_url VARCHAR(30) NOT NULL,
    status boolean,
    FOREIGN KEY(restaurant_category_id) REFERENCES restaurant_category(id),
    FOREIGN KEY(role_id) REFERENCES user_role(id)
);

INSERT INTO
    restaurant(
        restaurant_name,
        restaurant_category_id,
        managed_by,
        file_path,
        address,
        img_url,
        status
    )
VALUES
    (
        'C''est Bon',
        1,
        4,
        'placeholder',
        'Singapore',
        'placeholder',
        TRUE
    ),
    (
        'Shili Diner',
        2,
        4,
        'placeholder',
        'Singapore',
        'placeholder',
        TRUE
    ),
    (
        'Hitoyoshi',
        3,
        4,
        'placeholder',
        'Singapore',
        'placeholder',
        TRUE
    );

CREATE TABLE IF NOT EXISTS inventory (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    unit VARCHAR(30) NOT NULL,
    qty numeric
);

INSERT INTO
    inventory(name, unit, qty)
VALUES
    ('Eggs', 'Pcs', '150'),
    ('Chicken', 'KG', '50'),
    ('Oil', 'L', '45.5'),
    ('Potatoes', 'KG', '250'),
    ('Tomatoes', 'KG', '85'),
    ('Mushrooms', 'Boxes', '20'),
    ('Olive Oil', 'ML', '220'),
    ('Truffle', 'G', '42');

CREATE TABLE IF NOT EXISTS category (
    category_id SERIAL PRIMARY KEY,
    name varchar(50) NOT NULL,
    visible numeric NOT NULL
);

INSERT INTO
    category (name, visible)
VALUES
    ('Main', 1),
    ('Sides', 1),
    ('Drinks', 1);

CREATE TABLE IF NOT EXISTS menu (
    item_id SERIAL PRIMARY KEY,
    name varchar(50) NOT NULL,
    category_id integer NOT NULL,
    price numeric NOT NULL,
    img_url varchar(100) NOT NULL,
    visible numeric NOT NULL,
    FOREIGN KEY(category_id) REFERENCES category(category_id)
);

INSERT INTO
    menu (name, category_id, price, img_url, visible)
VALUES
    (
        'Burger',
        1,
        12,
        'https://img.icons8.com/office/344/kawaii-french-fries.png',
        1
    ),
    (
        'Chicken Chop',
        1,
        11.5,
        'https://img.icons8.com/office/344/kawaii-french-fries.png',
        1
    ),
    (
        'Fish and Chips',
        1,
        14,
        'https://img.icons8.com/office/344/kawaii-french-fries.png',
        1
    ),
    (
        'Linguine',
        1,
        11.5,
        'https://img.icons8.com/office/344/kawaii-french-fries.png',
        1
    ),
    (
        'Pork Chop',
        1,
        12.5,
        'https://img.icons8.com/office/344/kawaii-french-fries.png',
        1
    ),
    (
        'Pizza',
        1,
        22,
        'https://img.icons8.com/office/344/kawaii-french-fries.png',
        1
    ),
    (
        'Cheese Fries',
        2,
        6,
        'https://img.icons8.com/office/344/kawaii-french-fries.png',
        1
    ),
    (
        'Salad',
        2,
        6,
        'https://img.icons8.com/office/344/kawaii-french-fries.png',
        1
    ),
    (
        'Fries',
        2,
        4,
        'https://img.icons8.com/office/344/kawaii-french-fries.png',
        1
    ),
    (
        'Wings',
        2,
        9,
        'https://img.icons8.com/office/344/kawaii-french-fries.png',
        1
    ),
    (
        'Iced Tea',
        3,
        1.5,
        'https://img.icons8.com/office/344/kawaii-french-fries.png',
        1
    ),
    (
        'Iced Coffee',
        3,
        2.5,
        'https://img.icons8.com/office/344/kawaii-french-fries.png',
        1
    ),
    (
        'Matcha Latte',
        3,
        3.5,
        'https://img.icons8.com/office/344/kawaii-french-fries.png',
        1
    ),
    (
        'Juice',
        3,
        2,
        'https://img.icons8.com/office/344/kawaii-french-fries.png',
        1
    ),
    (
        'Spaghetti',
        1,
        10,
        'https://img.icons8.com/office/344/kawaii-french-fries.png',
        1
    );