-- MIT License
-- Copyright (c) 2021 san k
-- -------------------------

-- DANGEROUS! Might break constrains when run on unprepared database. Recreate the schema first.
-- Enters sample data into the schema for Fluffy Best backend.

USE `fluffybest`;

-- Add sample data
-- -----------------------------------------------------

INSERT INTO language (alpha_two_code, name, native_name, date_format, currency)
VALUES ('EN', 'English', 'English', 'mon-dd, yyyy', 'USD');

INSERT INTO language (alpha_two_code, name, native_name, date_format, currency)
VALUES ('RU', 'Russian', 'Русский', 'dd.mm.yyyy', 'RUB');

INSERT INTO country (alpha_two_code, short_name, name)
VALUES ('RU', 'Россия', 'Российская Федерация');

INSERT INTO country (alpha_two_code, short_name, name)
VALUES ('US', 'США', 'Соединенные Штаты Америки');

-- TODO: replace with batch insert of empty rows, if possible.
INSERT INTO region_type (name)
VALUES ('область');

INSERT INTO region_type (name)
VALUES ('республика');

INSERT INTO region_type (name)
VALUES ('штат');

INSERT INTO region (type_id, name)
VALUES (1, 'Оренбургская');

INSERT INTO region (type_id, name)
VALUES (2, 'Башкортостан');

INSERT INTO region (type_id, name)
VALUES (3, 'Калифорния');

INSERT INTO locality_type (name)
VALUES ('город');

INSERT INTO locality (type_id, region_id, name)
VALUES (1, 1, 'Оренбург');

INSERT INTO locality (type_id, region_id, name)
VALUES (1, 2, 'Уфа');

INSERT INTO locality (type_id, region_id, name)
VALUES (1, 3, 'Сан-Франциско');

INSERT INTO address_type (name)
VALUES ('почтовый');

INSERT INTO address (address_type_id, country_id, locality_id, region_id, postal_code, street,
                     building)
VALUES (1, 1, 1, 1, '460021', 'ул. Чкалова', '15А');

INSERT INTO address (address_type_id, country_id, locality_id, region_id, postal_code, street,
                     building)
VALUES (1, 1, 2, 2, '320011', 'ул. Солнечная', '22');

INSERT INTO address (address_type_id, country_id, locality_id, region_id, postal_code, street,
                     building)
VALUES (1, 2, 3, 3, '3571', 'Flowers str', 'Cray house');

-- 1
INSERT INTO geo_coordinates (country_id, latitude, longitude)
VALUES (1, 51.77454129277207, 55.15962312303773);

-- 2
INSERT INTO geo_coordinates (country_id, latitude, longitude)
VALUES (1, 51.77379113062797, 55.16037414148665);

-- 3
INSERT INTO geo_coordinates (country_id, latitude, longitude)
VALUES (1, 51.77515867350963, 55.16534159233501);

-- 4
INSERT INTO geo_coordinates (country_id, latitude, longitude)
VALUES (1, 51.769305360823175, 55.194258914661965);

-- 5
INSERT INTO geo_coordinates (country_id, latitude, longitude)
VALUES (1, 51.771496282640044, 55.19372247306536);

-- 6
INSERT INTO geo_coordinates (country_id, latitude, longitude)
VALUES (1, 51.77146972664905, 55.19355081170561);

-- Dog
INSERT INTO animal_type (name, breed)
VALUES ('Собака', 'беспородная');

-- Cat
INSERT INTO animal_type (name, breed)
VALUES ('Кошка', 'беспородная');

-- Chipped means All good
INSERT INTO animal_status (name)
VALUES ('чипирован');

-- In distress
INSERT INTO animal_status (name)
VALUES ('в беде');

-- Died
INSERT INTO animal_status (name)
VALUES ('мертв');

-- In care
INSERT INTO animal_status (name)
VALUES ('под опекой');


SET @animal_id_1 = UUID_TO_BIN(UUID());
SET @animal_id_2 = UUID_TO_BIN(UUID());
SET @animal_id_3 = UUID_TO_BIN(UUID());
SET @animal_id_4 = UUID_TO_BIN(UUID());

INSERT INTO animal (id, name, birth_date, description, aggression_level, image_url, date_created,
                    last_updated, type_id, status_id)
