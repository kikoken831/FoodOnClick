DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS restaurant;
DROP TABLE IF EXISTS restaurant_category;
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
                                          FOREIGN KEY(managed_by) REFERENCES users(user_id)
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
        5,
        'placeholder',
        'Singapore',
        'placeholder',
        TRUE
    ),
    (
        'Hitoyoshi',
        3,
        6,
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
                                    name varchar(250) NOT NULL,
                                    restaurant_id integer NOT NULL,
                                    category_id integer NOT NULL,
                                    price money NOT NULL,
                                    img_url varchar(250) NOT NULL,
                                    visible numeric NOT NULL,
                                    FOREIGN KEY(category_id) REFERENCES category(category_id),
                                    FOREIGN KEY (restaurant_id) REFERENCES restaurant(id)
);

INSERT INTO
    menu (restaurant_id,name, category_id, price, img_url, visible)
VALUES
    ('1', 'Cheese Fries', '2', '$6.00', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('1', 'Truffle Fries', '2', '$8.00', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('1', 'Beetroot Salad', '2', '$12.00', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('1', 'Fried Calamari', '2', '$13.00', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('1', 'Plain Fries', '2', '$8.00', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('1', 'Smoked Cheese Burger', '2', '$18.00', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('1', 'Grilled Rib-Eye Steak', '1', '$22.00', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('1', 'Chicken Chop', '1', '$13.00', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('1', 'Pan-seared Salmon', '1', '$18.00', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('1', 'Pork Chop', '1', '$12.00', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('1', 'Charcoal-Grilled Pork Belly', '1', '$15.50', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('1', 'Fish & Chips', '1', '$12.00', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('1', 'Coke ', '3', '$4.50', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('1', 'Sprite', '3', '$4.50', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('1', 'Honey Lemon Iced Tea', '3', '$6.50', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('1', 'Earl Grey', '3', '$8.50', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('1', 'Flat White', '3', '$8.50', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('1', 'Latte', '3', '$8.50', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('1', 'Corona', '3', '$11.00', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('1', 'Mojito', '3', '$18.00', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('2', 'Chinese Puer Tea', '3', '$2.50', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('2', 'Chrysanthemum Tea', '3', '$2.50', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('2', 'Barley Water', '3', '$2.50', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('2', 'Duck Roasted with Angelica Herb', '1', '$22.00', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('2', 'Black Vinegar Pork Trotters', '1', '$13.00', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('2', 'Signature Wheatgrass Tofu with Seafood', '1', '$18.00', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('2', 'Roasted Iberico Char Siew', '1', '$12.00', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('2', 'Sliced Garoupa in Assam Style', '1', '$15.50', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('2', 'Mongolian Pork Ribs', '1', '$12.00', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('2', 'Fish Maw Thick Soup with Seafood', '1', '$4.50', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('2', 'Pan-Fried Cod Fish in Superior Soy Sauce', '1', '$4.50', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('2', 'Prawns & Vermicelli in Creamy Vietnamese Style', '1', '$6.50', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('2', 'Hotplate Fiery Sambal Squid & Prawns with Petai', '1', '$8.50', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('2', 'Lotus Roots, Sweet Pea, Water Chestnut with Macadamia Nuts', '1', '$8.50', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('2', 'Collagen Jelly with Black Sugar', '2', '$8.50', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('2', 'Vegan Chinese-style dumplings', '2', '$11.00', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('2', 'Chinese vegetable spring roll', '2', '$18.00', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('2', 'Prawn Roll', '2', '$3.00', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('2', 'Jellyfish Salad', '2', '$3.00', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('2', 'Asian Chicken Salad With Lemon', '2', '$3.00', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('3', 'Mocha Green Tea', '3', '$2.00', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('3', 'Sake', '3', '$12', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('3', 'Sapporo ', '3', '$9.74', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('3', 'Egg Sushi', '1', '$1.40', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('3', 'Spicy Salmon Inari W/ Sakura Shrimp Ebiko', '1', '$3.30', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('3', 'Inari Sushi', '1', '$1.40', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('3', 'Roasted Scallop', '1', '$3.90', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('3', 'Roasted Eel', '1', '$4.10', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('3', 'Supreme Sea Eel Sushi', '1', '$8.45', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('3', 'Roasted Duck Breast Sushi', '1', '$2.90', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('3', 'Salmon & Salmon Roe Roll', '1', '$8.05', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('3', 'Tuna Salad Warship', '1', '$11.55', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('3', 'Pork Chop Udon', '1', '$14.70', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('3', 'Assorted Sashimi Set', '1', '$20.95', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('3', 'Miso Soup (Contains Clams)', '2', '$3.75', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('3', 'Deep Fried Gyoza w/ Green Tea Salt', '2', '$4.80', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('3', 'Roasted Egg w/ Mentaiko', '2', '$5.90', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('3', 'Roasted Egg W/ Olive Truffle Sauce (Warm)', '2', '$5.90', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('3', 'Deep Fried Chicken w/ Salad', '2', '$8.05', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('3', 'Steamed Egg with Crab', '2', '$6.00', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('3', 'Cream Croquette', '2', '$5.15', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1'),
    ('3', 'Tempura Moriawase', '2', '$9.65', 'https://img.icons8.com/office/344/kawaii-french-fries.png', '1');



--try get auth from res table
select id from restaurant where managed_by = 5;

select item_id, menu.name, category.name as category_name, price, img_url, menu.visible from menu,category where menu.category_id = category.category_id and menu.restaurant_id = 1;