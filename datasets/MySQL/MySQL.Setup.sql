
-- Log into the remote container
-- kubectl -n mysql56 exec deploy/mysql -it -- bash
-- kubectl -n mysql56 exec deploy/mysql -it -- mysql -u root -pA8B4CD3F {databaseName}

-- Connect to the database server locally
-- mysql -u root -pA8B4CD3F


-- Select the MySQL database
USE mysql;

-- Take a look at all the current users
SELECT User,Host,Password FROM mysql.user;

-- Create a new root user and grant permissions to all resources
--- CREATE USER 'root'@'localhost' IDENTIFIED BY 'db3k4Cc';

-- GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost';

-- Remove all unsafe user accounts
DELETE FROM mysql.user WHERE LENGTH(User) = 0 OR LENGTH(Password) = 0;

--- Set up Database for storing application data
DROP DATABASE IF EXISTS ecommerce;
CREATE DATABASE ecommerce DEFAULT CHARACTER SET utf8;

DROP DATABASE IF EXISTS inventory;
CREATE DATABASE inventory DEFAULT CHARACTER SET utf8;

-- Creates the application user
CREATE USER 'application'@'%' IDENTIFIED BY 'db3k4Cc';

-- Grants privilges to the application user for the ecommerce database
GRANT ALL PRIVILEGES ON ecommerce.* TO 'application'@'%';
GRANT ALL PRIVILEGES ON inventory.* TO 'application'@'%';

-- Flush privilleges
FLUSH PRIVILEGES;

--- Set up Debezium Connector User
CREATE USER 'debezium'@'%' IDENTIFIED BY 'db3k4Cc';

--- Grant the appropriate privileges to the debezium user
GRANT SELECT, RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'debezium'@'%' IDENTIFIED BY 'db3k4Cc';

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'debezium'@'%';
SHOW GRANTS FOR 'application'@'%';