VALUES (@animal_id_1, 'Боба', '2010-01-02',
        'Большой пес черного чвета с коричневой грудью. Любит прыгать, адекватный', 0,
        'assets/images/products/placeholder.png', NOW(), NOW(), 1, 1);
INSERT INTO animal (id, name, birth_date, description, aggression_level, image_url, date_created,
                    last_updated, type_id, status_id)
VALUES (@animal_id_2, 'Гефест', '2012-01-02',
        'Мелкий упырь, коренастый. Перелом лапы после наезда машины', 4,
        'assets/images/products/placeholder.png', NOW(), NOW(), 1, 2);
INSERT INTO animal (id, name, birth_date, description, aggression_level, image_url, date_created,
                    last_updated, type_id, status_id)
VALUES (@animal_id_3, 'Дана', NULL, 'Гаражная собака, реагирует на заход на территорию.', 6,
        'assets/images/products/placeholder.png', NOW(), NOW(), 1, 3);
INSERT INTO animal (id, name, birth_date, description, aggression_level, image_url, date_created,
                    last_updated, type_id, status_id)
VALUES (@animal_id_4, 'Шуша', '2012-03-11', 'Мелкая дворняжка. Временно на передержке.', 0,
        'assets/images/products/placeholder.png', NOW(), NOW(), 1, 4);

INSERT INTO animal_geo_coordinates (animal_id, geo_coordinates_id)
VALUES (@animal_id_1, 1);
INSERT INTO animal_geo_coordinates (animal_id, geo_coordinates_id)
VALUES (@animal_id_1, 2);
INSERT INTO animal_geo_coordinates (animal_id, geo_coordinates_id)
VALUES (@animal_id_1, 3);
INSERT INTO animal_geo_coordinates (animal_id, geo_coordinates_id)
VALUES (@animal_id_2, 4);
INSERT INTO animal_geo_coordinates (animal_id, geo_coordinates_id)
VALUES (@animal_id_2, 5);
INSERT INTO animal_geo_coordinates (animal_id, geo_coordinates_id)
VALUES (@animal_id_4, 6);

INSERT INTO animal_address (animal_id, address_id)
VALUES (@animal_id_4, 1);

-- Marketplace section of the application
-- -------------------------------------
-- -----------------------------------------------------
-- Categories
-- -----------------------------------------------------
INSERT INTO product_category(name)
VALUES ('Books');
INSERT INTO product_category(name)
VALUES ('Coffee Mugs');
INSERT INTO product_category(name)
VALUES ('Mouse Pads');
INSERT INTO product_category(name)
VALUES ('Luggage Tags');

