CREATE TABLE booking_requests (
  id SERIAL PRIMARY KEY,
  confirmed BOOLEAN,
  space_id INT,
  date_id INT,
  customer_id INT,
  landlord_id INT,
  FOREIGN KEY (space_id) REFERENCES spaces(id),
  FOREIGN KEY (date_id) REFERENCES dates(id),
  FOREIGN KEY (customer_id) REFERENCES users(id),
  FOREIGN KEY (landlord_id) REFERENCES users(id));
