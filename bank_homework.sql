-- In case there is already a bank_homework database, drop it
DROP DATABASE IF EXISTS bank_homework;

-- Create a bank_homework database
CREATE DATABASE bank_homework;

-- Connect to the bank_homework databases
\c bank_homework

-- Create a payments table
-- The table should have columns of id, created_at (datetime), amount, payer_name,
-- recipient_name, and description with the appropriate datatypes
CREATE TABLE payments (
  id SERIAL PRIMARY KEY,
  created_at DATE,
  amount NUMERIC(8,2), -- Six before, two after
  payer_name TEXT,
  recipient_name TEXT,
  description TEXT
);
-- Alter the payments table, add the column of `zipcode`
-- to specify where the transaction was made
ALTER TABLE payments ADD COLUMN zipcode TEXT; -- COLUMN is optional here

-- Insert 20 rows into the payments table
-- The first of these payments should be deposits
-- try to keep the accounts positive and have at least three different payers.
INSERT INTO payments (created_at, amount, payer_name, recipient_name, description, zipcode) VALUES
  ('2013-08-15', 1.00, 'Jon Snow', 'Mance Raider', 'For defense of the wall', '02760'),
  ('2013-05-15', 2.00, 'Jon Snow', 'Mance Raider', 'For defense of the wall', '02760'),
  ('2013-03-15', 3.00, 'Jon Snow', 'Mance Raider', 'For defense of the wall', '02760'),
  ('2013-08-15', 4.00, 'Jon Snow', 'Mance Raider', 'For defense of the wall', '02760'),
  ('2013-06-15', 5.00, 'Jon Snow', 'Mance Raider', 'For defense of the wall', '02760'),
  ('2013-01-15', 6.00, 'Tyrion Lannister', 'Tywin Lannister', 'For Fathers Day', '02760'),
  ('2013-04-15', 7.00, 'Tyrion Lannister', 'Tywin Lannister', 'For Fathers Day', '02760'),
  ('2013-06-15', 8.00, 'Tyrion Lannister', 'Tywin Lannister', 'For Fathers Day', '02760'),
  ('2013-09-15', 9.00, 'Tyrion Lannister', 'Tywin Lannister', 'For Fathers Day', '02760'),
  ('2013-10-15', 10.00, 'Tyrion Lannister', 'Tywin Lannister', 'For Fathers Day', '02760'),
  ('2013-12-15', 11.00, 'Theon Greyjoy', 'Ramsay Bolton', 'For education', '02760'),
  ('2013-02-15', 12.00, 'Theon Greyjoy', 'Ramsay Bolton', 'For education', '02760'),
  ('2013-02-15', 13.00, 'Theon Greyjoy', 'Ramsay Bolton', 'For education', '02760'),
  ('2013-08-15', 14.00, 'Theon Greyjoy', 'Ramsay Bolton', 'For education', '02760'),
  ('2013-05-15', 15.00, 'Theon Greyjoy', 'Ramsay Bolton', 'For education', '02760'),
  ('2013-01-15', 16.00, 'Arya Stark', 'Meryn Trant','', '02760'),
  ('2013-01-15', 17.00, 'Arya Stark', 'Meryn Trant','', '02760'),
  ('2014-06-18', 18.00, 'Arya Stark', 'Meryn Trant','', '02760'),
  ('2014-06-17', 19.00, 'Arya Stark', 'Meryn Trant','', '02760'),
  ('2014-06-16', 20.00, 'Arya Stark', 'Meryn Trant','', '02760')
;

-- You receive notice that the payment with id of 9 is $10 too low.
-- Alter that row so that it is corrected
UPDATE payments SET amount = amount + '10.00' WHERE id = 9;

-- Delete all payments with an amount under $2
DELETE FROM payments WHERE amount < 2.00; -- works

-- Select all entries from the payments table
SELECT * FROM payments; -- Works

-- In a single query, output all payments ordered from the largest to the smallest
SELECT * FROM payments ORDER BY amount;

-- In a single query, output the names of all distinct recipients
SELECT DISTINCT recipient_name FROM payments -- Works

-- In a single query, select all payments created in the past week
SELECT * FROM payments WHERE created_at > NOW() - '7 days'::interval; -- Cast to an interval

-- In a single query, select all payments with a blank description
SELECT * FROM payments WHERE description IS NULL; -- Works for null
SELECT * FROM payments WHERE description = ''; -- Works for blank

-- In a single query, select all payments matching the name of one of the payers (choose any single one)
SELECT * FROM payments WHERE payer_name = 'Jon Snow'; -- Works
