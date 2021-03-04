CREATE TABLE dates (
  id SERIAL PRIMARY KEY, 
  date DATE, 
  space_id INT, 
  available BOOLEAN, 
  FOREIGN KEY (space_id) 
  REFERENCES spaces(id));