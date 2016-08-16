DROP TABLE transactions;
DROP TABLE tags;
DROP TABLE merchants;

CREATE TABLE merchants(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE tags(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL8 PRIMARY KEY,
  amount FLOAT,
  merchant_id INT8 REFERENCES merchants(id) ON DELETE CASCADE,
  tag_id INT8 REFERENCES tags(id)
);

INSERT INTO tags (name) VALUES ('Food');
INSERT INTO tags (name) VALUES ('Fuel');
INSERT INTO tags (name) VALUES ('Games');

INSERT INTO merchants (name) VALUES ('Tesco');
INSERT INTO merchants (name) VALUES ('Asda');
INSERT INTO merchants (name) VALUES ('lidl');

