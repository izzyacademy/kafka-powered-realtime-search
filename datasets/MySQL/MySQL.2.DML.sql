-- Connect to Docker Container
-- Authenticate and Select Target Database

-- Load Initial Data set
INSERT INTO `customers` (customer_id, first_name, last_name, email, date_created) VALUES
(599, 'April', 'Smith', 'asmith@example.org', NOW()),
(601, 'James', 'Mathew', 'jmathew@example.org', NOW()),
(607, 'Israel', 'Gonzalez', 'igonzalez@example.org', NOW()),
(613, 'Alex', 'Santiago', 'asantiago@example.org', NOW()),
(617, 'Jane', 'Smith', 'jane.smith@example.org', NOW()),
 
(619, 'Oliver', 'Twist', 'oliver@example.org', NOW()),
(631, 'Olivia', 'Pope', 'o.pope@example.org', NOW()),
(641, 'James', 'Bond', 'james007@example.org', NOW()),
(643, 'Silvia', 'Butriskaya', 'silvia@example.org', NOW()),
(647, 'James', 'England', 'jbritish@example.org', NOW()),
 
(659, 'Maria', 'Cuomo', 'mario.cuomo@example.org', NOW()),
(661, 'John', 'Laudati', 'jlaudati@example.org', NOW()),
(673, 'Alfonso', 'Patel', 'apatel@example.org', NOW()),
(677, 'Elizabeth', 'Zhang', 'liz.zhang@example.org', NOW()),
(683, 'Kofi', 'Obama', 'kobama@example.org', NOW()),
 
(691, 'Kramer', 'Center', 'kcenter@example.org', NOW()),
(701, 'Angel', 'Bravo', 'angel.bravo@example.org', NOW()),
(809, 'Michelle', 'Chanel', 'chanel.michelle@example.org', NOW()),
(811, 'Sabestien', 'Lok', 'lok@example.org', NOW()),
(821, 'Nancy', 'Pettite', 'n.pettite@example.org', NOW());

-- Display all the inserted records/rows
SELECT * FROM `customers`;

-- Use these DML statements during the demo

-- Create new record
INSERT INTO `customers` (customer_id, first_name, last_name, email, date_created) VALUES
(823, 'Mena', 'Bravo', 'mena.bravo@example.org', NOW());

INSERT INTO `customers` (customer_id, first_name, last_name, email, date_created) VALUES
(901, 'Izzy', 'Bravo', 'izzy.bravo@example.org', NOW());

SELECT * FROM `customers`;

-- Modify existing record

UPDATE customers SET first_name = 'Izzy' WHERE customer_id = 599;

UPDATE customers SET first_name = 'Mena2', last_name = 'Bravo2', email='mena@microsoft.com'
WHERE customer_id = 823;

SELECT * FROM `customers`;
-- Modify existing records
UPDATE customers SET date_modified = NOW() WHERE customer_id = 599;
UPDATE customers SET date_modified = NOW() WHERE customer_id = 601;

SELECT * FROM `customers`;

-- Remove existing records
DELETE FROM customers WHERE customer_id = 821;

SELECT * FROM `customers`;