-- -----------------------------------------------------
-- Books
-- -----------------------------------------------------
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'BOOK-TECH-1000', 'Crash Course in Python',
        'Learn Python at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',
        'assets/images/products/books/book-luv2code-1000.png', 1, 100, 14.99, 1, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'BOOK-TECH-1001', 'Become a Guru in JavaScript',
        'Learn JavaScript at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',
        'assets/images/products/books/book-luv2code-1001.png', 1, 100, 20.99, 1, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'BOOK-TECH-1002', 'Exploring Vue.js',
        'Learn Vue.js at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',
        'assets/images/products/books/book-luv2code-1002.png', 1, 100, 14.99, 1, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'BOOK-TECH-1003', 'Advanced Techniques in Big Data',
        'Learn Big Data at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',
        'assets/images/products/books/book-luv2code-1003.png', 1, 100, 13.99, 1, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'BOOK-TECH-1004', 'Crash Course in Big Data',
        'Learn Big Data at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',
        'assets/images/products/books/book-luv2code-1004.png', 1, 100, 18.99, 1, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'BOOK-TECH-1005', 'JavaScript Cookbook',
        'Learn JavaScript at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',
        'assets/images/products/books/book-luv2code-1005.png', 1, 100, 23.99, 1, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'BOOK-TECH-1006', 'Beginners Guide to SQL',
        'Learn SQL at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',
        'assets/images/products/books/book-luv2code-1006.png', 1, 100, 14.99, 1, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'BOOK-TECH-1007', 'Advanced Techniques in JavaScript',
        'Learn JavaScript at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',
        'assets/images/products/books/book-luv2code-1007.png', 1, 100, 16.99, 1, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'BOOK-TECH-1008', 'Introduction to Spring Boot',
        'Learn Spring Boot at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',
        'assets/images/products/books/book-luv2code-1008.png', 1, 100, 25.99, 1, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'BOOK-TECH-1009', 'Become a Guru in React.js',
        'Learn React.js at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',
        'assets/images/products/books/book-luv2code-1009.png', 1, 100, 23.99, 1, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'BOOK-TECH-1010', 'Beginners Guide to Data Science',
        'Learn Data Science at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',
        'assets/images/products/books/book-luv2code-1010.png', 1, 100, 24.99, 1, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'BOOK-TECH-1011', 'Advanced Techniques in Java',
        'Learn Java at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',
        'assets/images/products/books/book-luv2code-1011.png', 1, 100, 19.99, 1, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'BOOK-TECH-1012', 'Exploring DevOps',
        'Learn DevOps at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',
        'assets/images/products/books/book-luv2code-1012.png', 1, 100, 24.99, 1, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'BOOK-TECH-1013', 'The Expert Guide to SQL',
        'Learn SQL at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',
        'assets/images/products/books/book-luv2code-1013.png', 1, 100, 19.99, 1, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'BOOK-TECH-1014', 'Introduction to SQL',
        'Learn SQL at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',
        'assets/images/products/books/book-luv2code-1014.png', 1, 100, 22.99, 1, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'BOOK-TECH-1015', 'The Expert Guide to JavaScript',
        'Learn JavaScript at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',
        'assets/images/products/books/book-luv2code-1015.png', 1, 100, 22.99, 1, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'BOOK-TECH-1016', 'Exploring React.js',
        'Learn React.js at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',
        'assets/images/products/books/book-luv2code-1016.png', 1, 100, 27.99, 1, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'BOOK-TECH-1017', 'Advanced Techniques in React.js',
        'Learn React.js at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',
        'assets/images/products/books/book-luv2code-1017.png', 1, 100, 13.99, 1, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'BOOK-TECH-1018', 'Introduction to C#',
        'Learn C# at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',
        'assets/images/products/books/book-luv2code-1018.png', 1, 100, 26.99, 1, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'BOOK-TECH-1019', 'Crash Course in JavaScript',
        'Learn JavaScript at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',
        'assets/images/products/books/book-luv2code-1019.png', 1, 100, 13.99, 1, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'BOOK-TECH-1020', 'Introduction to Machine Learning',
        'Learn Machine Learning at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',
        'assets/images/products/books/book-luv2code-1020.png', 1, 100, 19.99, 1, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'BOOK-TECH-1021', 'Become a Guru in Java',
        'Learn Java at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',
        'assets/images/products/books/book-luv2code-1021.png', 1, 100, 18.99, 1, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'BOOK-TECH-1022', 'Introduction to Python',
        'Learn Python at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',
        'assets/images/products/books/book-luv2code-1022.png', 1, 100, 26.99, 1, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'BOOK-TECH-1023', 'Advanced Techniques in C#',
        'Learn C# at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',
        'assets/images/products/books/book-luv2code-1023.png', 1, 100, 22.99, 1, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'BOOK-TECH-1024', 'The Expert Guide to Machine Learning',
        'Learn Machine Learning at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',
        'assets/images/products/books/book-luv2code-1024.png', 1, 100, 16.99, 1, NOW());

