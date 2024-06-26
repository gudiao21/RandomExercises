CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  birthdate DATE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  isbn INT,
  title VARCHAR(100),
  language_from VARCHAR(25),
  genre VARCHAR(20),
  price DECIMAL(10,2),
  publication_date DATE,
  num_pages INT,
  in_stock INT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE author_books (
author_id INT REFERENCES authors(id),
book_id INT REFERENCES books(id)
);

CREATE TABLE clients (
  id SERIAL PRIMARY KEY,
  name VARCHAR(80),
  email VARCHAR(100),
  phone VARCHAR(15),
  birthday DATE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE salers (
id SERIAL PRIMARY KEY,
name VARCHAR(35),
phone_number BIGINT,
hired_in DATE,
birthday DATE,
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
  id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  client_id INT REFERENCES clients(id),
  saler_id INT REFERENCES salers(id),
  order_date DATE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE book_orders (
book_id INT REFERENCES books(id),
order_id INT REFERENCES orders(id)
);

CREATE TABLE Publishing_houses (
id INT SERIAL PRIMARY KEY,
name VARCHAR(25),
phone_num INT,
address text (60),
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURENT_TIMESTAMP,
updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURENT_TIMESTAMP
);

CREATE TABLE book_publishing_houses (
  book_id INT REFERENCES books(id),
  publishing_house_id INT REFERENCES publishing_houses(id)
);