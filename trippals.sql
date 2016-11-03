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
  trip_name VARCHAR(50),
  dest_country VARCHAR(50),
  month VARCHAR(15),
  gender VARCHAR(10),
  age_group VARCHAR(10),
  body TEXT,
  user_id INTEGER
);

ALTER TABLE trips ADD trip_name VARCHAR(50);

INSERT INTO users (email, password_digest, username, gender, age_group, home_country, prof_pic_url)
VALUES
user = User.new(email: 'user1@gmail.com', password: 'userpass', username: 'user23', gender: 'Male', age_group: '21 - 30', home_country: 'Australia');
user.save

INSERT INTO trips (dest_country, month, gender, age_group, body, user_id)
VALUES
trip = Trip.new(dest_country: 'USA', month: 'May', gender: 'Male', age_group: '21 - 30', body: 'Looking to travel for 2 weeks', user_id: 1);
trip.save

login testing:
email: 'user1@gmail.com', password: 'userpass'