-- -----------------------------------------------------
-- Coffee Mugs
-- -----------------------------------------------------
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'COFFEEMUG-1000', 'Coffee Mug - Express',
        'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',
        'assets/images/products/coffeemugs/coffeemug-luv2code-1000.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'COFFEEMUG-1001', 'Coffee Mug - Cherokee',
        'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',
        'assets/images/products/coffeemugs/coffeemug-luv2code-1001.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'COFFEEMUG-1002', 'Coffee Mug - Sweeper',
        'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',
        'assets/images/products/coffeemugs/coffeemug-luv2code-1002.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'COFFEEMUG-1003', 'Coffee Mug - Aspire',
        'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',
        'assets/images/products/coffeemugs/coffeemug-luv2code-1003.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'COFFEEMUG-1004', 'Coffee Mug - Dorian',
        'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',
        'assets/images/products/coffeemugs/coffeemug-luv2code-1004.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'COFFEEMUG-1005', 'Coffee Mug - Columbia',
        'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',
        'assets/images/products/coffeemugs/coffeemug-luv2code-1005.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'COFFEEMUG-1006', 'Coffee Mug - Worthing',
        'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',
        'assets/images/products/coffeemugs/coffeemug-luv2code-1006.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'COFFEEMUG-1007', 'Coffee Mug - Oak Cliff',
        'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',
        'assets/images/products/coffeemugs/coffeemug-luv2code-1007.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'COFFEEMUG-1008', 'Coffee Mug - Tachyon',
        'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',
        'assets/images/products/coffeemugs/coffeemug-luv2code-1008.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'COFFEEMUG-1009', 'Coffee Mug - Pan',
        'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',
        'assets/images/products/coffeemugs/coffeemug-luv2code-1009.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'COFFEEMUG-1010', 'Coffee Mug - Phase',
        'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',
        'assets/images/products/coffeemugs/coffeemug-luv2code-1010.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'COFFEEMUG-1011', 'Coffee Mug - Falling',
        'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',
        'assets/images/products/coffeemugs/coffeemug-luv2code-1011.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'COFFEEMUG-1012', 'Coffee Mug - Wispy',
        'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',
        'assets/images/products/coffeemugs/coffeemug-luv2code-1012.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'COFFEEMUG-1013', 'Coffee Mug - Arlington',
        'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',
        'assets/images/products/coffeemugs/coffeemug-luv2code-1013.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'COFFEEMUG-1014', 'Coffee Mug - Gazing',
        'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',
        'assets/images/products/coffeemugs/coffeemug-luv2code-1014.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'COFFEEMUG-1015', 'Coffee Mug - Azura',
        'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',
        'assets/images/products/coffeemugs/coffeemug-luv2code-1015.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'COFFEEMUG-1016', 'Coffee Mug - Quantum Leap',
        'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',
        'assets/images/products/coffeemugs/coffeemug-luv2code-1016.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'COFFEEMUG-1017', 'Coffee Mug - Light Years',
        'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',
        'assets/images/products/coffeemugs/coffeemug-luv2code-1017.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'COFFEEMUG-1018', 'Coffee Mug - Taylor',
        'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',
        'assets/images/products/coffeemugs/coffeemug-luv2code-1018.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'COFFEEMUG-1019', 'Coffee Mug - Gracia',
        'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',
        'assets/images/products/coffeemugs/coffeemug-luv2code-1019.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'COFFEEMUG-1020', 'Coffee Mug - Relax',
        'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',
        'assets/images/products/coffeemugs/coffeemug-luv2code-1020.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'COFFEEMUG-1021', 'Coffee Mug - Windermere',
        'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',
        'assets/images/products/coffeemugs/coffeemug-luv2code-1021.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'COFFEEMUG-1022', 'Coffee Mug - Prancer',
        'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',
        'assets/images/products/coffeemugs/coffeemug-luv2code-1022.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'COFFEEMUG-1023', 'Coffee Mug - Recursion',
        'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',
        'assets/images/products/coffeemugs/coffeemug-luv2code-1023.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'COFFEEMUG-1024', 'Coffee Mug - Treasure',
        'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',
        'assets/images/products/coffeemugs/coffeemug-luv2code-1024.png', 1, 100, 18.99, 2, NOW());

