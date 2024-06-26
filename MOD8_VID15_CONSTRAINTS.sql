CREATE TABLE users (
id SERIAL PRIMARY KEY
username VARCHAR(60) NOT NULL UNIQUE,
email VARCHAR(100) NOT NULL UNIQUE,
password VARCHAR(30),
last_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
is_admin BOOLEAN DEFAULT false,
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE profiles (
id SERIAL PRIMARY KEY,
first_name VARCHAR(60) NOT NULL,
last_name VARCHAR(60) NOT NULL,
birthdate DATE,
avatar_url VARCHAR(150),
user_id INT REFERENCES users(id),
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRRENT_TIMESTAMP,
updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
id SERIAL PRIMARY KEY,
name VARCHAR(60) NUT NULL
);

CREATE TABLE articles (
id SERIAL PRIMARY KEY,
title VARCHAR(100) NUT NULL,
content TEXT NOT NULL,
tags VARCHAR(30),
views INT,
likes INT,
user_id INT REFERENCES users(id),
is_published BOOLEAN DEFAULT false,
category_id INT REFERENCES categories(id),
published_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE comments (
id SERIAL PRIMARY KEY,
content text,
article_id INT REFENCES articles(id),
user_id INT REFENCES user(id),
is_deleted BOOLEAN DEFAULT false,
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE favorites (
id SERIAL PRIMARY KEY,
user_id REFERENCES user(id),
article_id REFERENCES article(id),
favorited_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

