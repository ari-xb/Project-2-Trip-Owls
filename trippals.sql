CREATE DATABASE trippals;

CREATE TABLE users (
  id SERIAL4 PRIMARY KEY,
  email VARCHAR(300),
  password_digest VARCHAR(400),
  username VARCHAR(40),
  gender VARCHAR(10),
  age_group VARCHAR(10),
  home_country VARCHAR(50),
  prof_pic_url TEXT
);

CREATE TABLE trips (
  id SERIAL4 PRIMARY KEY,
  dest_country VARCHAR(50),
  month VARCHAR(15),
  gender VARCHAR(10),
  age_group VARCHAR(10),
  body TEXT,
  user_id INTEGER
);

ALTER TABLE trips ADD user_id INTEGER;

INSERT INTO users (email, password_digest)
VALUES ('user1@gmail.com', 'userpass');

INSERT INTO profiles (email, password_digest, username, gender, age_group, home_country, user_id)
VALUES ('user1@gmail.com', 'userpass', 'user23', 'Male', '21 - 30', 'Australia',);

INSERT INTO profiles (dest_country, month, gender, age_group, body, user_id)
VALUES ('USA', 'May', 'Male', '21 - 30', 'Looking to travel for 2 weeks', 1);
