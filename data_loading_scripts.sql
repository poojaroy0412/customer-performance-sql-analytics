-- Load Products
LOAD DATA INFILE 'C:/path/to/your/products.csv'
INTO TABLE dim_products
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load Customers
LOAD DATA INFILE 'C:/path/to/your/customers.csv'
INTO TABLE dim_customers
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load Sales
LOAD DATA INFILE 'C:/path/to/your/sales.csv'
INTO TABLE fact_sales
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;