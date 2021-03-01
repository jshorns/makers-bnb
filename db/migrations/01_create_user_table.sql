CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  name VARCHAR(150),
  username VARCHAR(20),
  email VARCHAR(320),
  password VARCHAR(500),
  UNIQUE(username, email));
