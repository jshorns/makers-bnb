CREATE TABLE spaces(
  id SERIAL PRIMARY KEY,
  user_id INT,
  name VARCHAR(150),
  description VARCHAR(2000),
  price MONEY, 
  FOREIGN KEY (user_id)
  REFERENCES users(id));
