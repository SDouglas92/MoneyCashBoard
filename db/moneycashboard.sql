DROP TABLE transactions;
DROP TABLE merchants;

CREATE TABLE merchants(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL8 PRIMARY KEY,
  amount INT2,
  merchant_id INT8 REFERENCES merchants(id),
  tag VARCHAR(255)
);