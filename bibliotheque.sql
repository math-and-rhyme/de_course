-- CREATE DATABASE library
--     WITH
--     OWNER = math_rhyme
--     ENCODING = 'UTF8';

CREATE TABLE readers (
    library_card BIGINT PRIMARY KEY,
    full_name TEXT NOT NULL,
    adress TEXT,
    phone_number TEXT
);

CREATE TABLE publishing_house (
    house_name TEXT PRIMARY KEY,
    city TEXT NOT NULL
);

CREATE TABLE books (
    book_code SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    authors TEXT NOT NULL,
    publishing_year INTEGER,
    volume INTEGER,
    price INTEGER,
    number_of_copies INTEGER,
    house_name TEXT,
    FOREIGN KEY (house_name)
        REFERENCES publishing_house (house_name)
);

CREATE TABLE book_issuances (
    issuance_id SERIAL PRIMARY KEY,
    library_user BIGINT NOT NULL,
    book_code BIGINT NOT NULL,
    created_on TIMESTAMP NOT NULL,
    returned_on TIMESTAMP,
    FOREIGN KEY (library_user)
        REFERENCES readers (library_card),
    FOREIGN KEY (book_code)
        REFERENCES books (book_code)
);

-- INSERT INTO readers VALUES(123, 'Mark', 'Paris', '+5(555)777-72-45');
-- INSERT INTO books VALUES(1, 'A GOOD BOOK', 'AUTHOR 1', 2023, 0, 1);
-- INSERT INTO book_issuances VALUES(1, 123, 1, '2023-12-11 23:36:45');

-- SELECT * FROM readers;
-- SELECT * FROM books;
-- SELECT * FROM book_issuances;