-- -----------------------------------------------------
-- Mouse Pads
-- -----------------------------------------------------
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'MOUSEPAD-1000', 'Mouse Pad - Express',
        'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',
        'assets/images/products/mousepads/mousepad-luv2code-1000.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'MOUSEPAD-1001', 'Mouse Pad - Cherokee',
        'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',
        'assets/images/products/mousepads/mousepad-luv2code-1001.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'MOUSEPAD-1002', 'Mouse Pad - Sweeper',
        'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',
        'assets/images/products/mousepads/mousepad-luv2code-1002.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'MOUSEPAD-1003', 'Mouse Pad - Aspire',
        'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',
        'assets/images/products/mousepads/mousepad-luv2code-1003.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'MOUSEPAD-1004', 'Mouse Pad - Dorian',
        'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',
        'assets/images/products/mousepads/mousepad-luv2code-1004.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'MOUSEPAD-1005', 'Mouse Pad - Columbia',
        'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',
        'assets/images/products/mousepads/mousepad-luv2code-1005.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'MOUSEPAD-1006', 'Mouse Pad - Worthing',
        'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',
        'assets/images/products/mousepads/mousepad-luv2code-1006.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'MOUSEPAD-1007', 'Mouse Pad - Oak Cliff',
        'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',
        'assets/images/products/mousepads/mousepad-luv2code-1007.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'MOUSEPAD-1008', 'Mouse Pad - Tachyon',
        'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',
        'assets/images/products/mousepads/mousepad-luv2code-1008.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'MOUSEPAD-1009', 'Mouse Pad - Pan',
        'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',
        'assets/images/products/mousepads/mousepad-luv2code-1009.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'MOUSEPAD-1010', 'Mouse Pad - Phase',
        'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',
        'assets/images/products/mousepads/mousepad-luv2code-1010.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'MOUSEPAD-1011', 'Mouse Pad - Falling',
        'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',
        'assets/images/products/mousepads/mousepad-luv2code-1011.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'MOUSEPAD-1012', 'Mouse Pad - Wispy',
        'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',
        'assets/images/products/mousepads/mousepad-luv2code-1012.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'MOUSEPAD-1013', 'Mouse Pad - Arlington',
        'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',
        'assets/images/products/mousepads/mousepad-luv2code-1013.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'MOUSEPAD-1014', 'Mouse Pad - Gazing',
        'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',
        'assets/images/products/mousepads/mousepad-luv2code-1014.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'MOUSEPAD-1015', 'Mouse Pad - Azura',
        'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',
        'assets/images/products/mousepads/mousepad-luv2code-1015.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'MOUSEPAD-1016', 'Mouse Pad - Quantum Leap',
        'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',
        'assets/images/products/mousepads/mousepad-luv2code-1016.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'MOUSEPAD-1017', 'Mouse Pad - Light Years',
        'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',
        'assets/images/products/mousepads/mousepad-luv2code-1017.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'MOUSEPAD-1018', 'Mouse Pad - Taylor',
        'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',
        'assets/images/products/mousepads/mousepad-luv2code-1018.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'MOUSEPAD-1019', 'Mouse Pad - Gracia',
        'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',
        'assets/images/products/mousepads/mousepad-luv2code-1019.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'MOUSEPAD-1020', 'Mouse Pad - Relax',
        'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',
        'assets/images/products/mousepads/mousepad-luv2code-1020.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'MOUSEPAD-1021', 'Mouse Pad - Windermere',
        'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',
        'assets/images/products/mousepads/mousepad-luv2code-1021.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'MOUSEPAD-1022', 'Mouse Pad - Prancer',
        'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',
        'assets/images/products/mousepads/mousepad-luv2code-1022.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'MOUSEPAD-1023', 'Mouse Pad - Recursion',
        'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',
        'assets/images/products/mousepads/mousepad-luv2code-1023.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'MOUSEPAD-1024', 'Mouse Pad - Treasure',
        'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',
        'assets/images/products/mousepads/mousepad-luv2code-1024.png', 1, 100, 17.99, 3, NOW());

