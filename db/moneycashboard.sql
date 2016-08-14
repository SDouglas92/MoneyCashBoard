DROP TABLE transactions;
DROP TABLE merchant;

CREATE TABLE merchant(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL8 PRIMARY KEY,
  amount INT2,
  merchant_id INT8 REFERENCES merchant(id)
);