-- -----------------------------------------------------
-- Luggage Tags
-- -----------------------------------------------------
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'LUGGAGETAG-1000', 'Luggage Tag - Cherish',
        'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',
        'assets/images/products/luggagetags/luggagetag-luv2code-1000.png', 1, 100, 16.99, 4, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'LUGGAGETAG-1001', 'Luggage Tag - Adventure',
        'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',
        'assets/images/products/luggagetags/luggagetag-luv2code-1001.png', 1, 100, 16.99, 4, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'LUGGAGETAG-1002', 'Luggage Tag - Skyline',
        'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',
        'assets/images/products/luggagetags/luggagetag-luv2code-1002.png', 1, 100, 16.99, 4, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'LUGGAGETAG-1003', 'Luggage Tag - River',
        'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',
        'assets/images/products/luggagetags/luggagetag-luv2code-1003.png', 1, 100, 16.99, 4, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'LUGGAGETAG-1004', 'Luggage Tag - Trail Steps',
        'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',
        'assets/images/products/luggagetags/luggagetag-luv2code-1004.png', 1, 100, 16.99, 4, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'LUGGAGETAG-1005', 'Luggage Tag - Blooming',
        'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',
        'assets/images/products/luggagetags/luggagetag-luv2code-1005.png', 1, 100, 16.99, 4, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'LUGGAGETAG-1006', 'Luggage Tag - Park',
        'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',
        'assets/images/products/luggagetags/luggagetag-luv2code-1006.png', 1, 100, 16.99, 4, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'LUGGAGETAG-1007', 'Luggage Tag - Beauty',
        'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',
        'assets/images/products/luggagetags/luggagetag-luv2code-1007.png', 1, 100, 16.99, 4, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'LUGGAGETAG-1008', 'Luggage Tag - Water Fall',
        'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',
        'assets/images/products/luggagetags/luggagetag-luv2code-1008.png', 1, 100, 16.99, 4, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'LUGGAGETAG-1009', 'Luggage Tag - Trail',
        'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',
        'assets/images/products/luggagetags/luggagetag-luv2code-1009.png', 1, 100, 16.99, 4, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'LUGGAGETAG-1010', 'Luggage Tag - Skyscraper',
        'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',
        'assets/images/products/luggagetags/luggagetag-luv2code-1010.png', 1, 100, 16.99, 4, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'LUGGAGETAG-1011', 'Luggage Tag - Leaf',
        'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',
        'assets/images/products/luggagetags/luggagetag-luv2code-1011.png', 1, 100, 16.99, 4, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'LUGGAGETAG-1012', 'Luggage Tag - Jungle',
        'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',
        'assets/images/products/luggagetags/luggagetag-luv2code-1012.png', 1, 100, 16.99, 4, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'LUGGAGETAG-1013', 'Luggage Tag - Shoreline',
        'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',
        'assets/images/products/luggagetags/luggagetag-luv2code-1013.png', 1, 100, 16.99, 4, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'LUGGAGETAG-1014', 'Luggage Tag - Blossom',
        'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',
        'assets/images/products/luggagetags/luggagetag-luv2code-1014.png', 1, 100, 16.99, 4, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'LUGGAGETAG-1015', 'Luggage Tag - Lock',
        'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',
        'assets/images/products/luggagetags/luggagetag-luv2code-1015.png', 1, 100, 16.99, 4, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'LUGGAGETAG-1016', 'Luggage Tag - Cafe',
        'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',
        'assets/images/products/luggagetags/luggagetag-luv2code-1016.png', 1, 100, 16.99, 4, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'LUGGAGETAG-1017', 'Luggage Tag - Darling',
        'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',
        'assets/images/products/luggagetags/luggagetag-luv2code-1017.png', 1, 100, 16.99, 4, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'LUGGAGETAG-1018', 'Luggage Tag - Full Stack',
        'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',
        'assets/images/products/luggagetags/luggagetag-luv2code-1018.png', 1, 100, 16.99, 4, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'LUGGAGETAG-1019', 'Luggage Tag - Courtyard',
        'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',
        'assets/images/products/luggagetags/luggagetag-luv2code-1019.png', 1, 100, 16.99, 4, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'LUGGAGETAG-1020', 'Luggage Tag - Coaster',
        'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',
        'assets/images/products/luggagetags/luggagetag-luv2code-1020.png', 1, 100, 16.99, 4, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'LUGGAGETAG-1021', 'Luggage Tag - Bridge',
        'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',
        'assets/images/products/luggagetags/luggagetag-luv2code-1021.png', 1, 100, 16.99, 4, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'LUGGAGETAG-1022', 'Luggage Tag - Sunset',
        'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',
        'assets/images/products/luggagetags/luggagetag-luv2code-1022.png', 1, 100, 16.99, 4, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'LUGGAGETAG-1023', 'Luggage Tag - Flames',
        'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',
        'assets/images/products/luggagetags/luggagetag-luv2code-1023.png', 1, 100, 16.99, 4, NOW());
INSERT INTO product (id, sku, name, description, image_url, active, units_in_stock, unit_price,
                     category_id, date_created)
VALUES (UUID_TO_BIN(UUID()), 'LUGGAGETAG-1024', 'Luggage Tag - Countryside',
        'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',
        'assets/images/products/luggagetags/luggagetag-luv2code-1024.png', 1, 100, 16.99, 4, NOW());


